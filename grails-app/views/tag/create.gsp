<%--
  Created by IntelliJ IDEA.
  User: Zachary Jaghory
  Date: 4/11/16
  Time: 4:58 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Tag Management</title>
    <meta name="layout" content="main">
</head>

<body>
<div class="container">
    <g:form name="createTag" url="[action: 'store', controller: 'tag']">

        <div class="form-group">
            <label class="white" for="name">Tag Name:</label>
            <g:textField class="form-control" name="name"/>
        </div>

        <div class="form-group">
            <g:submitButton class="btn btn-success" name="Create" value="Create"/>
        </div>


    </g:form>
</div>
</body>
</html>