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
    <meta name="layout" content="main">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="bootstrap-theme.min.css"/>
    <asset:javascript src="bootstrap.min.js"/>

</head>

<body>

<%--<div class="row">
    <div class="col-md-1">.col-md-1</div>
    <div class="col-md-1">.col-md-1</div>
    <div class="col-md-1">.col-md-1</div>
    <div class="col-md-1">.col-md-1</div>
    <div class="col-md-1">.col-md-1</div>
    <div class="col-md-1">.col-md-1</div>
    <div class="col-md-1">.col-md-1</div>
    <div class="col-md-1">.col-md-1</div>
    <div class="col-md-1">.col-md-1</div>
    <div class="col-md-1">.col-md-1</div>
    <div class="col-md-1">.col-md-1</div>
    <div class="col-md-1">.col-md-1</div>
</div>
<div class="row">
    <div class="col-md-8">.col-md-8</div>
    <div class="col-md-4">.col-md-4</div>
</div>
<div class="row">
    <div class="col-md-4">.col-md-4</div>
    <div class="col-md-4">.col-md-4</div>
    <div class="col-md-4">.col-md-4</div>
</div>
<div class="row">
    <div class="col-md-6">.col-md-6</div>
    <div class="col-md-6">.col-md-6</div>
</div>

<div class="row">
    <div class="col-sm-6 col-sm-offset-3">
        Level 1: .col-sm-9
        <div class="jumbotron">
            <div class="row">
                <div class="col-xs-8 col-sm-6" style="margin-top: -35px">
                    <div class="thumbnail">
                        <img src="http://placehold.it/750x325" alt="...">
                        <div class="caption">
                            <p><a href="#" class="btn btn-primary" role="button">Favorite</a>  <span style="padding-left: 150px"><a href="#" class="btn btn-default" role="button" >Replace with rating stars</a></span>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-xs-4 col-sm-6" style="margin-top: -35px">
                    Name: ${show.name}
                </div>

                <div class="col-xs-4 col-sm-6" style="margin-top: 5px">
                    Description: <span style="font-size: large">Obviously the best anime ever.</span> Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.
                It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                </div>

            </div>
            <div class="row">
                <div class="col-md-12">
                    Tags: Best, Ever, No, Debate, Amazing, Lul, Anime, Kamehameha, Rekt, IDK, Anymore, Tags
                </div>
            </div>
        </div>
    </div>
</div>--%>


</div>
</div>
<g:if test="${shows}">
    <g:each var="show" in="${shows}">

        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <div class="jumbotron">
                    <div class="row">
                        <div class="col-xs-8 col-sm-6" style="margin-top: -35px">
                            <div class="thumbnail">
                                <img src="http://placehold.it/2500x2000" alt="...">

                                <div class="caption">
                                    <p>
                                        <g:form controller="show" action="addFavorite">
                                            <g:hiddenField name="id" value="${show.id}"/>
                                            <button type="submit" class="btn btn-primary">Favorite</button>
                                        </g:form>
                                        <span style="padding-left: 150px"><a href="#" class="btn btn-default" role="button">Replace with rating stars</a></span>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-4 col-sm-6" style="margin-top: -35px">
                            Name: ${show.name}
                        </div>

                        <div class="col-xs-4 col-sm-6" style="margin-top: 5px">
                            Show Start: ${show.start_year}
                        </div>

                        <div class="col-xs-4 col-sm-6" style="margin-top: 5px">
                            Show End: ${show.end_year}
                        </div>

                        <div class="col-xs-4 col-sm-6" style="margin-top: 5px">
                            Number of Episodes: ${show.num_episodes}
                        </div>

                        <div class="col-xs-4 col-sm-6" style="margin-top: 5px">
                            Description: ${show.description}
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            Tags: <%--${show.tags.name.join(", ")}--%>
                        </div>

                        <div class="col-md-12">
                            <g:form controller="show" action="deleteShow">
                                <g:hiddenField name="id" value="${show.id}"/>
                                <sec:ifAllGranted roles="ROLE_ADMIN"><td><p align="center">
                                    <g:submitButton name="Delete"/></p></td></sec:ifAllGranted>
                            </g:form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    <%-- Saving for now, can be deleted later </g:form>
    <table border="1px">
        <tr>
            <g:form controller="show" action="deleteShow">
                <td>${show.name}</td>
                <td><g:formatDate format="yyyy" date="${show.start_year}"/></td>
                <td><g:formatDate format="yyyy" date="${show.end_year}"/> </td>
                <td>${show.description}</td>
                <td>${show.num_episodes}</td>
                <td>${show.tags.name.join(", ")}</td>
                <g:hiddenField name="id" value="${show.id}" />
                <sec:ifAllGranted roles="ROLE_ADMIN"><td><p align="center"><g:submitButton name="Delete"/></p></td></sec:ifAllGranted>
            </g:form>
        </tr>
    </table>--%>

    </g:each>
</g:if>
<g:else>
    <p>No shows currently added. Add a show to the approval list.</p><br/>

</g:else>
</body>
</html>