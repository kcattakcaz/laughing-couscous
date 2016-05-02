<%--
  Created by IntelliJ IDEA.
  User: Zachary Jaghory
  Date: 4/11/16
  Time: 4:58 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Tag Management</title>
    <meta name="layout" content="main">
</head>

<body>
<div class="container">
    <h2 class="white">${tag.name}</h2>

    <g:link action="edit"><button id="btn_edit" type="button">Edit</button></g:link>
    <button id="btn_delete" type="button">Delete</button>

    <script>

        $("#btn_delete").on('click', function () {
            $.ajax({
                type: "DELETE",
                url:${createLink(action:'delete',params:[id:tag])}
            })
        })

    </script>
</div>
</body>
</html>