# openstack server action（createBackup）简介 #

*create date:8/23/2017 9:38:22 AM*

说明：本文主要是介绍openstack中的server的镜像备份功能API进行探索和分析。

API地址：[https://developer.openstack.org/api-ref/compute/#create-server-back-up-createbackup-action](https://developer.openstack.org/api-ref/compute/#create-server-back-up-createbackup-action)

## API分析 ##

该API主要是使用了HTTP方法的POST方法来进行服务请求，uri格式为

    /servers/{server_id}/action

    Create Server Back Up (createBackup Action)

**Note：**不支持volume-backed的云主机实例。

在request body中要指明createBackup这个动作的详细信息。默认的策略是只有管理员或者该云主机的owner才有权限对该云主机采取createBackup的操作，当然也可以在policy.json中来修改这一策略。

**Note：**Starting from version 2.39 the image quota enforcement with Nova metadata is removed and quota checks should be performed using Glance API directly.

正常的response status_code：202

错误的response status_code：400(badRequest),401(unauthorized),403(forbidden),404(itemNotFound),409(conflict)

**Request格式要求:**

    
    
    Name           In       Type      Description
    
    server_id      path     string   The uuid of the server.
    
    createBackup   body     object   The action.

    name           body     string   The name of the image to be backed up.
 
    backup_type    body     string   The type of back up, for example, daily.

    rotation       body     integer  The rotation of the back up image, the oldest image will be removed when image count exceed the rotation count. 

    metadata(optional) body object   Metadata key and value pairs. The maximum size of the metadata key and value is 255 bytes each.

              
**createBackup示例：**

    {
    "createBackup": {
        "name": "Backup 1",
        "backup_type": "daily",
        "rotation": 1
        }
    }

**Respouse格式：**

    Name           In       Type      Description
    
    Location       header   string   The image location URL of the image or backup created, HTTP header “Location: <image location URL>” will be returned.
    
    image_id       body     string   The UUID for the resulting image snapshot.

**Example Create Server Back Up (v2.45)**

    {
    "image_id": "0e7761dd-ee98-41f0-ba35-05994e446431"
	}


## 源码分析： ##

源码api入口：nova/api/openstack/compute/create_backup.py

分析一个nova相关的API可以首先看看官方提供的对nova的API进行拓展的一个文档：[https://wiki.openstack.org/wiki/WritingRequestExtensions](https://wiki.openstack.org/wiki/WritingRequestExtensions)

