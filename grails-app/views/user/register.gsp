<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<h1>Register</h1>

<g:form action="createUser">
    <g:textField placeholder="Username" name="name" />
    <g:textField placeholder="Email" name="email" />
    <g:passwordField placeholder="Password" name="password" />
    <g:submitButton name="submit" value="Submit" />
</g:form>
</body>
</html>