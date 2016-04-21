<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
    <style type="text/css" media="screen">
        input {
            margin-bottom: 15px;
            height: 40px;
            width: 300px;
            padding: 5px;
        }

        form {
            text-align: center;
            border: 2px solid #9b9b9b;
            width: 360px;
            padding: 10px 20px 20px 20px;
            margin: auto;
            position: relative;
            top: 70px;
            background-color: #f0f0fa;
        }
    </style>
</head>

<body>
<div class="container">
    <g:form action="createUser">
        <h1>Register</h1>
        <br>
        <g:textField required placeholder="Username" name="name" /><br>
        <g:textField required placeholder="Email" name="email" /><br>
        <g:passwordField required placeholder="Password" name="password" /><br>
        <g:submitButton name="submit" value="Submit" />
    </g:form>
</div>
</body>
</html>