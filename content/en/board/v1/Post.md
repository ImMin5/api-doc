---
title: "Post"
linkTitle: "Post"
weight: 3
bookFlatSection: true
---
# [Post](#Post)
A Post is a message published on a Board. It also provides notifications to Projects affected by the Post.


>  **Package : spaceone.api.board.v1**

<br>
<br>

## Post


**Post Methods:**


| Method | Request | Response |
| :----- | :-------- | :-------- |
| [**create**](./Post#create) | [CreatePostRequest](Post#createpostrequest) | [PostInfo](./Post#postinfo) |
| [**update**](./Post#update) | [UpdatePostRequest](Post#updatepostrequest) | [PostInfo](./Post#postinfo) |
| [**send_notification**](./Post#send_notification) | [SendNotificationRequest](Post#sendnotificationrequest) | [Empty](./Post#empty) |
| [**delete**](./Post#delete) | [PostRequest](Post#postrequest) | [Empty](./Post#empty) |
| [**get**](./Post#get) | [GetPostRequest](Post#getpostrequest) | [PostInfo](./Post#postinfo) |
| [**list**](./Post#list) | [PostQuery](Post#postquery) | [PostsInfo](./Post#postsinfo) |
| [**stat**](./Post#stat) | [PostStatQuery](Post#poststatquery) | [Struct](./Post#struct) |



    
<br>

### create

> **POST** /board/v1/board/create
>




 {{< tabs " create " >}}

 {{< tab "Request Example" >}}



[CreatePostRequest](./Post#createpostrequest)

* **board_id** (string)  `Required` 

  *is_required: true*


* **category** (string)  `Required` 

  *is_required: false*


* **title** (string)  `Required` 

  *is_required: true*


* **contents** (string)  `Required` 

  *is_required: true*


* **options** (Struct)  `Required` 

  *is_required: false*


* **writer** (string)  `Required` 

  *is_required: false*


* **files** (string)  `Required` 

  *is_required: false*


* **domain_id** (string)  `Required` 

  *is_required: false*





{{< highlight json >}}
{
"board_id": "board-123456789012",
"category": "developer",
"title": "title",
"contents": "This is contents.",
"options": {"is_popup": true},
"writer": "user1",
"domain_id": "domain-123456789012"
}
{{< /highlight >}}
{{< /tab >}}


 {{< tab "Response Example" >}}

[PostInfo](#POSTINFO)
* **board_id** (string)  `Required` 

* **post_id** (string)  `Required` 

* **post_type** (PostType)  `Required` 

* **category** (string)  `Required` 

* **title** (string)  `Required` 

* **contents** (string)  `Required` 

* **options** (Struct)  `Required` 

* **view_count** (int32)  `Required` 

* **writer** (string)  `Required` 

* **scope** (Scope)  `Required` 

* **files** (ListValue)  `Required` 

* **domain_id** (string)  `Required` 

* **user_id** (string)  `Required` 

* **user_domain_id** (string)  `Required` 

* **created_at** (string)  `Required` 

* **updated_at** (string)  `Required` 



{{< highlight json >}}
{
"board_id": "board-123456789012",
"post_id": "post-123456789012",
"post_type": "INTERNAL",
"category": "developer",
"title": "title",
"contents": "This is contents.",
"options": {
"is_pinned": false,
"is_popup": true
},
"view_count": 0,
"writer": "user1",
"scope": "DOMAIN",
"domain_id": "domain-123456789012",
"user_id": "user1@email.com",
"created_at": "2022-01-01T01:06:23.732Z",
"updated_at": "2022-01-01T01:06:23.732Z"
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}

    
<br>

### update

> **POST** /board/v1/board/update
>




 {{< tabs " update " >}}

 {{< tab "Request Example" >}}



[UpdatePostRequest](./Post#updatepostrequest)

* **board_id** (string)  `Required` 

  *is_required: true*


* **post_id** (string)  `Required` 

  *is_required: true*


* **category** (string)  `Required` 

  *is_required: false*


* **title** (string)  `Required` 

  *is_required: false*


* **contents** (string)  `Required` 

  *is_required: false*


* **options** (Struct)  `Required` 

  *is_required: false*


* **writer** (string)  `Required` 

  *is_required: false*


* **files** (string)  `Required` 

  *is_required: false*


* **domain_id** (string)  `Required` 

  *is_required: false*





{{< highlight json >}}
{
"board_id": "board-123456789012",
"post_id": "post-2118473ce15e",
"category": "developer",
"title": "title2",
"contents": "this is contents2.",
"options": {
"is_popup": false,
"is_pinned": true
},
"writer": "user1",
"domain_id": "domain-123456789012"
}
{{< /highlight >}}
{{< /tab >}}


 {{< tab "Response Example" >}}

[PostInfo](#POSTINFO)
* **board_id** (string)  `Required` 

* **post_id** (string)  `Required` 

* **post_type** (PostType)  `Required` 

* **category** (string)  `Required` 

* **title** (string)  `Required` 

* **contents** (string)  `Required` 

* **options** (Struct)  `Required` 

* **view_count** (int32)  `Required` 

* **writer** (string)  `Required` 

* **scope** (Scope)  `Required` 

* **files** (ListValue)  `Required` 

* **domain_id** (string)  `Required` 

* **user_id** (string)  `Required` 

* **user_domain_id** (string)  `Required` 

* **created_at** (string)  `Required` 

* **updated_at** (string)  `Required` 



{{< highlight json >}}
{
"board_id": "board-123456789012",
"post_id": "post-123456789012",
"post_type": "INTERNAL",
"category": "developer",
"title": "title",
"contents": "This is contents.",
"options": {
"is_pinned": false,
"is_popup": true
},
"view_count": 0,
"writer": "user1",
"scope": "DOMAIN",
"domain_id": "domain-123456789012",
"user_id": "user1@email.com",
"created_at": "2022-01-01T01:06:23.732Z",
"updated_at": "2022-01-01T01:06:23.732Z"
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}

    
<br>

### send_notification

> **POST** /board/v1/board/send-notification
>




 {{< tabs " send_notification " >}}




{{< /tabs >}}

    
<br>

### delete

> **POST** /board/v1/board/delete
>




 {{< tabs " delete " >}}

 {{< tab "Request Example" >}}



[PostRequest](./Post#postrequest)

* **board_id** (string)  `Required` 

  *is_required: true*


* **post_id** (string)  `Required` 

  *is_required: true*


* **domain_id** (string)  `Required` 

  *is_required: false*





{{< highlight json >}}
{
"board_id": "board-b9aa34e65c60",
"post_id": "post-2118473ce15e",
"domain_id": "domain-123456789012"
}
{{< /highlight >}}
{{< /tab >}}



{{< /tabs >}}

    
<br>

### get

> **POST** /board/v1/board/get
>




 {{< tabs " get " >}}

 {{< tab "Request Example" >}}



[GetPostRequest](./Post#getpostrequest)

* **board_id** (string)  `Required` 

  *is_required: true*


* **post_id** (string)  `Required` 

  *is_required: true*


* **only** (string)  `Required` 

  *is_required: false*


* **domain_id** (string)  `Required` 

  *is_required: false*





{{< highlight json >}}
{
"board_id": "board-b9aa34e65c60",
"post_id": "post-2118473ce15e",
"domain_id": "domain-58010aa2e451"
}
{{< /highlight >}}
{{< /tab >}}


 {{< tab "Response Example" >}}

[PostInfo](#POSTINFO)
* **board_id** (string)  `Required` 

* **post_id** (string)  `Required` 

* **post_type** (PostType)  `Required` 

* **category** (string)  `Required` 

* **title** (string)  `Required` 

* **contents** (string)  `Required` 

* **options** (Struct)  `Required` 

* **view_count** (int32)  `Required` 

* **writer** (string)  `Required` 

* **scope** (Scope)  `Required` 

* **files** (ListValue)  `Required` 

* **domain_id** (string)  `Required` 

* **user_id** (string)  `Required` 

* **user_domain_id** (string)  `Required` 

* **created_at** (string)  `Required` 

* **updated_at** (string)  `Required` 



{{< highlight json >}}
{
"board_id": "board-123456789012",
"post_id": "post-123456789012",
"post_type": "INTERNAL",
"category": "developer",
"title": "title",
"contents": "This is contents.",
"options": {
"is_pinned": false,
"is_popup": true
},
"view_count": 0,
"writer": "user1",
"scope": "DOMAIN",
"domain_id": "domain-123456789012",
"user_id": "user1@email.com",
"created_at": "2022-01-01T01:06:23.732Z",
"updated_at": "2022-01-01T01:06:23.732Z"
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}

    
<br>

### list

> **POST** /board/v1/board/list
>




 {{< tabs " list " >}}

 {{< tab "Request Example" >}}



[PostQuery](./Post#postquery)

* **board_id** (string)  `Required` 

  *is_required: true*


* **post_id** (string)  `Required` 

  *is_required: false*


* **post_type** (PostType)  `Required` 

  *is_required: false*


* **category** (string)  `Required` 

  *is_required: false*


* **writer** (string)  `Required` 

  *is_required: false*


* **scope** (Scope)  `Required` 

  *is_required: false*


* **user_id** (string)  `Required` 

  *is_required: false*


* **user_domain_id** (string)  `Required` 

  *is_required: false*


* **domain_id** (string)  `Required` 

  *is_required: false*


* **query** (Query)  `Required` 

  *is_required: false*





{{< highlight json >}}
{
"board_id": "board-b9aa34e65c60",
"query": {}
}
{{< /highlight >}}
{{< /tab >}}


 {{< tab "Response Example" >}}

[PostsInfo](#POSTSINFO)
* **results** (PostInfo)  `Required` 

* **total_count** (int32)  `Required` 



{{< highlight json >}}
{
"results": [
{
"board_id": "board-b9aa34e65c60",
"post_id": "post-2118473ce15e",
"post_type": "INTERNAL",
"category": "spaceone",
"title": "title2",
"contents": "this is contents2.",
"options": {
"is_popup": false,
"is_pinned": true
},
"view_count": 3,
"writer": "seolmin2",
"scope": "DOMAIN",
"domain_id": "domain-58010aa2e451",
"user_id": "user1@email.com",
"created_at": "2022-06-13T01:06:23.732Z",
"updated_at": "2022-06-13T01:06:23.732Z"
},
{
"board_id": "board-b9aa34e65c60",
"post_id": "post-532ae1191233",
"post_type": "INTERNAL",
"category": "flower",
"title": "작업공지",
"contents": "This is description",
"options": {
"is_pinned": true,
"is_popup": true
},
"writer": "권설민",
"scope": "PUBLIC",
"user_id": "supervisor",
"created_at": "2022-06-10T07:01:44.384Z",
"updated_at": "2022-06-10T07:01:44.384Z"
}
],
"total_count": 2
}
{{< /highlight >}}
{{< /tab >}}


{{< /tabs >}}

    
<br>

### stat

> **POST** /board/v1/board/stat
>




 {{< tabs " stat " >}}




{{< /tabs >}}

    


<br>
<br>

## Message



### CreatePostRequest
* **board_id** (string)  `Required` 

  *is_required: true*

    
* **category** (string)  `Required` 

  *is_required: false*

    
* **title** (string)  `Required` 

  *is_required: true*

    
* **contents** (string)  `Required` 

  *is_required: true*

    
* **options** (Struct)  `Required` 

  *is_required: false*

    
* **writer** (string)  `Required` 

  *is_required: false*

    
* **files** (string)  `Required` 

  *is_required: false*

    
* **domain_id** (string)  `Required` 

  *is_required: false*

    <br>

### GetPostRequest
* **board_id** (string)  `Required` 

  *is_required: true*

    
* **post_id** (string)  `Required` 

  *is_required: true*

    
* **only** (string)  `Required` 

  *is_required: false*

    
* **domain_id** (string)  `Required` 

  *is_required: false*

    <br>

### PostInfo
* **board_id** (string)  `Required` 

    
* **post_id** (string)  `Required` 

    
* **post_type** (PostType)  `Required` 

    
* **category** (string)  `Required` 

    
* **title** (string)  `Required` 

    
* **contents** (string)  `Required` 

    
* **options** (Struct)  `Required` 

    
* **view_count** (int32)  `Required` 

    
* **writer** (string)  `Required` 

    
* **scope** (Scope)  `Required` 

    
* **files** (ListValue)  `Required` 

    
* **domain_id** (string)  `Required` 

    
* **user_id** (string)  `Required` 

    
* **user_domain_id** (string)  `Required` 

    
* **created_at** (string)  `Required` 

    
* **updated_at** (string)  `Required` 

    <br>

### PostQuery
* **board_id** (string)  `Required` 

  *is_required: true*

    
* **post_id** (string)  `Required` 

  *is_required: false*

    
* **post_type** (PostType)  `Required` 

  *is_required: false*

    
* **category** (string)  `Required` 

  *is_required: false*

    
* **writer** (string)  `Required` 

  *is_required: false*

    
* **scope** (Scope)  `Required` 

  *is_required: false*

    
* **user_id** (string)  `Required` 

  *is_required: false*

    
* **user_domain_id** (string)  `Required` 

  *is_required: false*

    
* **domain_id** (string)  `Required` 

  *is_required: false*

    
* **query** (Query)  `Required` 

  *is_required: false*

    <br>

### PostRequest
* **board_id** (string)  `Required` 

  *is_required: true*

    
* **post_id** (string)  `Required` 

  *is_required: true*

    
* **domain_id** (string)  `Required` 

  *is_required: false*

    <br>

### PostStatQuery
* **query** (StatisticsQuery)  `Required` 

  *is_required: true*

    
* **domain_id** (string)  `Required` 

  *is_required: true*

    <br>

### PostsInfo
* **results** (PostInfo)  `Required` 

    
* **total_count** (int32)  `Required` 

    <br>

### SendNotificationRequest
* **board_id** (string)  `Required` 

  *is_required: true*

    
* **post_id** (string)  `Required` 

  *is_required: true*

    
* **domain_id** (string)  `Required` 

  *is_required: false*

    <br>

### UpdatePostRequest
* **board_id** (string)  `Required` 

  *is_required: true*

    
* **post_id** (string)  `Required` 

  *is_required: true*

    
* **category** (string)  `Required` 

  *is_required: false*

    
* **title** (string)  `Required` 

  *is_required: false*

    
* **contents** (string)  `Required` 

  *is_required: false*

    
* **options** (Struct)  `Required` 

  *is_required: false*

    
* **writer** (string)  `Required` 

  *is_required: false*

    
* **files** (string)  `Required` 

  *is_required: false*

    
* **domain_id** (string)  `Required` 

  *is_required: false*

    <br>
