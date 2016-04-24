<!doctype html>
<html lang="en" class="no-js">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><g:layoutTitle default="Grails"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <asset:stylesheet src="application.css"/>
        <asset:javascript src="application.js"/>
        <asset:stylesheet src="bootstrap.min.css"/>
        <asset:stylesheet src="bootstrap-theme.min.css"/>
        <asset:javascript src="bootstrap.min.js"/>

        <g:layoutHead/>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <g:link class="navbar-brand" controller="show" action="index">Anime Project Senpai</g:link>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <sec:ifAnyGranted roles="ROLE_ADMIN"><li><g:link controller="show" action="newShowForm">New Show</g:link></li></sec:ifAnyGranted>
                        <sec:ifAnyGranted roles="ROLE_ADMIN"><li><g:link controller="show" action="pendingShow">Moderate Shows</g:link></li></sec:ifAnyGranted>
                        <sec:ifAnyGranted roles="ROLE_ADMIN"><li><g:link controller="tag" action="create">New Tag</g:link></li></sec:ifAnyGranted>
                        <sec:ifLoggedIn><li><g:link controller="user" action="account">Account</g:link></li></sec:ifLoggedIn>
                        <sec:ifLoggedIn><li><g:link controller="logout">Logout</g:link></li></sec:ifLoggedIn>
                        <sec:ifNotLoggedIn><li><g:link controller="login" action="auth">Login</g:link></li></sec:ifNotLoggedIn>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>
        <g:layoutBody/>
        <div class="footer" role="contentinfo"></div>
        <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
    </body>
</html>
