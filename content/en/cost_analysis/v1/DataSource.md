---
title: "DataSource"
linkTitle: "DataSource"
weight: 3
bookFlatSection: true
---
# [DataSource](#DataSource)
A DataSource is a plugin instance collecting external cost data. External cost data consists of `raw data` and the plugin information used for collection.


>  **Package : spaceone.api.cost_analysis.v1**

<br>
<br>

## DataSource





**DataSource Methods:**


| Method | Request | Response |
| :----- | :-------- | :-------- |
| [**register**](./DataSource#register) | [RegisterDataSourceRequest](DataSource#registerdatasourcerequest) | [DataSourceInfo](DataSource#datasourceinfo) |
| [**update**](./DataSource#update) | [UpdateDataSourceRequest](DataSource#updatedatasourcerequest) | [DataSourceInfo](DataSource#datasourceinfo) |
| [**update_plugin**](./DataSource#update_plugin) | [UpdateDataSourcePluginRequest](DataSource#updatedatasourcepluginrequest) | [DataSourceInfo](DataSource#datasourceinfo) |
| [**verify_plugin**](./DataSource#verify_plugin) | [DataSourceRequest](DataSource#datasourcerequest) | [Empty](DataSource#empty) |
| [**enable**](./DataSource#enable) | [DataSourceRequest](DataSource#datasourcerequest) | [DataSourceInfo](DataSource#datasourceinfo) |
| [**disable**](./DataSource#disable) | [DataSourceRequest](DataSource#datasourcerequest) | [DataSourceInfo](DataSource#datasourceinfo) |
| [**deregister**](./DataSource#deregister) | [DeregisterDataSourceRequest](DataSource#deregisterdatasourcerequest) | [Empty](DataSource#empty) |
| [**sync**](./DataSource#sync) | [SyncDataSourceRequest](DataSource#syncdatasourcerequest) | [JobInfo](DataSource#jobinfo) |
| [**get**](./DataSource#get) | [GetDataSourceRequest](DataSource#getdatasourcerequest) | [DataSourceInfo](DataSource#datasourceinfo) |
| [**list**](./DataSource#list) | [DataSourceQuery](DataSource#datasourcequery) | [DataSourcesInfo](DataSource#datasourcesinfo) |
| [**stat**](./DataSource#stat) | [DataSourceStatQuery](DataSource#datasourcestatquery) | [Struct](DataSource#struct) |



    
<br>

### register

Registers a DataSource with information of the plugin to use. Information of the plugin includes `version`, `provider`, and `upgrade_mode`.



> **POST** /cost-analysis/v1/data-source/register
>





 {{< tabs " register " >}}

 {{< tab "Request Example" >}}



[RegisterDataSourceRequest](./DataSource#registerdatasourcerequest)

* **name** (string)   `Required` 


* **data_source_type** (DataSourceType)   `Required` 


* **domain_id** (string)   `Required` 


* **provider** (string)  


* **template** (Struct)  


* **plugin_info** (PluginInfo)  


* **tags** (Struct)  


* **secret_type** (SecretType)  


* **secret_filter** (SecretFilter)  





{{< highlight json >}}
{
   "name": "AWS HyperBilling Data Source test",
   "data_source_type": "EXTERNAL",
   "plugin_info": {
       "plugin_id": "plugin-aws-hyperbilling-cost-datasource",
       "version": "1.0.4",
       "options": {},
       "metadata": {
           "data_source_rules": [
               {
                   "conditions_policy": "ALWAYS",
                   "options": {
                       "stop_processing": true
                   },
                   "actions": {
                       "match_service_account": {
                           "source": "account",
                           "target": "data.account_id"
                       }
                   },
                   "conditions": [],
                   "tags": {},
                   "name": "match_service_account"
               }
           ]
       },
       "secret_id": "secret-ca134639483",
       "upgrade_mode": "AUTO"
   },
   "tags": {"a": "b"}
}
{{< /highlight >}}
{{< /tab >}}


 {{< tab "Response Example" >}}

[DataSourceInfo](#DATASOURCEINFO)
* **data_source_id** (string)   `Required` 

* **name** (string)   `Required` 

* **state** (State)   `Required` 

* **data_source_type** (DataSourceType)   `Required` 

* **provider** (string)   `Required` 

* **plugin_info** (PluginInfo)   `Required` 

* **template** (Struct)   `Required` 

* **tags** (Struct)   `Required` 

* **cost_tag_keys** (string)  `Repeated`   `Required` 

* **cost_additional_info_keys** (string)  `Repeated`   `Required` 

* **domain_id** (string)   `Required` 

* **secret_type** (SecretType)   `Required` 

* **secret_filter** (SecretFilter)   `Required` 

* **created_at** (string)   `Required` 

* **last_synchronized_at** (string)   `Required` 



{{< highlight json >}}
{
       "data_source_id": "ds-085d1e872789",
       "name": "AWS HyperBilling Data Source test",
       "state": "ENABLED",
       "data_source_type": "EXTERNAL",
       "plugin_info": {
           "plugin_id": "plugin-aws-hyperbilling-cost-datasource",
           "version": "1.0.4",
           "options": {},
           "metadata": {
               "data_source_rules": [
                   {
                       "options": {
                           "stop_processing": true
                       },
                       "actions": {
                           "match_service_account": {
                               "source": "account",
                               "target": "data.account_id"
                           }
                       },
                       "domain_id": "domain-58010aa2e451",
                       "conditions": [],
                       "name": "match_service_account",
                       "tags": {},
                       "data_source_id": "ds-085d1e872789",
                       "conditions_policy": "ALWAYS"
                   }
               ]
           },
           "secret_id": "secret-ca134639483",
           "upgrade_mode": "AUTO"
       },
       "template": {},
       "tags": {
           "a": "b"
       },
       "cost_tag_keys": [
           "Name",
           "Environment",
           "Role",
           "Service"
       ],
       "cost_additional_info_keys": [
           "raw_usage_type"
       ],
       "domain_id": "domain-58010aa2e451",
       "created_at": "2022-07-19T10:58:36.080Z"
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}


    
<br>

### update

Updates a specific DataSource. You can make changes in DataSource settings, including `name` and `tags`.



> **POST** /cost-analysis/v1/data-source/update
>





 {{< tabs " update " >}}

 {{< tab "Request Example" >}}



[UpdateDataSourceRequest](./DataSource#updatedatasourcerequest)

* **data_source_id** (string)   `Required` 


* **domain_id** (string)   `Required` 


* **name** (string)  


* **template** (Struct)  


* **tags** (Struct)  


* **secret_filter** (SecretFilter)  





{{< highlight json >}}
{
       "data_source_id": "ds-085d1e872789",
       "name": "AWS HyperBilling Data Source test2",
       "tags": {
           "type": "test"
       }
}
{{< /highlight >}}
{{< /tab >}}


 {{< tab "Response Example" >}}

[DataSourceInfo](#DATASOURCEINFO)
* **data_source_id** (string)   `Required` 

* **name** (string)   `Required` 

* **state** (State)   `Required` 

* **data_source_type** (DataSourceType)   `Required` 

* **provider** (string)   `Required` 

* **plugin_info** (PluginInfo)   `Required` 

* **template** (Struct)   `Required` 

* **tags** (Struct)   `Required` 

* **cost_tag_keys** (string)  `Repeated`   `Required` 

* **cost_additional_info_keys** (string)  `Repeated`   `Required` 

* **domain_id** (string)   `Required` 

* **secret_type** (SecretType)   `Required` 

* **secret_filter** (SecretFilter)   `Required` 

* **created_at** (string)   `Required` 

* **last_synchronized_at** (string)   `Required` 



{{< highlight json >}}
{
       "data_source_id": "ds-085d1e872789",
       "name": "AWS HyperBilling Data Source test",
       "state": "ENABLED",
       "data_source_type": "EXTERNAL",
       "plugin_info": {
           "plugin_id": "plugin-aws-hyperbilling-cost-datasource",
           "version": "1.0.4",
           "options": {},
           "metadata": {
               "data_source_rules": [
                   {
                       "options": {
                           "stop_processing": true
                       },
                       "actions": {
                           "match_service_account": {
                               "source": "account",
                               "target": "data.account_id"
                           }
                       },
                       "domain_id": "domain-58010aa2e451",
                       "conditions": [],
                       "name": "match_service_account",
                       "tags": {},
                       "data_source_id": "ds-085d1e872789",
                       "conditions_policy": "ALWAYS"
                   }
               ]
           },
           "secret_id": "secret-ca134639483",
           "upgrade_mode": "AUTO"
       },
       "template": {},
       "tags": {
           "a": "b"
       },
       "cost_tag_keys": [
           "Name",
           "Environment",
           "Role",
           "Service"
       ],
       "cost_additional_info_keys": [
           "raw_usage_type"
       ],
       "domain_id": "domain-58010aa2e451",
       "created_at": "2022-07-19T10:58:36.080Z"
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}


    
<br>

### update_plugin

Updates the plugin of a specific DataSource. This method resets the plugin data in the DataSource to update the `metadata`.



> **POST** /cost-analysis/v1/data-source/update-plugin
>





 {{< tabs " update_plugin " >}}

 {{< tab "Request Example" >}}



[UpdateDataSourcePluginRequest](./DataSource#updatedatasourcepluginrequest)

* **data_source_id** (string)   `Required` 


* **domain_id** (string)   `Required` 


* **version** (string)  


* **options** (Struct)  


* **upgrade_mode** (UpgradeMode)  





{{< highlight json >}}
{
   "data_source_id": "ds-085d1e872789",
   "version": "1.0.4",
   "options": {},
   "upgrade_mode": "AUTO"
}
{{< /highlight >}}
{{< /tab >}}


 {{< tab "Response Example" >}}

[DataSourceInfo](#DATASOURCEINFO)
* **data_source_id** (string)   `Required` 

* **name** (string)   `Required` 

* **state** (State)   `Required` 

* **data_source_type** (DataSourceType)   `Required` 

* **provider** (string)   `Required` 

* **plugin_info** (PluginInfo)   `Required` 

* **template** (Struct)   `Required` 

* **tags** (Struct)   `Required` 

* **cost_tag_keys** (string)  `Repeated`   `Required` 

* **cost_additional_info_keys** (string)  `Repeated`   `Required` 

* **domain_id** (string)   `Required` 

* **secret_type** (SecretType)   `Required` 

* **secret_filter** (SecretFilter)   `Required` 

* **created_at** (string)   `Required` 

* **last_synchronized_at** (string)   `Required` 



{{< highlight json >}}
{
       "data_source_id": "ds-085d1e872789",
       "name": "AWS HyperBilling Data Source test",
       "state": "ENABLED",
       "data_source_type": "EXTERNAL",
       "plugin_info": {
           "plugin_id": "plugin-aws-hyperbilling-cost-datasource",
           "version": "1.0.4",
           "options": {},
           "metadata": {
               "data_source_rules": [
                   {
                       "options": {
                           "stop_processing": true
                       },
                       "actions": {
                           "match_service_account": {
                               "source": "account",
                               "target": "data.account_id"
                           }
                       },
                       "domain_id": "domain-58010aa2e451",
                       "conditions": [],
                       "name": "match_service_account",
                       "tags": {},
                       "data_source_id": "ds-085d1e872789",
                       "conditions_policy": "ALWAYS"
                   }
               ]
           },
           "secret_id": "secret-ca134639483",
           "upgrade_mode": "AUTO"
       },
       "template": {},
       "tags": {
           "a": "b"
       },
       "cost_tag_keys": [
           "Name",
           "Environment",
           "Role",
           "Service"
       ],
       "cost_additional_info_keys": [
           "raw_usage_type"
       ],
       "domain_id": "domain-58010aa2e451",
       "created_at": "2022-07-19T10:58:36.080Z"
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}


    
<br>

### verify_plugin

Verifies the plugin of a specific DataSource. This method validates the plugin data, `version` and `endpoint`.



> **POST** /cost-analysis/v1/data-source/verify-plugin
>





 {{< tabs " verify_plugin " >}}

 {{< tab "Request Example" >}}



[DataSourceRequest](./DataSource#datasourcerequest)

* **data_source_id** (string)   `Required` 


* **domain_id** (string)   `Required` 





{{< highlight json >}}
{
   "data_source_id": "ds-085d1e872789"
}
{{< /highlight >}}
{{< /tab >}}



{{< /tabs >}}


    
<br>

### enable

Enables a specific DataSource. By enabling a DataSource, you can communicate with an external cloud service via the plugin.



> **POST** /cost-analysis/v1/data-source/enable
>





 {{< tabs " enable " >}}

 {{< tab "Request Example" >}}



[DataSourceRequest](./DataSource#datasourcerequest)

* **data_source_id** (string)   `Required` 


* **domain_id** (string)   `Required` 





{{< highlight json >}}
{
   "data_source_id": "ds-085d1e872789"
}
{{< /highlight >}}
{{< /tab >}}


 {{< tab "Response Example" >}}

[DataSourceInfo](#DATASOURCEINFO)
* **data_source_id** (string)   `Required` 

* **name** (string)   `Required` 

* **state** (State)   `Required` 

* **data_source_type** (DataSourceType)   `Required` 

* **provider** (string)   `Required` 

* **plugin_info** (PluginInfo)   `Required` 

* **template** (Struct)   `Required` 

* **tags** (Struct)   `Required` 

* **cost_tag_keys** (string)  `Repeated`   `Required` 

* **cost_additional_info_keys** (string)  `Repeated`   `Required` 

* **domain_id** (string)   `Required` 

* **secret_type** (SecretType)   `Required` 

* **secret_filter** (SecretFilter)   `Required` 

* **created_at** (string)   `Required` 

* **last_synchronized_at** (string)   `Required` 



{{< highlight json >}}
{
       "data_source_id": "ds-085d1e872789",
       "name": "AWS HyperBilling Data Source test",
       "state": "ENABLED",
       "data_source_type": "EXTERNAL",
       "plugin_info": {
           "plugin_id": "plugin-aws-hyperbilling-cost-datasource",
           "version": "1.0.4",
           "options": {},
           "metadata": {
               "data_source_rules": [
                   {
                       "options": {
                           "stop_processing": true
                       },
                       "actions": {
                           "match_service_account": {
                               "source": "account",
                               "target": "data.account_id"
                           }
                       },
                       "domain_id": "domain-58010aa2e451",
                       "conditions": [],
                       "name": "match_service_account",
                       "tags": {},
                       "data_source_id": "ds-085d1e872789",
                       "conditions_policy": "ALWAYS"
                   }
               ]
           },
           "secret_id": "secret-ca134639483",
           "upgrade_mode": "AUTO"
       },
       "template": {},
       "tags": {
           "a": "b"
       },
       "cost_tag_keys": [
           "Name",
           "Environment",
           "Role",
           "Service"
       ],
       "cost_additional_info_keys": [
           "raw_usage_type"
       ],
       "domain_id": "domain-58010aa2e451",
       "created_at": "2022-07-19T10:58:36.080Z"
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}


    
<br>

### disable

Disables a specific DataSource. By disabling a DataSource, you can block communication with an external cloud service via the plugin.



> **POST** /cost-analysis/v1/data-source/disable
>





 {{< tabs " disable " >}}

 {{< tab "Request Example" >}}



[DataSourceRequest](./DataSource#datasourcerequest)

* **data_source_id** (string)   `Required` 


* **domain_id** (string)   `Required` 





{{< highlight json >}}
{
   "data_source_id": "ds-085d1e872789"
}
{{< /highlight >}}
{{< /tab >}}


 {{< tab "Response Example" >}}

[DataSourceInfo](#DATASOURCEINFO)
* **data_source_id** (string)   `Required` 

* **name** (string)   `Required` 

* **state** (State)   `Required` 

* **data_source_type** (DataSourceType)   `Required` 

* **provider** (string)   `Required` 

* **plugin_info** (PluginInfo)   `Required` 

* **template** (Struct)   `Required` 

* **tags** (Struct)   `Required` 

* **cost_tag_keys** (string)  `Repeated`   `Required` 

* **cost_additional_info_keys** (string)  `Repeated`   `Required` 

* **domain_id** (string)   `Required` 

* **secret_type** (SecretType)   `Required` 

* **secret_filter** (SecretFilter)   `Required` 

* **created_at** (string)   `Required` 

* **last_synchronized_at** (string)   `Required` 



{{< highlight json >}}
{
       "data_source_id": "ds-085d1e872789",
       "name": "AWS HyperBilling Data Source test",
       "state": "ENABLED",
       "data_source_type": "EXTERNAL",
       "plugin_info": {
           "plugin_id": "plugin-aws-hyperbilling-cost-datasource",
           "version": "1.0.4",
           "options": {},
           "metadata": {
               "data_source_rules": [
                   {
                       "options": {
                           "stop_processing": true
                       },
                       "actions": {
                           "match_service_account": {
                               "source": "account",
                               "target": "data.account_id"
                           }
                       },
                       "domain_id": "domain-58010aa2e451",
                       "conditions": [],
                       "name": "match_service_account",
                       "tags": {},
                       "data_source_id": "ds-085d1e872789",
                       "conditions_policy": "ALWAYS"
                   }
               ]
           },
           "secret_id": "secret-ca134639483",
           "upgrade_mode": "AUTO"
       },
       "template": {},
       "tags": {
           "a": "b"
       },
       "cost_tag_keys": [
           "Name",
           "Environment",
           "Role",
           "Service"
       ],
       "cost_additional_info_keys": [
           "raw_usage_type"
       ],
       "domain_id": "domain-58010aa2e451",
       "created_at": "2022-07-19T10:58:36.080Z"
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}


    
<br>

### deregister

Deregisters and deletes a specific DataSource. You must specify the `data_source_id` of the DataSource to deregister.



> **POST** /cost-analysis/v1/data-source/deregister
>





 {{< tabs " deregister " >}}

 {{< tab "Request Example" >}}



[DeregisterDataSourceRequest](./DataSource#deregisterdatasourcerequest)

* **data_source_id** (string)   `Required` 


* **domain_id** (string)   `Required` 


* **cascade_delete_cost** (bool)  

  *Default value is true. If true delete all cost data related to data_source_id*





{{< highlight json >}}
{
   "data_source_id": "ds-085d1e872789",
   "cascade_delete_cost": true,
   "domain_id": "domain-085d1e872789"
}
{{< /highlight >}}
{{< /tab >}}



{{< /tabs >}}


    
<br>

### sync

Manually runs a specific DataSource to collect the cost data. This method is to get up-to-date cost data.



> **POST** /cost-analysis/v1/data-source/sync
>






    
<br>

### get

Gets a specific DataSource. Prints detailed information about the DataSource, including `name`, `state`, and `plugin_info`.



> **POST** /cost-analysis/v1/data-source/get
>





 {{< tabs " get " >}}



 {{< tab "Response Example" >}}

[DataSourceInfo](#DATASOURCEINFO)
* **data_source_id** (string)   `Required` 

* **name** (string)   `Required` 

* **state** (State)   `Required` 

* **data_source_type** (DataSourceType)   `Required` 

* **provider** (string)   `Required` 

* **plugin_info** (PluginInfo)   `Required` 

* **template** (Struct)   `Required` 

* **tags** (Struct)   `Required` 

* **cost_tag_keys** (string)  `Repeated`   `Required` 

* **cost_additional_info_keys** (string)  `Repeated`   `Required` 

* **domain_id** (string)   `Required` 

* **secret_type** (SecretType)   `Required` 

* **secret_filter** (SecretFilter)   `Required` 

* **created_at** (string)   `Required` 

* **last_synchronized_at** (string)   `Required` 



{{< highlight json >}}
{
       "data_source_id": "ds-085d1e872789",
       "name": "AWS HyperBilling Data Source test",
       "state": "ENABLED",
       "data_source_type": "EXTERNAL",
       "plugin_info": {
           "plugin_id": "plugin-aws-hyperbilling-cost-datasource",
           "version": "1.0.4",
           "options": {},
           "metadata": {
               "data_source_rules": [
                   {
                       "options": {
                           "stop_processing": true
                       },
                       "actions": {
                           "match_service_account": {
                               "source": "account",
                               "target": "data.account_id"
                           }
                       },
                       "domain_id": "domain-58010aa2e451",
                       "conditions": [],
                       "name": "match_service_account",
                       "tags": {},
                       "data_source_id": "ds-085d1e872789",
                       "conditions_policy": "ALWAYS"
                   }
               ]
           },
           "secret_id": "secret-ca134639483",
           "upgrade_mode": "AUTO"
       },
       "template": {},
       "tags": {
           "a": "b"
       },
       "cost_tag_keys": [
           "Name",
           "Environment",
           "Role",
           "Service"
       ],
       "cost_additional_info_keys": [
           "raw_usage_type"
       ],
       "domain_id": "domain-58010aa2e451",
       "created_at": "2022-07-19T10:58:36.080Z"
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}


    
<br>

### list

Gets a list of all DataSources. You can use a query to get a filtered list of DataSources.



> **POST** /cost-analysis/v1/data-source/list
>





 {{< tabs " list " >}}

 {{< tab "Request Example" >}}



[DataSourceQuery](./DataSource#datasourcequery)

* **domain_id** (string)   `Required` 


* **query** (Query)  


* **data_source_id** (string)  


* **name** (string)  


* **state** (string)  


* **data_source_type** (DataSourceType)  


* **provider** (string)  





{{< highlight json >}}
{
   "query": {}
}
{{< /highlight >}}
{{< /tab >}}


 {{< tab "Response Example" >}}

[DataSourcesInfo](#DATASOURCESINFO)
* **results** (DataSourceInfo)  `Repeated`   `Required` 

* **total_count** (int32)   `Required` 



{{< highlight json >}}
{
       "results": [
           {
               "data_source_id": "ds-fcba92ca73b1",
               "name": "AWS HyperBilling Data Source",
               "state": "ENABLED",
               "data_source_type": "EXTERNAL",
               "plugin_info": {
                   "plugin_id": "plugin-aws-hyperbilling-cost-datasource",
                   "version": "1.0.4",
                   "options": {},
                   "metadata": {
                       "data_source_rules": [
                           {
                               "name": "match_service_account",
                               "conditions": [],
                               "actions": {
                                   "match_service_account": {
                                       "source": "account",
                                       "target": "data.account_id"
                                   }
                               },
                               "conditions_policy": "ALWAYS",
                               "tags": {},
                               "options": {
                                   "stop_processing": true
                               }
                           }
                       ]
                   },
                   "secret_id": "secret-dca385e85a27",
                   "upgrade_mode": "AUTO"
               },
               "template": {},
               "tags": {
                   "a": "b"
               },
               "cost_tag_keys": [
                   "Name",
                   "Environment",
                   "Role",
                   "Service"
               ],
               "cost_additional_info_keys": [
                   "raw_usage_type"
               ],
               "domain_id": "domain-58010aa2e451",
               "created_at": "2022-03-30T02:21:28.756Z",
               "last_synchronized_at": "2022-07-17T16:00:05.077Z"
           },
           {
               "data_source_id": "ds-c96609f5afeb",
               "name": "MZC HyperBilling Data Source",
               "state": "ENABLED",
               "data_source_type": "EXTERNAL",
               "plugin_info": {
                   "plugin_id": "plugin-mzc-hyperbilling-cost-datasource",
                   "version": "1.0.3",
                   "options": {},
                   "metadata": {
                       "data_source_rules": [
                           {
                               "conditions": [],
                               "options": {
                                   "stop_processing": true
                               },
                               "conditions_policy": "ALWAYS",
                               "name": "match_service_account",
                               "tags": {},
                               "actions": {
                                   "match_service_account": {
                                       "source": "account",
                                       "target": "data.project_id"
                                   }
                               }
                           }
                       ]
                   },
                   "secret_id": "secret-354d142229e5",
                   "upgrade_mode": "AUTO"
               },
               "template": {},
               "tags": {},
               "cost_tag_keys": [],
               "cost_additional_info_keys": [],
               "domain_id": "domain-58010aa2e451",
               "created_at": "2022-04-13T05:34:54.223Z",
               "last_synchronized_at": "2022-07-17T16:00:08.254Z"
           }
       ],
       "total_count": 2
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}


    
<br>

### stat





> **POST** /cost-analysis/v1/data-source/stat
>






    


<br>
<br>

## Message



### DataSourceInfo
* **data_source_id** (string)   `Required` 

    
* **name** (string)   `Required` 

    
* **state** (State)   `Required` 

    
* **data_source_type** (DataSourceType)   `Required` 

    
* **provider** (string)   `Required` 

    
* **plugin_info** (PluginInfo)   `Required` 

    
* **template** (Struct)   `Required` 

    
* **tags** (Struct)   `Required` 

    
* **cost_tag_keys** (string)  `Repeated`    `Required` 

    
* **cost_additional_info_keys** (string)  `Repeated`    `Required` 

    
* **domain_id** (string)   `Required` 

    
* **secret_type** (SecretType)   `Required` 

    
* **secret_filter** (SecretFilter)   `Required` 

    
* **created_at** (string)   `Required` 

    
* **last_synchronized_at** (string)   `Required` 

    <br>

### DataSourceQuery
* **domain_id** (string)   `Required` 

    
* **query** (Query)  

    
* **data_source_id** (string)  

    
* **name** (string)  

    
* **state** (string)  

    
* **data_source_type** (DataSourceType)  

    
* **provider** (string)  

    <br>

### DataSourceRequest
* **data_source_id** (string)   `Required` 

    
* **domain_id** (string)   `Required` 

    <br>

### DataSourceStatQuery
* **query** (StatisticsQuery)   `Required` 

    
* **domain_id** (string)   `Required` 

    <br>

### DataSourcesInfo
* **results** (DataSourceInfo)  `Repeated`    `Required` 

    
* **total_count** (int32)   `Required` 

    <br>

### DeregisterDataSourceRequest
* **data_source_id** (string)   `Required` 

    
* **domain_id** (string)   `Required` 

    
* **cascade_delete_cost** (bool)  

  *Default value is true. If true delete all cost data related to data_source_id*

    <br>

### GetDataSourceRequest
* **data_source_id** (string)   `Required` 

    
* **domain_id** (string)   `Required` 

    
* **only** (string)  `Repeated`   

    <br>

### PluginInfo
* **plugin_id** (string)   `Required` 

    
* **version** (string)   `Required` 

    
* **options** (Struct)   `Required` 

    
* **metadata** (Struct)   `Required` 

    
* **secret_data** (Struct)   `Required` 

    
* **schema** (string)   `Required` 

    
* **secret_id** (string)   `Required` 

    
* **upgrade_mode** (UpgradeMode)   `Required` 

    <br>

### RegisterDataSourceRequest
* **name** (string)   `Required` 

    
* **data_source_type** (DataSourceType)   `Required` 

    
* **domain_id** (string)   `Required` 

    
* **provider** (string)  

    
* **template** (Struct)  

    
* **plugin_info** (PluginInfo)  

    
* **tags** (Struct)  

    
* **secret_type** (SecretType)  

    
* **secret_filter** (SecretFilter)  

    <br>

### SecretFilter
* **state** (SecretFilterState)   `Required` 

    
* **secrets** (string)  `Repeated`    `Required` 

    
* **service_accounts** (string)  `Repeated`    `Required` 

    
* **schemas** (string)  `Repeated`    `Required` 

    <br>

### SyncDataSourceRequest
* **data_source_id** (string)   `Required` 

    
* **domain_id** (string)   `Required` 

    
* **start** (string)  

    
* **no_preload_cache** (bool)  

    <br>

### UpdateDataSourcePluginRequest
* **data_source_id** (string)   `Required` 

    
* **domain_id** (string)   `Required` 

    
* **version** (string)  

    
* **options** (Struct)  

    
* **upgrade_mode** (UpgradeMode)  

    <br>

### UpdateDataSourceRequest
* **data_source_id** (string)   `Required` 

    
* **domain_id** (string)   `Required` 

    
* **name** (string)  

    
* **template** (Struct)  

    
* **tags** (Struct)  

    
* **secret_filter** (SecretFilter)  

    <br>
