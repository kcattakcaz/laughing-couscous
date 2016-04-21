<%--
  Created by IntelliJ IDEA.
  User: Jacob
  Date: 4/10/2016
  Time: 9:52 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <asset:javascript src="jquery-2.1.3.js"/>
    <asset:javascript src="account.js"/>
    <asset:stylesheet href="account.css"/>
    <meta name="layout" content="main">
    <title>Account Profile</title>
</head>

<body>
<div class="container">
    <h3>Account</h3>
    <button class="tab active" id="profile">Profile</button>
    <button class="tab" id="favorites">Favorites</button>

    <div class="info info_profile">
        <div class="user_info">Username:</div> ${user.username}<br>
        <div class="user_info">Email:</div> ${user.email}
    </div>

    <div class="info info_favorites">
        <g:if test="${favorites}">
            <g:each var="fav" in="${favorites}">
                <div class="fav">
                    <p class="show_name">${fav.show.name}</p>
                    <p class="show_description">${fav.show.description}</p>
                    <g:if test="${fav.show.start_year}"><p class="show_date">${fav.show.start_year} - ${fav.show.end_year}</p></g:if>
                </div>
            </g:each>
        </g:if>
        <g:else>
            <h4>You have no favorite shows.</h4>
        </g:else>

    </div>
</div>
</body>
</html>