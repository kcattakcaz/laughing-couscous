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
                <div class="container-fluid">
                    <div class="row">
                        <h1>${show.name} <small><g:formatDate format="yyyy" date="${show.start_year}"/> - <g:formatDate format="yyyy" date="${show.end_year}"/></small></h1>
                    </div>

                    <div class="row">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="thumbnail col-xs-4">
                                    <img class="showImage" src="${createLink(controller:'show', action:'show_image', id: show.id)}" />
                                </div>
                            </div>


                            <div class="row">
                                Number of Episodes: ${show.num_episodes}
                            </div>

                            <div class="row">
                                Description: ${show.description}
                            </div>

                            <div class="row">
                                Tags: ${show.tags.name.join(", ")}
                            </div>

                            <div class="row">
                                <sec:ifAllGranted roles="ROLE_ADMIN">
                                    <button type="button" class="btn btn-primary col-xs-12 col-md-5" onclick="approveShow('${show.id}')">Approve</button>
                                    <button type="button" class="btn btn-danger col-xs-12 col-md-offset-2 col-md-5" onclick="deleteShow('${show.id}')">Delete</button>
                                </sec:ifAllGranted>
                            </div>
                        </div>

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