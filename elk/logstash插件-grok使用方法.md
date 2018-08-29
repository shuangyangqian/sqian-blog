# logstash filter插件之grok使用方法 #

Logstash提供了一系列filter过滤plugin来处理收集到的log event，根据log event的特征去切分所需要的字段，方便kibana做visualize和dashboard的data analysis。所有logstash支持的event切分插件查看这里。下面我们主要讲grok切分。


## Grok基本介绍 ##

### Grok 使用文本片段切分的方式来切分日志事件，语法如下:

	%{SYNTAX:SEMANTIC}

- `SYNTAX`代表匹配值的类型，例如，`0.11`可以`NUMBER`类型所匹配，`10.222.22.25`可以使用`IP`匹配。
- `SEMANTIC`表示存储该值的一个变量声明，它会存储在`elasticsearch`当中方便`kibana`做字段搜索和统计，你可以将一个`IP`定义为客户端IP地址`client_ip_address`，eg:`%{IP:client_ip_address}`，所匹配到的值就会存储到`client_ip_address`这个字段里边，类似数据库的列名，也可以把event log中的数字当成数字类型存储在一个指定的变量当中，比如响应时间`http_response_time`。


假设event log record如下:

	55.3.244.1 GET /index.html 15824 0.043

可以使用如下grok pattern来匹配这种记录

	%{IP:client_id_address} %{WORD:method} %{URIPATHPARAM:request} %{NUMBER:bytes} %{NUMBER:http_response_time}

在logstash conf.d文件夹下面创建conf文件，filter部分的内容如下：

	# /etc/logstash/conf.d/01-filter.conf
	filter {
     	 grok {
         match => { "message" => "%{IP:client_id_address} %{WORD:method} %{URIPATHPARAM:request} %{NUMBER:bytes} %{NUMBER:http_response_time}" }
     }
    }

通过上述filter，数据存储到es中就会增加了自定义的字段，如下：

	client_id_address: 55.3.244.1
	method: GET
	request: /index.html
	bytes: 15824
	http_response_time: 0.043

grok内置很多种patterns，可以直接用来匹配，如上述使用的IP、WORD、NUMBER等等，[可以查看所有支持的patterns](https://github.com/logstash-plugins/logstash-patterns-core/blob/master/patterns/grok-patterns)。

#### 常用的内置patterns

##### USERNAME and USER

	USERNAME [a-zA-Z0-9._-]+
	USER %{USERNAME}

第一行，用普通的正则表达式来定义一个 grok 表达式；第二行，通过打印赋值格式，用前面定义好的 grok 表达式来定义另一个 grok 表达式。

	eg:123,Alice,liqb 等等。

##### EMAILLOCALPART

电子邮件用户名部分，首位由大小写字母组成，其他部分是由大小写字母.数字及特殊字符(_.+-=:）组成的字符串(备注：注意，国内的QQ纯数字邮箱账号是无法匹配的，需要修改正则)。

	EMAILLOCALPART [a-zA-Z][a-zA-Z0-9_.+-=:]+
	eg: lqb,Grace_li,abc-wang

##### EMAILADDRESS

电子邮件地址：定义了电子邮件用户名：%{EMAILLOCALPART}，定义了主机名：%{HOSTNAME}

	EMAILADDRESS  %{EMAILLOCALPART}@%{HOSTNAME}
	eg:alice@yahoo.cn,alice@126.com,abc-123@qq.com

##### HTTPDUSER

定义了apache服务器的用户，可以是EMAILADDRESS 或 USER

	HTTPDUSER %{EMAILADDRESS} | %{USER}

##### INT 

整数，包括0和正负整数

	INT (?:[+-]?(?:[0-9]+))
	eg:0 -123 123 2345

##### BASE10NUM  and NUMBER 

十进制数字，包括整数和小数

	BASE10NUM (?<![0-9.+-])(?>[+-]?(?:(?:[0-9]+(?:\.[0-9]+)?)|(?:\.[0-9]+)))
	eg:11   33 3.14


##### BASE16NUM

十六进制数字，整数

	BASE16NUM (?<![0-9A-Fa-f])(?:[+-]?(?:0x)?(?:[0-9A-Fa-f]+))
	eg:0x0045fa2d、-0x3F8709

##### BASE16FLOAT

十六进制数字，整数和小数

	BASE16FLOAT \b(?<![0-9A-Fa-f.])(?:[+-]?(?:0x)?(?:(?:[0-9A-Fa-f]+(?:\.[0-9A-Fa-f]*)?)|(?:\.[0-9A-Fa-f]+)))\b

##### WORD

字符串，包括数字和大小写字母。

	WORD \b\w+\b
	eg:String .  34128   Ilove YOU

\b:匹配一个单词边界，也就是指单词和空格间的位置。例如， 'er\b' 可以匹配"never" 中的 'er'，但不能匹配 "verb" 中的 'er'。

\s:匹配包括下划线的任何单词字符。等价于'[A-Za-z0-9_]'。

##### NOTSPACE

不带任何空格的字符串

	NOTSPACE \S+

	\S:匹配任何非空白字符。等价于 [^ \f\n\r\t\v]。

##### SPACE

空格字符串

	SPACE \s*
	\s:匹配任何空白字符，包括空格、制表符、换页符等等。等价于 [ \f\n\r\t\v]。

##### QUOTEDSTRING 或QS

带引号的字符串。

	QUOTEDSTRING (?>(?<!\\)(?>"(?>\\.|[^\\"]+)+"|""|(?>'(?>\\.|[^\\']+)+')|''|(?>`(?>\\.|[^\\`]+)+`)|``))
	eg:"this is an apple" "hello world"

##### UUID

标准的uuid

	UUID [A-Fa-f0-9]{8}-(?:[A-Fa-f0-9]{4}-){3}[A-Fa-f0-9]{12}
	eg:b808962d-8f1a-4347-8389-5516d10e875a

##### MAC

MAC 地址，可以是思科设备里得mac地址，也可以是windows里得mac地址

	MAC (?:%{CISCOMAC}|%{WINDOWSMAC}|%{COMMONMAC})
	eg:00:15:5D:6E:28:13

##### IP

IP地址，可以是IPv4或IPv6地址

	IPV6 ((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){6}(:[0-9A-Fa-f]{1,4}|((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){5}(((:[0-9A-Fa-f]{1,4}){1,2})|:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){4}(((:[0-9A-Fa-f]{1,4}){1,3})|((:[0-9A-Fa-f]{1,4})?:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){3}(((:[0-9A-Fa-f]{1,4}){1,4})|((:[0-9A-Fa-f]{1,4}){0,2}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){2}(((:[0-9A-Fa-f]{1,4}){1,5})|((:[0-9A-Fa-f]{1,4}){0,3}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){1}(((:[0-9A-Fa-f]{1,4}){1,6})|((:[0-9A-Fa-f]{1,4}){0,4}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(:(((:[0-9A-Fa-f]{1,4}){1,7})|((:[0-9A-Fa-f]{1,4}){0,5}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:)))(%.+)?
	IPV4 (?<![0-9])(?:(?:[0-1]?[0-9]{1,2}|2[0-4][0-9]|25[0-5])[.](?:[0-1]?[0-9]{1,2}|2[0-4][0-9]|25[0-5])[.](?:[0-1]?[0-9]{1,2}|2[0-4][0-9]|25[0-5])[.](?:[0-1]?[0-9]{1,2}|2[0-4][0-9]|25[0-5]))(?![0-9])
	IP (?:%{IPV6}|%{IPV4})

##### HOSTNAME

主机名称

	HOSTNAME \b(?:[0-9A-Za-z][0-9A-Za-z-]{0,62})(?:\.(?:[0-9A-Za-z][0-9A-Za-z-]{0,62}))*(\.?|\b)

##### IPORHOST

ip或者主机名称

	IPORHOST (?:%{IP}|%{HOSTNAME})
##### HOSTPORT

主机名(IP)+端口

	HOSTPORT %{IPORHOST}:%{POSINT}
	eg:192.168.180.21:3306

##### PATH

UNIX系统或windows系统里得路径模式

	PATH (?:%{UNIXPATH}|%{WINPATH})
	eg: /usr/local/tomcat/bin/startuo.sh     D:\upload_crm\startup.bat

##### URIPROTO

URL协议

	URIPROTO [A-Za-z]+(\+[A-Za-z+]+)?
	eg:http  ftp  tcp  udp

##### URIHOST

URL主机

	URIHOST %{IPORHOST}(?::%{POSINT:port})?
	eg:www.baidu.com  121.242.156.210:24444
##### URIPATH

URL路径

	URIPATH (?:/[A-Za-z0-9$.+!*'(){},~:;=@#%_\-]*)+
	eg:http://udn.yyuap.com/doc/logstash-best-practice-cn/input/stdin.html

##### URIPARAM

URL里得GET参数

	URIPARAM \?[A-Za-z0-9$.+!*'|(){},~@#%&/=:;_?\-\[\]<>]*
	eg:?a=1&b=2&c=3

##### URIPATHPARAM

URL路径+GET参数

	URIPATHPARAM %{URIPATH}(?:%{URIPARAM})?

##### URI

完整的URL路径

	URI %{URIPROTO}://(?:%{USER}(?::[^@]*)?@)?(?:%{URIHOST})?(?:%{URIPATHPARAM})?

#### MONTH

月份名称

	MONTH \b(?:Jan(?:uary|uar)?|Feb(?:ruary|ruar)?|M(?:a|)?r(?:ch|z)?|Apr(?:il)?|Ma(?:y|i)?|Jun(?:e|i)?|Jul(?:y)?|Aug(?:ust)?|Sep(?:tember)?|O(?:c|k)?t(?:ober)?|Nov(?:ember)?|De(?:c|z)(?:ember)?)\b
	eg:jan january  Nov November

##### MONTHNUM

月份数字

	MONTHNUM (?:0?[1-9]|1[0-2])
	eg:03 3 12

##### MONTHDAY

日期数字

	MONTHDAY (?:(?:0[1-9])|(?:[12][0-9])|(?:3[01])|[1-9])
	eg: 03 9  31

##### DAY

星期几名称

	DAY (?:Mon(?:day)?|Tue(?:sday)?|Wed(?:nesday)?|Thu(?:rsday)?|Fri(?:day)?|Sat(?:urday)?|Sun(?:day)?)
	eg   MON   MONDAY  Tue  Tuesday

##### YEAR
年份数字

	YEAR (?>\d\d){1,2}
	eg  2012 2017

##### HOUR

小时数字
	
	HOUR (?:2[0123]|[01]?[0-9])

##### MINUTE

分钟数字

	MINUTE (?:[0-5][0-9])

##### SECOND

秒数字

	SECOND (?:(?:[0-5]?[0-9]|60)(?:[:.,][0-9]+)?)
##### TIME
时间

	TIME (?!<[0-9])%{HOUR}:%{MINUTE}(?::%{SECOND})(?![0-9])
	eg 01:00:45

##### DATE_US

美国日期格式

	DATE_US %{MONTHNUM}[/-]%{MONTHDAY}[/-]%{YEAR}
	eg:10/12/1986

##### DATE_EU

欧洲日期格式

	DATE_EU %{MONTHDAY}[./-]%{MONTHNUM}[./-]%{YEAR}
	eg:15-10-1986

##### ISO8601_TIMEZONE
ISO8601时间格式

	ISO8601_TIMEZONE (?:Z|[+-]%{HOUR}(?::?%{MINUTE}))
	eg：+15:19   -15:19

##### TIMESTAMP_ISO8601
ISO8601时间戳格式
	
	TIMESTAMP_ISO8601 %{YEAR}-%{MONTHNUM}-%{MONTHDAY}[T ]%{HOUR}:?%{MINUTE}(?::?%{SECOND})?%{ISO8601_TIMEZONE}?

##### DATE

日期，美国日期或者欧洲日期

	DATE %{DATE_US}|%{DATE_EU}

##### DATESTAMP
完整日期+时间

	DATESTAMP %{DATE}[- ]%{TIME}

##### HTTPDATE

http默认日期格式

	HTTPDATE %{MONTHDAY}/%{MONTH}/%{YEAR}:%{TIME} %{INT}

##### LOGLEVEL

日志等级

	LOGLEVEL ([Aa]lert|ALERT|[Tt]race|TRACE|[Dd]ebug|DEBUG|[Nn]otice|NOTICE|[Ii]nfo|INFO|[Ww]arn?(?:ing)?|WARN?(?:ING)?|[Ee]rr?(?:or)?|ERR?(?:OR)?|[Cc]rit?(?:ical)?|CRIT?(?:ICAL)?|[Ff]atal|FATAL|[Ss]evere|SEVERE|EMERG(?:ENCY)?|[Ee]merg(?:ency)?)


### 自定义patterns：

#### 直接写正则表达式

直接上例子：

	grok{
	　　match=>{
	　　　　"message"=>"%{IP:clientip}\s+(?<mypattern>[A-Z]+)"
	　　}
	}

上述中，把符合正则表达式`[A-Z]+`的赋值给`mypattern`。得到的结果如下：

	{
	　　"message" => "12.12.12.12 ABC",
	　　"@version" => "1",
	　　"@timestamp" => "2016-03-30T03:22:04.466Z",
	　　"host" => "master",
	　　"clientip" => "12.12.12.12",
	　　"mypattern" => "ABC"
	}

#### 自定义grok patterns文件

在`/home/hadoop/mylogstash/mypatterns_dir`创建文件`mypatterns_file`，内容如下：

	MY_PATTERN [A-Z]+

修改filter
	
	grok{
	　　patterns_dir=>["/home/hadoop/mylogstash/mypatterns_dir"]
	　　match=>{
	　　　　"message"=>"%{IP:clientip}\s+%{MY_PATTERN:mypattern}"
	　　}
	}

得到的过滤效果和上述是一样的。

### 多项选择
有时候我们会碰上一个日志有多种可能格式的情况。这时候要写成单一正则就比较困难，或者全用 | 隔开又比较丑陋。这时候，logstash 的语法提供给我们一个有趣的解决方式。

文档中，都说明 logstash/filters/grok 插件的 match 参数应该接受的是一个 Hash 值。但是因为早期的 logstash 语法中 Hash 值也是用 [] 这种方式书写的，所以其实现在传递 Array 值给 match 参数也完全没问题。所以，我们这里其实可以传递多个正则来匹配同一个字段：

	match => [
    	"message", "(?<request_time>\d+(?:\.\d+)?)",
    	"message", "%{SYSLOGBASE} %{DATA:message}",
    	"message", "(?m)%{WORD}"
	]
logstash 会按照这个定义次序依次尝试匹配，到匹配成功为止。虽说效果跟用 | 分割写个大大的正则是一样的，但是可阅读性好了很多。

### 其他常用内置方法

#### add_field

当pattern匹配切分成功之后，可以动态的对某些字段进行特定的修改或者添加新的字段，使用`%{fieldName}`来获取字段的值，如下：

	filter {
 	 grok{
 	   add_field => { "foo_%{somefield}" => "Hello world, %{somefield}" }
 	 }
	}


-----------------------
	# You can also add multiple fields at once:
	filter {
	  grok {
	    add_field => {
	      "foo_%{somefield}" => "Hello world, %{somefield}"
	      "new_field" => "new_static_value"
	    }
	  }
	}

如果`somefield=dad`，logstash会将`foo_dad`新字段加入elasticsearch，并将值`Hello world, dad`赋予该字段。

#### add_tag

 为经过filter或者匹配成功的event添加标签

如下：

	filter {
	  grok {
	    add_tag => [ "foo_%{somefield}" ]
	  }
	}


-----------------

	# You can also add multiple tags at once:
	filter {
	  grok {
	    add_tag => [ "foo_%{somefield}", "taggedy_tag"]
	  }
	}


查看官网更多[内置语法](https://www.elastic.co/guide/en/logstash/current/plugins-filters-grok.html#plugins-filters-grok-add_field)。

grok调试工具[GROKDEBUGER](http://grokdebug.herokuapp.com/)。