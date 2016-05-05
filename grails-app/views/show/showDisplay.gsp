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
<div class="container well well-lg">
<g:if test="${show}">
    <div class="row">
        <h1>${show.name} <small><g:formatDate format="yyyy" date="${show.start_year}"/> - <g:formatDate format="yyyy" date="${show.end_year}"/></small></h1>
    </div>
    <div class="row">
        <div class="col-md-4 col-xs-12">
            <img height="auto" class="media-object" src="${createLink(controller:'show', action:'show_image', id: show.id)}" />
            <div id="ratings_${show.id}" class="star5">
                <input <g:if test="${show.rating && show.rating >= 1}">checked</g:if> type="radio" name="example" class="rating" value="1" />
                <input <g:if test="${show.rating && show.rating >= 2}">checked</g:if> type="radio" name="example" class="rating" value="2" />
                <input <g:if test="${show.rating && show.rating >= 3}">checked</g:if> type="radio" name="example" class="rating" value="3" />
                <input <g:if test="${show.rating && show.rating >= 4}">checked</g:if> type="radio" name="example" class="rating" value="4" />
                <input <g:if test="${show.rating && show.rating >= 5}">checked</g:if> type="radio" name="example" class="rating" value="5" />
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

        <div class="row">
        <div class="col-md-8 col-xs-12">
            <p>${show.description}</p>
            <br>
            <p>
                Tags: ${show.tags.name.join(", ")}
            </p>
        </div>
        </div>
    </div>

</g:if>

</div>
<br>

<div class="container">
    <div class="row">
        <g:form class="form" controller="Show" action="addReview">
            <g:hiddenField name="showID" value="${show.id}"/>
            <div class="form-group">
                <label for="reviewText">Add your review:</label>
                <g:textArea id="reviewText" name="reviewText" class="form-control"/>
            </div>
            <div class="form-group">
                <g:submitButton controller="Show" action="addReview" class="btn btn-primary" name="Review" />
            </div>
        </g:form>
    </div>

    <g:each in="${reviews}" var="review">
        <div class="row well">
            ${review.user.username}
            ${review.text}
        </div>
    </g:each>
</div>

</body>


</html>