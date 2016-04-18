<%--
  Created by IntelliJ IDEA.
  User: StephenManz
  Date: 3/31/2016
  Time: 6:21 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
    <sec:ifAnyGranted roles="ROLE_ADMIN"><g:link action="newShowForm">Add Show</g:link></sec:ifAnyGranted>
    <sec:ifAnyGranted roles="ROLE_ADMIN"><g:link action="pendingShow">Pending Shows</g:link></sec:ifAnyGranted>
    <g:form controller="logout">
        <g:submitButton name="logout" value="Logout" />
    </g:form>
    <g:if test="${shows}">
        <g:each var="show" in="${shows}">
            <table border="1px">
                <tr>
                    <td>${show.name}</td>
                    <td><g:formatDate format="yyyy" date="${show.start_year}"/></td>
                    <td><g:formatDate format="yyyy" date="${show.end_year}"/> </td>
                    <td>${show.description}</td>
                    <td>${show.num_episodes}</td>
                    <td>${show.tags}</td>
                </tr>
            </table>
        </g:each>
    </g:if>
    <g:else>
        <p>No shows currently added. Add a show to the approval list.</p><br/>

    </g:else>
</body>
</html>