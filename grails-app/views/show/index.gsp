<%--
  Created by IntelliJ IDEA.
  User: StephenManz
  Date: 3/31/2016
  Time: 6:21 PM
--%>

<%@ page import="anime.Rating; anime.Favorite" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title></title>
    <asset:javascript src="index.js"/>
</head>

<body>
<g:form action="search">
    <g:textField name="search" value="search"/>
    <button type="submit" value="Search"></button>
</g:form>

<g:if test="${shows}">
    <g:each var="show" in="${shows}">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <g:form class="deleteForm" controller="show" action="deleteShow">
                    <g:hiddenField name="id" value="${show.id}"/>
                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <button type="submit" class="deleteButton"><span class="glyphicon glyphicon-trash"></span></button>
                    </sec:ifAllGranted>
                </g:form>
                <div class="jumbotron">

                    <div class="row">
                        <div class="col-xs-8 col-sm-6" style="margin-top: -35px">
                            <div class="thumbnail">
                                <img class="showImage" src="${createLink(controller:'show', action:'show_image', id: show.id)}" />

                                <div class="caption">
                                    <p>
                                        <g:if test="${Favorite.findByUserAndShow(user, show)}">
                                            <g:form class="favForm" controller="show" action="deleteFavorite">
                                                <g:hiddenField name="id" value="${show.id}"/>
                                                <sec:ifAnyGranted  roles="ROLE_ADMIN,ROLE_USER"><button type="submit" class="fav_button favorited starbutton"><span class="glyphicon glyphicon-heart"></span></button></sec:ifAnyGranted>
                                            </g:form>
                                        </g:if>
                                        <g:else>
                                            <g:form class="favForm" controller="show" action="addFavorite">
                                                <g:hiddenField name="id" value="${show.id}"/>
                                                <sec:ifAnyGranted  roles="ROLE_ADMIN,ROLE_USER"><button type="submit" class="fav_button starbutton"><span class="glyphicon glyphicon-heart"></span></button></sec:ifAnyGranted>
                                            </g:form>
                                        </g:else>

                                        <div class="rating align" data-toggle="tooltip" title="${user && Rating.findByShowAndUser(show, user) ? "Overall rating: " + show.rating + ", Your rating: " + Rating.findByShowAndUser(show, user).stars.toFloat() : show.rating ? "Overall rating: " + show.rating : "No current ratings"}">
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
                                                    <button   class="star"><span class="glyphicon glyphicon-star-empty"></span></button>
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
                            Tags: ${show.tags.name.join(", ")}
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