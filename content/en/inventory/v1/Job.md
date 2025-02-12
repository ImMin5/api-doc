---
title: "Job"
linkTitle: "Job"
weight: 3
bookFlatSection: true
---
# [Job](#Job)
A Job is an act of collecting external cloud resources through plugins.


>  **Package : spaceone.api.inventory.v1**

<br>
<br>

## Job





**Job Methods:**


| Method | Request | Response |
| :----- | :-------- | :-------- |
| [**delete**](./Job#delete) | [JobRequest](Job#jobrequest) | [Empty](Job#empty) |
| [**get**](./Job#get) | [GetJobRequest](Job#getjobrequest) | [JobInfo](Job#jobinfo) |
| [**list**](./Job#list) | [JobsQuery](Job#jobsquery) | [JobsInfo](Job#jobsinfo) |
| [**analyze**](./Job#analyze) | [JobAnalyzeQuery](Job#jobanalyzequery) | [Struct](Job#struct) |
| [**stat**](./Job#stat) | [JobStatQuery](Job#jobstatquery) | [Struct](Job#struct) |



    
<br>

### delete

Deletes a specific Job. You must specify the `job_id` of the Job to delete.



> **POST** /inventory/v1/job/delete
>





 {{< tabs " delete " >}}

 {{< tab "Request Example" >}}



[JobRequest](./Job#jobrequest)

* **job_id** (string)   `Required` 


* **domain_id** (string)   `Required` 





{{< highlight json >}}
{
   "job_id": "job-123456789012",
   "domain_id": "domain-123456789012"
}
{{< /highlight >}}
{{< /tab >}}



{{< /tabs >}}


    
<br>

### get

Gets a specific Job. Prints detailed information about the Job, including its state, total tasks, and collector info.



> **POST** /inventory/v1/job/get
>





 {{< tabs " get " >}}

 {{< tab "Request Example" >}}



[GetJobRequest](./Job#getjobrequest)

* **job_id** (string)   `Required` 


* **domain_id** (string)   `Required` 


* **only** (string)  `Repeated`   





{{< highlight json >}}
{
   "job_id": "job-123456789012",
   "domain_id": "domain-123456789012"
}
{{< /highlight >}}
{{< /tab >}}



{{< /tabs >}}


    
<br>

### list

Gets a list of all Jobs. You can use a query to get a filtered list of Jobs.



> **POST** /inventory/v1/job/list
>





 {{< tabs " list " >}}

 {{< tab "Request Example" >}}



[JobsQuery](./Job#jobsquery)

* **domain_id** (string)   `Required` 


* **query** (Query)  


* **job_id** (string)  


* **status** (JobStatus)  


* **collector_id** (string)  


* **secret_id** (string)  





{{< highlight json >}}
{
   "query": {}
}
{{< /highlight >}}
{{< /tab >}}


 {{< tab "Response Example" >}}

[JobsInfo](#JOBSINFO)
* **results** (JobInfo)  `Repeated`   `Required` 

* **total_count** (int32)   `Required` 



{{< highlight json >}}
{
   "results": [
       {
           "job_id": "job-3b124006c2d2",
           "status": "SUCCESS",
           "filter": {},
           "total_tasks": 2,
           "collector_info": {
               "collector_id": "collector-accd02663b3d",
               "name": "openstack-collector",
               "state": "ENABLED",
               "plugin_info": {
                   "plugin_id": "plugin-openstack-inven-collector",
                   "version": "0.4.2.20220616.134758"
               },
               "provider": "openstack",
               "capability": {
                   "supported_schema": [
                       "openstack_credentials"
                   ]
               },
               "is_public": true
           },
           "domain_id": "domain-58010aa2e451",
           "created_at": "2022-06-17T08:00:01.225Z",
           "updated_at": "2022-06-17T08:00:01.225Z",
           "finished_at": "2022-06-17T08:00:15.197Z"
       },
       {
           "job_id": "job-587a3d3b4db3",
           "status": "SUCCESS",
           "filter": {},
           "total_tasks": 3,
           "collector_info": {
               "collector_id": "collector-2c0847644f39",
               "name": "AWS stat-kwon Collector",
               "state": "ENABLED",
               "plugin_info": {
                   "plugin_id": "plugin-30d21ef75a5d",
                   "version": "1.13.13.20220610.143142"
               },
               "provider": "aws",
               "capability": {
                   "supported_schema": [
                       "aws_access_key"
                   ]
               },
               "is_public": true
           },
           "domain_id": "domain-58010aa2e451",
           "created_at": "2022-06-17T08:00:00.407Z",
           "updated_at": "2022-06-17T08:00:00.407Z",
           "finished_at": "2022-06-17T08:07:32.023Z"
       }
   ],
   "total_count": 2
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}


    
<br>

### analyze





> **POST** /inventory/v1/job/analyze
>






    
<br>

### stat





> **POST** /inventory/v1/job/stat
>






    


<br>
<br>

## Message



### GetJobRequest
* **job_id** (string)   `Required` 

    
* **domain_id** (string)   `Required` 

    
* **only** (string)  `Repeated`   

    <br>

### JobAnalyzeQuery
* **query** (AnalyzeQuery)   `Required` 

    
* **domain_id** (string)   `Required` 

    <br>

### JobRequest
* **job_id** (string)   `Required` 

    
* **domain_id** (string)   `Required` 

    <br>

### JobStatQuery
* **query** (StatisticsQuery)   `Required` 

    
* **domain_id** (string)   `Required` 

    <br>

### JobsInfo
* **results** (JobInfo)  `Repeated`    `Required` 

    
* **total_count** (int32)   `Required` 

    <br>

### JobsQuery
* **domain_id** (string)   `Required` 

    
* **query** (Query)  

    
* **job_id** (string)  

    
* **status** (JobStatus)  

    
* **collector_id** (string)  

    
* **secret_id** (string)  

    <br>
