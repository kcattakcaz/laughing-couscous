<%--
  Created by IntelliJ IDEA.
  User: StephenManz
  Date: 5/4/2016
  Time: 4:31 PM
--%>

<%@ page import="anime.Rating; anime.Favorite" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title></title>

</head>

<body>
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
        <p class="white">Not sure how you got here...</p><br/>
    </g:else>

</div>
</body>
</html>