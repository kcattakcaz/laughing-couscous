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
    <title>Account Profile</title>
</head>

<body>
<h3>Account Profile</h3>
<button class="tab" id="profile">Profile</button>
<button class="tab" id="favorites">Favorites</button>

<div class="info info_profile">
    Username: ${user.username}<br>
    Email: ${user.email}
</div>

<div class="info info_favorites">
    <g:each var="fav" in="${favorites}">
        ${fav.show.name}<br>
    </g:each>
</div>

</body>
</html>