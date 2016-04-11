<%--
  Created by IntelliJ IDEA.
  User: StephenManz
  Date: 3/31/2016
  Time: 6:21 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
    <sec:ifAnyGranted roles="ROLE_ADMIN"><g:link action="newShowForm">Add Show</g:link></sec:ifAnyGranted>
    <sec:ifAnyGranted roles="ROLE_ADMIN"><g:link action="pendingShow">Pending Shows</g:link></sec:ifAnyGranted>
    <g:each var="item" in="${show}"></g:each>
</body>
</html>