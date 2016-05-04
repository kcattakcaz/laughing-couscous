<%--
  Created by IntelliJ IDEA.
  User: bigka
  Date: 5/3/2016
  Time: 9:06 PM
--%>

<%@ page import="anime.Favorite" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
</head>

<body>

<div class="container-fluid searchbox">
    <g:form action="search">
        <g:textField placeholder="Search" name="search"/>
        <button type="submit" value="Search"><span class="glyphicon glyphicon-search"/></button>
    </g:form>
</div>
<br>
<div class="container">
    <g:if test="${shows}">
        <g:each var="show" in="${shows}">
            <div class="well well-lg">
                <div class="row">
                    <h2>${show.name} <small><g:formatDate format="yyyy" date="${show.start_year}"/> - <g:formatDate format="yyyy" date="${show.end_year}"/></small></h2>
                </div>

                <div class="row">
                    <div class="col-xs-4">
                        <div class="thumbnail">
                            <img class="showImage" src="${createLink(controller:'show', action:'show_image', id: show.id)}" />
                        </div>
                    </div>

                    <div class=" col-xs-12 rating align" data-toggle="tooltip" title="${user && Rating.findByShowAndUser(show, user) ? "Overall rating: " + show.rating + ", Your rating: " + Rating.findByShowAndUser(show, user).stars.toFloat() : show.rating ? "Overall rating: " + show.rating : "No current ratings"}">
                        <g:form class="starForm starStyle" controller="show" action="rate">
                            <g:hiddenField name="star" value="1"/>
                            <g:hiddenField name="id" value="${show.id}"/>
                            <g:if test="${show.rating && show.rating >= 1}">
                                <button class="star starbutton"><span class="glyphicon glyphicon-star"></span></button>
                            </g:if>
                            <g:else>
                                <button class="star starbutton"><span class="glyphicon glyphicon-star-empty"></span></button>
                            </g:else>
                        </g:form>
                        <g:form class="starForm starStyle" controller="show" action="rate">
                            <g:hiddenField name="star" value="2"/>
                            <g:hiddenField name="id" value="${show.id}"/>
                            <g:if test="${show.rating && show.rating >= 2}">
                                <button class="star starbutton"><span class="glyphicon glyphicon-star"></span></button>
                            </g:if>
                            <g:else>
                                <button class="star starbutton"><span class="glyphicon glyphicon-star-empty"></span></button>
                            </g:else>
                        </g:form>
                        <g:form class="starForm starStyle" controller="show" action="rate">
                            <g:hiddenField name="star" value="3"/>
                            <g:hiddenField name="id" value="${show.id}"/>
                            <g:if test="${show.rating && show.rating >= 3}">
                                <button class="star starbutton"><span class="glyphicon glyphicon-star"></span></button>
                            </g:if>
                            <g:else>
                                <button class="star starbutton"><span class="glyphicon glyphicon-star-empty"></span></button>
                            </g:else>
                        </g:form>
                        <g:form class="starForm starStyle" controller="show" action="rate">
                            <g:hiddenField name="star" value="4"/>
                            <g:hiddenField name="id" value="${show.id}"/>
                            <g:if test="${show.rating && show.rating >= 4}">
                                <button class="star starbutton"><span class="glyphicon glyphicon-star"></span></button>
                            </g:if>
                            <g:else>
                                <button class="star starbutton"><span class="glyphicon glyphicon-star-empty"></span></button>
                            </g:else>
                        </g:form>
                        <g:form class="starForm starStyle" controller="show" action="rate">
                            <g:hiddenField name="star" value="5"/>
                            <g:hiddenField name="id" value="${show.id}"/>
                            <g:if test="${show.rating && show.rating >= 5}">
                                <button class="star starbutton"><span class="glyphicon glyphicon-star"></span></button>
                            </g:if>
                            <g:else>
                                <button class="star starbutton"><span class="glyphicon glyphicon-star-empty"></span></button>
                            </g:else>
                        </g:form>
                    </div>

                    <div class="col-xs-4">
                        Number of Episodes: ${show.num_episodes}
                    </div>

                    <div class="col-xs-4">
                        Description: ${show.description}
                    </div>

                    <div class="col-xs-4">
                        Tags: ${show.tags.name.join(", ")}
                    </div>

                </div>
            </div>
        </g:each>
    </g:if>

    <g:elseif test="${tags}">
        <g:each var="show" in="${tags}">
            <div class="well well-lg">
                <div class="row">
                    <h2>${show.name} <small><g:formatDate format="yyyy" date="${show.start_year}"/> - <g:formatDate format="yyyy" date="${show.end_year}"/></small></h2>
                </div>

                <div class="row">
                    <div class="col-xs-4">
                        <div class="thumbnail">
                            <img class="showImage" src="${createLink(controller:'show', action:'show_image', id: show.id)}" />
                        </div>
                    </div>

                    <div class=" col-xs-12 rating align" data-toggle="tooltip" title="${user && Rating.findByShowAndUser(show, user) ? "Overall rating: " + show.rating + ", Your rating: " + Rating.findByShowAndUser(show, user).stars.toFloat() : show.rating ? "Overall rating: " + show.rating : "No current ratings"}">
                        <g:form class="starForm starStyle" controller="show" action="rate">
                            <g:hiddenField name="star" value="1"/>
                            <g:hiddenField name="id" value="${show.id}"/>
                            <g:if test="${show.rating && show.rating >= 1}">
                                <button class="star starbutton"><span class="glyphicon glyphicon-star"></span></button>
                            </g:if>
                            <g:else>
                                <button class="star starbutton"><span class="glyphicon glyphicon-star-empty"></span></button>
                            </g:else>
                        </g:form>
                        <g:form class="starForm starStyle" controller="show" action="rate">
                            <g:hiddenField name="star" value="2"/>
                            <g:hiddenField name="id" value="${show.id}"/>
                            <g:if test="${show.rating && show.rating >= 2}">
                                <button class="star starbutton"><span class="glyphicon glyphicon-star"></span></button>
                            </g:if>
                            <g:else>
                                <button class="star starbutton"><span class="glyphicon glyphicon-star-empty"></span></button>
                            </g:else>
                        </g:form>
                        <g:form class="starForm starStyle" controller="show" action="rate">
                            <g:hiddenField name="star" value="3"/>
                            <g:hiddenField name="id" value="${show.id}"/>
                            <g:if test="${show.rating && show.rating >= 3}">
                                <button class="star starbutton"><span class="glyphicon glyphicon-star"></span></button>
                            </g:if>
                            <g:else>
                                <button class="star starbutton"><span class="glyphicon glyphicon-star-empty"></span></button>
                            </g:else>
                        </g:form>
                        <g:form class="starForm starStyle" controller="show" action="rate">
                            <g:hiddenField name="star" value="4"/>
                            <g:hiddenField name="id" value="${show.id}"/>
                            <g:if test="${show.rating && show.rating >= 4}">
                                <button class="star starbutton"><span class="glyphicon glyphicon-star"></span></button>
                            </g:if>
                            <g:else>
                                <button class="star starbutton"><span class="glyphicon glyphicon-star-empty"></span></button>
                            </g:else>
                        </g:form>
                        <g:form class="starForm starStyle" controller="show" action="rate">
                            <g:hiddenField name="star" value="5"/>
                            <g:hiddenField name="id" value="${show.id}"/>
                            <g:if test="${show.rating && show.rating >= 5}">
                                <button class="star starbutton"><span class="glyphicon glyphicon-star"></span></button>
                            </g:if>
                            <g:else>
                                <button class="star starbutton"><span class="glyphicon glyphicon-star-empty"></span></button>
                            </g:else>
                        </g:form>
                    </div>

                    <div class="col-xs-4">
                        Number of Episodes: ${show.num_episodes}
                    </div>

                    <div class="col-xs-4">
                        Description: ${show.description}
                    </div>

                    <div class="col-xs-4">
                        Tags: ${show.tags.name.join(", ")}
                    </div>

                </div>
            </div>
        </g:each>
    </g:elseif>
    <g:else>
        <p class="white">No shows currently added.</p><br/>
    </g:else>

</div>

    <%--
    <g:each var="show" in="${shows}">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <div class="jumbotron">
                    <div class="row">
                        <div class="col-xs-8 col-sm-6" style="margin-top: -35px">
                            <div class="thumbnail">
                                <img src="http://placehold.it/2500x2000" alt="...">

                                <div class="caption">
                                    <p><a href="#" class="btn btn-primary" role="button">Favorite</a>  <span
                                            style="padding-left: 150px"><a href="#" class="btn btn-default"
                                                                           role="button">Replace with rating stars</a>
                                    </span>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-4 col-sm-6" style="margin-top: -35px">
                            Name: ${show.name}
                        </div>

                        <div class="col-xs-4 col-sm-6" style="margin-top: 5px">
                            Show Start: <g:formatDate format="yyyy" date="${show.start_year}"/>
                        </div>

                        <div class="col-xs-4 col-sm-6" style="margin-top: 5px">
                            Show End: <g:formatDate format="yyyy" date="${show.end_year}"/>
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
                            Tags: <%--${show.tags.name.join(", ")}
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <g:form controller="show" action="approveShow">
                                    <g:hiddenField name="id" value="${show.id}"/>
                                    <sec:ifAllGranted roles="ROLE_ADMIN"><td><p align="center"><g:submitButton
                                            name="Approve"/></p></td></sec:ifAllGranted>
                                </g:form>
                                <g:form controller="show" action="deleteShow">
                                    <g:hiddenField name="id" value="${show.id}"/>
                                    <sec:ifAllGranted roles="ROLE_ADMIN"><td><p align="center"><g:submitButton
                                            name="Delete"/></p></td></sec:ifAllGranted>
                                </g:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        Saving for now, can be deleted later </g:form>
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
    </table>
    </g:each>


    <g:each var="show" in="${tags}">

        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <div class="jumbotron">
                    <div class="row">
                        <div class="col-xs-8 col-sm-6" style="margin-top: -35px">
                            <div class="thumbnail">
                                <img src="http://placehold.it/2500x2000" alt="...">

                                <div class="caption">
                                    <p><a href="#" class="btn btn-primary" role="button">Favorite</a>  <span
                                            style="padding-left: 150px"><a href="#" class="btn btn-default"
                                                                           role="button">Replace with rating stars</a>
                                    </span>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-4 col-sm-6" style="margin-top: -35px">
                            Name: ${show.name}
                        </div>

                        <div class="col-xs-4 col-sm-6" style="margin-top: 5px">
                            Show Start: <g:formatDate format="yyyy" date="${show.start_year}"/>
                        </div>

                        <div class="col-xs-4 col-sm-6" style="margin-top: 5px">
                            Show End: <g:formatDate format="yyyy" date="${show.end_year}"/>
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
                            Tags: <%--${show.tags.name.join(", ")}
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <g:form controller="show" action="approveShow">
                                    <g:hiddenField name="id" value="${show.id}"/>
                                    <sec:ifAllGranted roles="ROLE_ADMIN"><td><p align="center"><g:submitButton
                                            name="Approve"/></p></td></sec:ifAllGranted>
                                </g:form>
                                <g:form controller="show" action="deleteShow">
                                    <g:hiddenField name="id" value="${show.id}"/>
                                    <sec:ifAllGranted roles="ROLE_ADMIN"><td><p align="center"><g:submitButton
                                            name="Delete"/></p></td></sec:ifAllGranted>
                                </g:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

   </g:each>

--%>
    </body>
    </html>