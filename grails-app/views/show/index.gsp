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

<div class="container-fluid">


    <div class="row">
        <g:form class="searchbox" action="search">
            <div class="input-group">
            <g:textField class="form-control" placeholder="Search" name="search"/>
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-default" value="Search"><span class="glyphicon glyphicon-search"/></button>
                </span>
            </div>
        </g:form>
    </div>


    <div class="row">
        <g:if test="${shows}">
            <g:each var="show" in="${shows}">


                <div class="media">
                    <div class="media-left">
                        <a href="#">
                            <img height="auto" width="100px" class="media-object" src="${createLink(controller:'show', action:'show_image', id: show.id)}" />
                            <div id="ratings_${show.id}" class="star5">
                                <input <g:if test="${show.rating && show.rating >= 1}">checked</g:if> type="radio" name="example" class="rating" value="1" />
                                <input <g:if test="${show.rating && show.rating >= 2}">checked</g:if> type="radio" name="example" class="rating" value="2" />
                                <input <g:if test="${show.rating && show.rating >= 3}">checked</g:if> type="radio" name="example" class="rating" value="3" />
                                <input <g:if test="${show.rating && show.rating >= 4}">checked</g:if> type="radio" name="example" class="rating" value="4" />
                                <input <g:if test="${show.rating && show.rating >= 5}">checked</g:if> type="radio" name="example" class="rating" value="5" />
                            </div>
                        </a>
                    </div>
                    <div class="media-body">
                        <g:link action="showDisplay" params="[id:show.id]" ><h2 class="media-heading">${show.name}</h2></g:link>
                        ${show.description}
                    </div>
                </div>

                <script>
                    $('#ratings_${show.id}').rating(function(vote, event){
                        // write your ajax code here
                        // For example;
                        console.log(vote);
                        $.post("<g:createLink action="rate" controller="show" />", {id: ${show.id}, star:vote});
                    });
                </script>

            </g:each>
        </g:if>
        <g:else>
            <p class="white">No shows currently added. Add a show to the approval list.</p><br/>
        </g:else>
    </div>





</body>
</html>