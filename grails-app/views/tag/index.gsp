<%--
  Created by IntelliJ IDEA.
  User: Zachary Jaghory
  Date: 4/11/16
  Time: 4:58 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Tags</title>
    <meta name="layout" content="main">
</head>

<body>
<div class="container white">
    <h1>Tag Management</h1>

    <g:link action="create"><button id="btn_create" type="button">Create</button></g:link>

    <g:each var="tag" in="${tags}">
        <li><g:link action="show" id="${tag.id}">${tag.name}</g:link></li>
    </g:each>
</div>
</body>
</html>