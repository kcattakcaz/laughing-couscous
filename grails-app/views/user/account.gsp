<%--
  Created by IntelliJ IDEA.
  User: Jacob
  Date: 4/10/2016
  Time: 9:52 PM
--%>

<%@ page import="anime.Favorite; anime.Rating" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
          integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">--%>
    <asset:javascript src="account.js"/>
    <asset:stylesheet href="account.css"/>
    <title>Account Profile</title>
</head>

<body>
<div class="container white">
    <h3>Account</h3>
    <button class="tab active" id="profile">Profile</button>
    <button class="tab" id="favorites">Favorites</button>

    <div class="info info_profile">
        <div class="user_info">Username:</div> ${user.username}<br>

        <div class="user_info">Email:</div> ${user.email}
    </div>

    <div class="well well-lg info info_favorites">
        <g:if test="${favorites}">
            <g:each var="fav" in="${favorites}">
                <div class="fav">
                    <img class="fav_image" src="${createLink(controller: 'show', action: 'show_image', id: fav.show.id)}" />
                <div class="text_info">
                    <p class="show_name">${fav.show.name}</p>

                    <p class="show_description">${fav.show.description}</p>
                    <g:if test="${fav.show.start_year}">
                        <p class="show_date">
                            <g:formatDate format="yyyy" date="${fav.show.start_year}"/> - <g:formatDate format="yyyy"
                                                                                                        date="${fav.show.end_year}"/>
                        </p>
                    </g:if>
                </div>

                <div class="other_info">

                    <div class="rating" data-toggle="tooltip"
                         title="${user && Rating.findByShowAndUser(fav.show, user) ? "Overall rating: " + fav.show.rating + ", Your rating: " + Rating.findByShowAndUser(fav.show, user).stars.toFloat() : fav.show.rating ? "Overall rating: " + fav.show.rating : "No current ratings"}">
                        <g:form class="starForm starStyle" controller="show" action="rate">
                            <g:hiddenField name="star" value="1"/>
                            <g:hiddenField name="id" value="${fav.show.id}"/>
                            <g:if test="${fav.show.rating && fav.show.rating >= 1}">
                                <button class="star starbutton"><span class="glyphicon glyphicon-star"></span></button>
                            </g:if>
                            <g:else>
                                <button class="star starbutton"><span class="glyphicon glyphicon-star-empty"></span></button>
                            </g:else>
                        </g:form>
                        <g:form class="starForm starStyle" controller="show" action="rate">
                            <g:hiddenField name="star" value="2"/>
                            <g:hiddenField name="id" value="${fav.show.id}"/>
                            <g:if test="${fav.show.rating && fav.show.rating >= 2}">
                                <button class="star starbutton"><span class="glyphicon glyphicon-star"></span></button>
                            </g:if>
                            <g:else>
                                <button class="star starbutton"><span class="glyphicon glyphicon-star-empty"></span></button>
                            </g:else>
                        </g:form>
                        <g:form class="starForm starStyle" controller="show" action="rate">
                            <g:hiddenField name="star" value="3"/>
                            <g:hiddenField name="id" value="${fav.show.id}"/>
                            <g:if test="${fav.show.rating && fav.show.rating >= 3}">
                                <button class="star starbutton"><span class="glyphicon glyphicon-star"></span></button>
                            </g:if>
                            <g:else>
                                <button class="star starbutton"><span class="glyphicon glyphicon-star-empty"></span></button>
                            </g:else>
                        </g:form>
                        <g:form class="starForm starStyle" controller="show" action="rate">
                            <g:hiddenField name="star" value="4"/>
                            <g:hiddenField name="id" value="${fav.show.id}"/>
                            <g:if test="${fav.show.rating && fav.show.rating >= 4}">
                                <button class="star starbutton"><span class="glyphicon glyphicon-star"></span></button>
                            </g:if>
                            <g:else>
                                <button class="star starbutton"><span class="glyphicon glyphicon-star-empty"></span></button>
                            </g:else>
                        </g:form>
                        <g:form class="starForm starStyle" controller="show" action="rate">
                            <g:hiddenField name="star" value="5"/>
                            <g:hiddenField name="id" value="${fav.show.id}"/>
                            <g:if test="${fav.show.rating && fav.show.rating >= 5}">
                                <button class="star starbutton"><span class="glyphicon glyphicon-star"></span></button>
                            </g:if>
                            <g:else>
                                <button class="star starbutton"><span class="glyphicon glyphicon-star-empty"></span></button>
                            </g:else>
                        </g:form>
                    </div>
                </div>
            </g:each>
        </g:if>
        <g:else>
            <h4>You have no favorite shows.</h4>
        </g:else>
    </div>
    </div>
</div>
</body>
</html>