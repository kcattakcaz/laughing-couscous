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

        <label class="white" for="name">Tag Name:</label>
        <g:textField name="name"/>

        <g:submitButton name="Create" value="Create"/>

    </g:form>
</div>
</body>
</html>