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
                    <g:link class="navbar-brand" action="index">Anime Project Senpai</g:link>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><g:link controller="show" action="newShowForm">New Show</g:link></li>
                        <li><g:link controller="show" action="pendingShow">Moderate Shows</g:link></li>
                        <li><g:link controller="user" action="account">Account</g:link></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>
        <g:layoutBody/>
        <div class="footer" role="contentinfo"></div>
        <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
    </body>
</html>
