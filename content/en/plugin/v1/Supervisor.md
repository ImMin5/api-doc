---
title: "Supervisor"
linkTitle: "Supervisor"
weight: 3
bookFlatSection: true
---
# [Supervisor](#Supervisor)
A Supervisor is a resource managing the lifecycle of the plugin instances to deploy. A Supervisor manages the deployment of plugin instances by deploying or deleting the `pod` of the plugin instances.


>  **Package : spaceone.api.plugin.v1**

<br>
<br>

## Supervisor





**Supervisor Methods:**


| Method | Request | Response |
| :----- | :-------- | :-------- |
| [**publish**](./Supervisor#publish) | [PublishSupervisorRequest](Supervisor#publishsupervisorrequest) | [SupervisorInfo](Supervisor#supervisorinfo) |
| [**register**](./Supervisor#register) | [RegisterSupervisorRequest](Supervisor#registersupervisorrequest) | [SupervisorInfo](Supervisor#supervisorinfo) |
| [**update**](./Supervisor#update) | [RegisterSupervisorRequest](Supervisor#registersupervisorrequest) | [SupervisorInfo](Supervisor#supervisorinfo) |
| [**deregister**](./Supervisor#deregister) | [SupervisorRequest](Supervisor#supervisorrequest) | [Empty](Supervisor#empty) |
| [**enable**](./Supervisor#enable) | [SupervisorRequest](Supervisor#supervisorrequest) | [SupervisorInfo](Supervisor#supervisorinfo) |
| [**disable**](./Supervisor#disable) | [SupervisorRequest](Supervisor#supervisorrequest) | [SupervisorInfo](Supervisor#supervisorinfo) |
| [**recover_plugin**](./Supervisor#recover_plugin) | [RecoverPluginRequest](Supervisor#recoverpluginrequest) | [PluginInfo](Supervisor#plugininfo) |
| [**get**](./Supervisor#get) | [GetSupervisorRequest](Supervisor#getsupervisorrequest) | [SupervisorInfo](Supervisor#supervisorinfo) |
| [**list**](./Supervisor#list) | [SupervisorQuery](Supervisor#supervisorquery) | [SupervisorsInfo](Supervisor#supervisorsinfo) |
| [**stat**](./Supervisor#stat) | [SupervisorStatQuery](Supervisor#supervisorstatquery) | [Struct](Supervisor#struct) |
| [**list_plugins**](./Supervisor#list_plugins) | [PluginQuery](Supervisor#pluginquery) | [PluginsInfo](Supervisor#pluginsinfo) |



    
<br>

### publish

Creates a new Supervisor. Only Users with the `MANAGED` permission can set the Supervisor `public`. The Supervisor manages the lifecycle of plugin instances by the Supervisor's state. When a Supervisor is created, the state of the resource is `PENDING`. If the state remains the same for 5 minutes, the state is changed to `DISCONNECTED`.



> **POST** /plugin/v1/supervisor/publish
>





 {{< tabs " publish " >}}

 {{< tab "Request Example" >}}



[PublishSupervisorRequest](./Supervisor#publishsupervisorrequest)

* **name** (string)   `Required` 


* **hostname** (string)   `Required` 


* **domain_id** (string)   `Required` 


* **secret_key** (string)  


* **plugin_info** (PluginInfo)  `Repeated`   


* **tags** (Struct)  


* **is_public** (bool)  


* **labels** (Struct)  





{{< highlight json >}}
{
   "name": "test",
   "hostname": "dev-test2",
   "secret_key": "xxxxx",
   "tags": {
       "a": "b"
   }
}
{{< /highlight >}}
{{< /tab >}}


 {{< tab "Response Example" >}}

[SupervisorInfo](#SUPERVISORINFO)
* **supervisor_id** (string)   `Required` 

* **name** (string)   `Required` 

* **hostname** (string)   `Required` 

* **state** (State)   `Required` 

* **is_public** (bool)   `Required` 

* **domain_id** (string)   `Required` 

* **tags** (Struct)   `Required` 

* **labels** (Struct)   `Required` 

* **created_at** (string)   `Required` 

* **updated_at** (string)   `Required` 



{{< highlight json >}}
{
   "supervisor_id": "supervisor-525982f2ae9a",
   "name": "test",
   "hostname": "dev-test2",
   "state": "ENABLED",
   "domain_id": "domain-1c5a6b8181ad",
   "tags": {
       "a": "b"
   },
   "labels": {},
   "created_at": "2022-01-15T05:42:02.999Z"
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}


    
<br>

### register

Registers a specific Supervisor. You must specify the `supervisor_id` of the Supervisor to register. The `state` of the Supervisor changes from `PENDING` to `ENABLED`.



> **POST** /plugin/v1/supervisor/register
>





 {{< tabs " register " >}}

 {{< tab "Request Example" >}}



[RegisterSupervisorRequest](./Supervisor#registersupervisorrequest)

* **supervisor_id** (string)   `Required` 


* **domain_id** (string)   `Required` 


* **name** (string)  


* **is_public** (bool)  


* **priority** (int32)  


* **labels** (Struct)  


* **tags** (Struct)  





{{< highlight json >}}
{
   "supervisor_id": "supervisor-525982f2ae9a",
   "is_public": true,
   "priority": 10,
   "labels": {
       "a": "b"
   },
   "tags": {
       "c": "d"
   },
   "domain_id": "domain-1c5a6b8181ad"
}
{{< /highlight >}}
{{< /tab >}}


 {{< tab "Response Example" >}}

[SupervisorInfo](#SUPERVISORINFO)
* **supervisor_id** (string)   `Required` 

* **name** (string)   `Required` 

* **hostname** (string)   `Required` 

* **state** (State)   `Required` 

* **is_public** (bool)   `Required` 

* **domain_id** (string)   `Required` 

* **tags** (Struct)   `Required` 

* **labels** (Struct)   `Required` 

* **created_at** (string)   `Required` 

* **updated_at** (string)   `Required` 



{{< highlight json >}}
{
   "supervisor_id": "supervisor-525982f2ae9a",
   "name": "test",
   "hostname": "dev-test2",
   "state": "ENABLED",
   "domain_id": "domain-1c5a6b8181ad",
   "tags": {
       "a": "b"
   },
   "labels": {},
   "created_at": "2022-01-15T05:42:02.999Z"
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}


    
<br>

### update

Updates a specific Supervisor. You can make changes in Supervisor settings, including `labels`, `tags`, and the `bool` type parameter `is_public`.



> **POST** /plugin/v1/supervisor/update
>





 {{< tabs " update " >}}

 {{< tab "Request Example" >}}



[RegisterSupervisorRequest](./Supervisor#registersupervisorrequest)

* **supervisor_id** (string)   `Required` 


* **domain_id** (string)   `Required` 


* **name** (string)  


* **is_public** (bool)  


* **priority** (int32)  


* **labels** (Struct)  


* **tags** (Struct)  





{{< highlight json >}}
{
   "supervisor_id": "supervisor-525982f2ae9a",
   "is_public": true,
   "priority": 10,
   "labels": {
       "a": "b"
   },
   "tags": {
       "c": "d"
   },
   "domain_id": "domain-1c5a6b8181ad"
}
{{< /highlight >}}
{{< /tab >}}


 {{< tab "Response Example" >}}

[SupervisorInfo](#SUPERVISORINFO)
* **supervisor_id** (string)   `Required` 

* **name** (string)   `Required` 

* **hostname** (string)   `Required` 

* **state** (State)   `Required` 

* **is_public** (bool)   `Required` 

* **domain_id** (string)   `Required` 

* **tags** (Struct)   `Required` 

* **labels** (Struct)   `Required` 

* **created_at** (string)   `Required` 

* **updated_at** (string)   `Required` 



{{< highlight json >}}
{
   "supervisor_id": "supervisor-525982f2ae9a",
   "name": "test",
   "hostname": "dev-test2",
   "state": "ENABLED",
   "domain_id": "domain-1c5a6b8181ad",
   "tags": {
       "a": "b"
   },
   "labels": {},
   "created_at": "2022-01-15T05:42:02.999Z"
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}


    
<br>

### deregister

Deregisters and deletes a specific Supervisor. You must specify the `supervisor_id` of the Supervisor to deregister.



> **POST** /plugin/v1/supervisor/deregister
>





 {{< tabs " deregister " >}}

 {{< tab "Request Example" >}}



[SupervisorRequest](./Supervisor#supervisorrequest)

* **supervisor_id** (string)   `Required` 


* **domain_id** (string)   `Required` 





{{< highlight json >}}
{
   "supervisor_id": "supervisor-d73011256d55"
}
{{< /highlight >}}
{{< /tab >}}



{{< /tabs >}}


    
<br>

### enable

Enables a specific Supervisor. By changing the `state` parameter to `ENABLED`, the Supervisor can deploy or delete the `pod` of the plugin instance.



> **POST** /plugin/v1/supervisor/enable
>





 {{< tabs " enable " >}}

 {{< tab "Request Example" >}}



[SupervisorRequest](./Supervisor#supervisorrequest)

* **supervisor_id** (string)   `Required` 


* **domain_id** (string)   `Required` 





{{< highlight json >}}
{
   "supervisor_id": "supervisor-d73011256d55"
}
{{< /highlight >}}
{{< /tab >}}


 {{< tab "Response Example" >}}

[SupervisorInfo](#SUPERVISORINFO)
* **supervisor_id** (string)   `Required` 

* **name** (string)   `Required` 

* **hostname** (string)   `Required` 

* **state** (State)   `Required` 

* **is_public** (bool)   `Required` 

* **domain_id** (string)   `Required` 

* **tags** (Struct)   `Required` 

* **labels** (Struct)   `Required` 

* **created_at** (string)   `Required` 

* **updated_at** (string)   `Required` 



{{< highlight json >}}
{
   "supervisor_id": "supervisor-525982f2ae9a",
   "name": "test",
   "hostname": "dev-test2",
   "state": "ENABLED",
   "domain_id": "domain-1c5a6b8181ad",
   "tags": {
       "a": "b"
   },
   "labels": {},
   "created_at": "2022-01-15T05:42:02.999Z"
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}


    
<br>

### disable

Disables a specific Supervisor. By changing the `state` parameter to `DISABLED`, the Supervisor cannot deploy or delete the `pod` of the plugin instance.



> **POST** /plugin/v1/supervisor/disable
>





 {{< tabs " disable " >}}

 {{< tab "Request Example" >}}



[SupervisorRequest](./Supervisor#supervisorrequest)

* **supervisor_id** (string)   `Required` 


* **domain_id** (string)   `Required` 





{{< highlight json >}}
{
   "supervisor_id": "supervisor-d73011256d55"
}
{{< /highlight >}}
{{< /tab >}}


 {{< tab "Response Example" >}}

[SupervisorInfo](#SUPERVISORINFO)
* **supervisor_id** (string)   `Required` 

* **name** (string)   `Required` 

* **hostname** (string)   `Required` 

* **state** (State)   `Required` 

* **is_public** (bool)   `Required` 

* **domain_id** (string)   `Required` 

* **tags** (Struct)   `Required` 

* **labels** (Struct)   `Required` 

* **created_at** (string)   `Required` 

* **updated_at** (string)   `Required` 



{{< highlight json >}}
{
   "supervisor_id": "supervisor-525982f2ae9a",
   "name": "test",
   "hostname": "dev-test2",
   "state": "ENABLED",
   "domain_id": "domain-1c5a6b8181ad",
   "tags": {
       "a": "b"
   },
   "labels": {},
   "created_at": "2022-01-15T05:42:02.999Z"
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}


    
<br>

### recover_plugin

Recovers a specific plugin instance in a specific Supervisor. Changes the `state` of the Supervisor to `RE-PROVISIONING`.



> **POST** /plugin/v1/supervisor/recover-plugin
>





 {{< tabs " recover_plugin " >}}

 {{< tab "Request Example" >}}



[RecoverPluginRequest](./Supervisor#recoverpluginrequest)

* **supervisor_id** (string)   `Required` 


* **plugin_id** (string)   `Required` 


* **version** (string)   `Required` 


* **domain_id** (string)   `Required` 





{{< highlight json >}}
{
   "supervisor_id": "supervisor-a4c287cba676",
   "plugin_id": "plugin-api-direct-mon-webhook",
   "version": "1.1.0"
}
{{< /highlight >}}
{{< /tab >}}



{{< /tabs >}}


    
<br>

### get





> **POST** /plugin/v1/supervisor/get
>





 {{< tabs " get " >}}



 {{< tab "Response Example" >}}

[SupervisorInfo](#SUPERVISORINFO)
* **supervisor_id** (string)   `Required` 

* **name** (string)   `Required` 

* **hostname** (string)   `Required` 

* **state** (State)   `Required` 

* **is_public** (bool)   `Required` 

* **domain_id** (string)   `Required` 

* **tags** (Struct)   `Required` 

* **labels** (Struct)   `Required` 

* **created_at** (string)   `Required` 

* **updated_at** (string)   `Required` 



{{< highlight json >}}
{
   "supervisor_id": "supervisor-525982f2ae9a",
   "name": "test",
   "hostname": "dev-test2",
   "state": "ENABLED",
   "domain_id": "domain-1c5a6b8181ad",
   "tags": {
       "a": "b"
   },
   "labels": {},
   "created_at": "2022-01-15T05:42:02.999Z"
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}


    
<br>

### list

Gets a list of all Supervisors. You can use a query to get a filtered list of Supervisors.



> **POST** /plugin/v1/supervisor/list
>





 {{< tabs " list " >}}

 {{< tab "Request Example" >}}



[SupervisorQuery](./Supervisor#supervisorquery)

* **domain_id** (string)   `Required` 


* **query** (Query)  


* **supervisor_id** (string)  


* **name** (string)  


* **is_public** (bool)  





{{< highlight json >}}
{
   "query": {}
}
{{< /highlight >}}
{{< /tab >}}


 {{< tab "Response Example" >}}

[SupervisorsInfo](#SUPERVISORSINFO)
* **results** (SupervisorInfo)  `Repeated`   `Required` 

* **total_count** (int32)   `Required` 



{{< highlight json >}}
{
   "results": [
       {
           "supervisor_id": "supervisor-3a091f899539",
           "name": "root",
           "hostname": "dev-supervisor.svc.cluster.local",
           "state": "ENABLED",
           "is_public": true,
           "domain_id": "domain-1c5a6b8181ad",
           "labels": {},
           "created_at": "2020-05-12T00:24:48.250Z"
       },
       {
           "supervisor_id": "supervisor-a4c287cba676",
           "name": "test",
           "hostname": "dev-test",
           "state": "ENABLED",
           "domain_id": "domain-1c5a6b8181ad",
           "tags": {
               "a": "b"
           },
           "labels": {},
           "created_at": "2022-06-15T05:39:15.886Z"
       }
   ],
   "total_count": 2
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}


    
<br>

### stat





> **POST** /plugin/v1/supervisor/stat
>






    
<br>

### list_plugins

Gets a list of all plugin instances regardless of Supervisors. Prints detailed information about the plugin instances, including `version`, `state`, and the relevant Supervisor.



> **POST** /plugin/v1/supervisor/list-plugins
>





 {{< tabs " list_plugins " >}}

 {{< tab "Request Example" >}}



[PluginQuery](./Supervisor#pluginquery)

* **domain_id** (string)   `Required` 


* **query** (Query)  


* **supervisor_id** (string)  


* **hostname** (string)  


* **plugin_id** (string)  


* **version** (string)  


* **state** (State)  


* **endpoint** (string)  





{{< highlight json >}}
{
 "query": {}
}
{{< /highlight >}}
{{< /tab >}}


 {{< tab "Response Example" >}}

[PluginsInfo](#PLUGINSINFO)
* **results** (PluginInfo)  `Repeated`   `Required` 

* **total_count** (int32)   `Required` 



{{< highlight json >}}
{
   "results": [
       {
           "plugin_id": "plugin-openstack-inven-collector",
           "version": "0.4.1.20220609.122832",
           "state": "ACTIVE",
           "endpoint": "grpc://plugin-openstack-inven-collector-vbnnsoszfjsneiqz.dev-supervisor.svc.cluster.local:50051",
           "supervisor_id": "supervisor-3a091f899539",
           "supervisor_name": "root",
           "managed": true,
           "endpoints": [
               "grpc://172.16.16.234:50051"
           ]
       },
       {
           "plugin_id": "plugin-zabbix-mon-webhook",
           "version": "1.0",
           "state": "ACTIVE",
           "endpoint": "grpc://plugin-zabbix-mon-webhook-dgqqfqsqidieeuk.dev-supervisor.svc.cluster.local:50051",
           "supervisor_id": "supervisor-3a091f899539",
           "supervisor_name": "root",
           "managed": true,
           "endpoints": [
               "grpc://172.16.16.130:50051"
           ]
       }
   ],
   "total_count": 2
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}


    


<br>
<br>

## Message



### GetSupervisorRequest
* **supervisor_id** (string)   `Required` 

    
* **domain_id** (string)   `Required` 

    
* **only** (string)  `Repeated`   

    <br>

### PluginInfo
* **plugin_id** (string)   `Required` 

    
* **version** (string)   `Required` 

    
* **state** (State)   `Required` 

    
* **endpoint** (string)   `Required` 

    
* **supervisor_id** (string)   `Required` 

    
* **supervisor_name** (string)   `Required` 

    
* **managed** (bool)   `Required` 

    
* **endpoints** (string)  `Repeated`    `Required` 

    
* **domain_id** (string)   `Required` 

    <br>

### PluginQuery
* **domain_id** (string)   `Required` 

    
* **query** (Query)  

    
* **supervisor_id** (string)  

    
* **hostname** (string)  

    
* **plugin_id** (string)  

    
* **version** (string)  

    
* **state** (State)  

    
* **endpoint** (string)  

    <br>

### PluginsInfo
* **results** (PluginInfo)  `Repeated`    `Required` 

    
* **total_count** (int32)   `Required` 

    <br>

### PublishSupervisorRequest
* **name** (string)   `Required` 

    
* **hostname** (string)   `Required` 

    
* **domain_id** (string)   `Required` 

    
* **secret_key** (string)  

    
* **plugin_info** (PluginInfo)  `Repeated`   

    
* **tags** (Struct)  

    
* **is_public** (bool)  

    
* **labels** (Struct)  

    <br>

### RecoverPluginRequest
* **supervisor_id** (string)   `Required` 

    
* **plugin_id** (string)   `Required` 

    
* **version** (string)   `Required` 

    
* **domain_id** (string)   `Required` 

    <br>

### RegisterSupervisorRequest
* **supervisor_id** (string)   `Required` 

    
* **domain_id** (string)   `Required` 

    
* **name** (string)  

    
* **is_public** (bool)  

    
* **priority** (int32)  

    
* **labels** (Struct)  

    
* **tags** (Struct)  

    <br>

### SupervisorInfo
* **supervisor_id** (string)   `Required` 

    
* **name** (string)   `Required` 

    
* **hostname** (string)   `Required` 

    
* **state** (State)   `Required` 

    
* **is_public** (bool)   `Required` 

    
* **domain_id** (string)   `Required` 

    
* **tags** (Struct)   `Required` 

    
* **labels** (Struct)   `Required` 

    
* **created_at** (string)   `Required` 

    
* **updated_at** (string)   `Required` 

    <br>

### SupervisorQuery
* **domain_id** (string)   `Required` 

    
* **query** (Query)  

    
* **supervisor_id** (string)  

    
* **name** (string)  

    
* **is_public** (bool)  

    <br>

### SupervisorRequest
* **supervisor_id** (string)   `Required` 

    
* **domain_id** (string)   `Required` 

    <br>

### SupervisorStatQuery
* **query** (StatisticsQuery)   `Required` 

    
* **domain_id** (string)   `Required` 

    <br>

### SupervisorsInfo
* **results** (SupervisorInfo)  `Repeated`    `Required` 

    
* **total_count** (int32)   `Required` 

    <br>
