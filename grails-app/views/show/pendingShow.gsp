<%--
  Created by IntelliJ IDEA.
  User: Alec
  Date: 4/11/2016
  Time: 11:23 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
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
                        <div class="col-xs-12">
                            <div class="thumbnail">
                                <img src="http://placehold.it/2500x2000" alt="...">
                            </div>
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

                        <div class="col-xs-12">
                            <sec:ifAllGranted roles="ROLE_ADMIN">
                                <button type="button" class="btn btn-primary btn-block" onclick="approveShow('${show.id}')">Approve</button>
                                <button type="button" class="btn btn-danger btn-block" onclick="deleteShow('${show.id}')">Delete</button>
                            </sec:ifAllGranted>
                        </div>

                    </div>
            </div>
        </g:each>
    </g:if>
    <g:else>
        <p class="white">No shows currently added. Add a show to the approval list.</p><br/>
    </g:else>
</div>

<script>
    function approveShow(showID){
        $.post(
                "<g:createLink action="approveShow" controller="show"/>",
                {
                    id:showID
                }

        )
                .done(function (data) {
                    console.log(data);
                    if(data.status == true){
                        location.reload();
                    }
                })
                .fail(function (data) {
                    alert("Failed to approve the show");
                });
    }

    function deleteShow(showID){
        $.post(
                "<g:createLink action="deleteShow" controller="show"/>",
                {
                    id:showID
                }

                )
                .done(function (data) {
                    console.log(data);
                    if(data.status == true){
                        location.reload();
                    }
                })
                .fail(function (data) {
                    alert("Failed to delete the show");
                });
    }
</script>

</body>
</html>