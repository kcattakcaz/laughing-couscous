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
</head>

<body>

<g:each var="tag" in="${tags}">
    ${tag}<br>
</g:each>

</body>
</html>