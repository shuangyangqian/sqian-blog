# logstash配置多个pipeline #

logstash从kafka取数据，存储到es集群中。根据topic和type分类，然后存储到不同的index中。忽然发现es中的数据比kafka中的数据要多，最终发现是因为logstash同一个pipeline会把conf.d下的配置文件写成一个配置，所以导致数据在写入index的时候会重复写入。


## 问题还原： ##

/etc/logstash/pipeline.yml配置：


    - pipeline.id: main
      path.config: "/etc/logstash/conf.d/*.conf"

上述配置的意思是，所有在`/etc/logstash/conf.d/*.conf`的配置都会走pipeline_id为main的pipeline，如果logstash程序启动之后，会将所有该目录下的conf配置压缩成一个文件来进行数据传输。

挑出两个比较典型的配置来观察：

	cat /etc/logstash/conf/1.conf

    input {
	 kafka {
        bootstrap_servers => ["xxx:9092,xxx:9092,xxx:9092"]
        topics => "topicA"
        type => "tomcat"
        consumer_threads => 5 
        decorate_events => true
        codec => "json"
        client_id => "topicA-tomcat"
        group_id => "topicA-tomcat"
	   }
    kafka {
        bootstrap_servers => ["xxx:9092,xxx:9092,xxx:9092"]
        topics => "topicA"
        type => "redis"
        consumer_threads => 5 
        decorate_events => true
        codec => "json"
        client_id => "topicA-redis"
        group_id => "topicA-redis"
	   }

	}

	output {
        if [type] == "tomcat"{
            elasticsearch {
                hosts => ["xxxx:9200", "xxxx:9200", "xxxx:9200"]
                index => "topicA-%{+YYYY.MM.dd}"
                user => elastic
                password => xxxx
            }
        }
        if [type] == "redis"{
            elasticsearch {
                hosts => ["xxxx:9200", "xxxx:9200", "xxxx:9200"]
                index => "topicA-%{+YYYY.MM.dd}"
                user => elastic
                password => xxxx
            }
        }
       }

另外一个配置文件

	cat /etc/logstash/conf/2.conf

    input {
	 kafka {
        bootstrap_servers => ["xxx:9092,xxx:9092,xxx:9092"]
        topics => "topicB"
        type => "tomcat"
        consumer_threads => 5 
        decorate_events => true
        codec => "json"
        client_id => "topicB-tomcat"
        group_id => "topicB-tomcat"
	   }
    kafka {
        bootstrap_servers => ["xxx:9092,xxx:9092,xxx:9092"]
        topics => "topicB"
        type => "redis"
        consumer_threads => 5 
        decorate_events => true
        codec => "json"
        client_id => "topicB-redis"
        group_id => "topicB-redis"
	   }

	}

	output {
        if [type] == "tomcat"{
            elasticsearch {
                hosts => ["xxxx:9200", "xxxx:9200", "xxxx:9200"]
                index => "topicB-%{+YYYY.MM.dd}"
                user => elastic
                password => xxxx
            }
        }
        if [type] == "redis"{
            elasticsearch {
                hosts => ["xxxx:9200", "xxxx:9200", "xxxx:9200"]
                index => "topicB-%{+YYYY.MM.dd}"
                user => elastic
                password => xxxx
            }
        }
       }

上述两个配置文件分别从卡夫卡中的topicA和topicB来消费数据，但是二者具有相同的type，因此上述在数据写入ed的index的时候会出现数据重复写入。

按照kibana的页面上线数的数据流向

            -------------    ------------    ------------
            |   kafka   |    |  kafka   |    |   kafka  |
            -------------    ------------    ------------
                 \                |               /
                  \               |              /
                   \              |             /
                    \             |            /
                     \            |           /
                      \           |          /
                     --------------------------
                     |         queue          |
                     --------------------------
                                / \
                               /   \ 
                              /     \
                             /       \
                   -------------    ------------
                   |type=tomcat|    |type=redis|
                   -------------    ------------
                         |               |
                   -------------    ------------
                   |     es    |    |    es    |
                   -------------    ------------

上述流程图是对应每个pipeline的效果，因此要想实现每个toipc每个type都对应一个独立的index，需要配置多个pipeline。

## 多个pipelines配置 ##
           
配置pipelines.yml

	# cat pipelines.yml 
	# This file is where you define your pipelines. You can define multiple.
	# For more information on multiple pipelines, see the documentation:
	#   https://www.elastic.co/guide/en/logstash/current/multiple-pipelines.html
	
	- pipeline.id: pipeline-1
  	  path.config: "/etc/logstash/conf.d/pipeline-1/*.conf"
	- pipeline.id: pipeline-2
  	  path.config: "/etc/logstash/conf.d/pipeline-2/*.conf"
	- pipeline.id: pipeline-3
  	  path.config: "/etc/logstash/conf.d/pipeline-3/*.conf"


对应conf.d下的配置文件可根据自己需要配置，但是需要对应pipelines中的目录格式：

	# tree conf.d/

	
	conf.d/
	├── pipeline-1
	│   └── pipeline-1.conf
	├── pipeline-2
	│   └── pipeline-2.conf
	├── pipeline-3
	    └── pipeline-3.conf	

      
上述配置就可以将数据完全分开存储在es的index中。

但是通过查相关资料显示logstash并不是能够支持无限个pipelines，具体需要设置多少和硬件有关系，有待进一步研究。