<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title><g:message code='springSecurity.login.title'/></title>
</head>

<body>
<div class="row">
    <div class="col-md-offset-4 col-xs-4">
        <div class="page-header"><h2><g:message code='springSecurity.login.header'/></h2></div>

        <g:if test='${flash.message}'>
            <div class="login_message">${flash.message}</div>
        </g:if>

        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="form" autocomplete="off">
            <div class="form-group">
                %{--<label for="username"><g:message code='springSecurity.login.username.label'/>:</label>--}%
                <input placeholder="Username" type="text" class="form-control" name="${usernameParameter ?: 'username'}" id="username"/>
            </div>

            <div class="form-group">
                %{--<label for="password"><g:message code='springSecurity.login.password.label'/>:</label>--}%
                <input placeholder="Password" type="password" class="form-control" name="${passwordParameter ?: 'password'}" id="password"/>
            </div>

            <div class=form-group">
                <label class="checkbox-inline" for="remember_me">
                    <input type="checkbox" class="checkbox" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                    Remember Me</label>
            </div>
            <br>

            <div class="form-group">
                <input type="submit" id="submit" class="btn btn-success btn-block" value="${message(code: 'springSecurity.login.button')}"/><br>
               <g:link class="register" controller="user" action="register"> <button type="button" class="btn btn-primary btn-block">Register</button></g:link>
            </div>

        </form>
    </div>
</div>
<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>

</body>
</html>
