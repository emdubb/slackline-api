# What's Slackin API

_**[OVERVIEW](#overview)**_ | 
_**[GETTING STARTED](#start)**_ | 
_**[ENDPOINT REFERENCE](#endpoint)**_ | 
_**[AUTHORIZATION](#auth)**_ | 
_**[DATA MODEL](#model)**_

<a name="overview"></a>
## Overview

This API provides information about active slacklines to use in the What's Slackin'? App.

### Technologies Used

* Ruby/Rails
* jBuilder
* jwt
* [PostgreSQL](http://www.postgresql.org/docs/)

<a name="start"></a>
## Getting Started

Run `bundle install`

<a name="endpoint"></a>
## Endpoint Reference

Rails Route | HTTP Verb  | Endpoint                                | Access    
:----------:|:----------:|-----------------------------------------|:---------------:
**INDEX**   | `GET`      | `/`                                     | 
**INDEX**   | `GET`      | [`/api/users`](#allUsers)                           
**CREATE**  | `POST`     | [`/api/users`](#newUser)                            
**SHOW**    | `GET`      | [`/api/users/:id`](#getUser)                        
**UPDATE**  | `PATCH/PUT`| [`/api/users/:id`](#updateUser)             
**DESTROY** | `DELETE`   | [`/api/users/:id`](#deleteUser)         
**INDEX**   | `GET`      | [`/api/users/:user_id/lines`](#getLines)         
**CREATE**  | `POST`     | [`/api/users/:user_id/lines`](#newLine)
**UPDATE**  | `PATCH/PUT`| [`/api/lines/:id`](#updateLine)
**DESTROY** | `DELETE`   | [`/api/lines/:id`](#deleteLine)         
**INDEX**   | `GET`      | [`/api/lines/:line_id/posts`](#allPosts)
**CREATE**  | `POST`     | [`/api/lines/:line_id/posts`](#newPost)
**SHOW**    | `GET`      | [`/api/posts/:id`](#getPost)
**UPDATE**  | `PATCH/PUT`| [`/api/posts/:id`](#updatePost)
**INDEX**   | `GET`      | [`/api/posts/:post_id/comments`](#allComments)            
**CREATE**  | `POST`     | [`/api/posts/:post_id/comments`](#newComment)
**UPDATE**  | `PATCH/PUT`| [`/api/comments/:id`](#udateComment)
**DESTROY** | `DELETE`   | [`/api/comments/:id`](#deleteComment) 





<a name="auth"></a>
###Authorization

<a name="model"></a>
###Data Models



---
© 2016 EM DUBB
