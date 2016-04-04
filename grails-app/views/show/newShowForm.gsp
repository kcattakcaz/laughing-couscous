<%--
  Created by IntelliJ IDEA.
  User: StephenManz
  Date: 3/31/2016
  Time: 6:34 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
    <g:form action="addShow">
        Show Name:<g:textField name="showName" value="${fieldValue(bean: show, field: 'showName')}"/><br/>
        Show Description:<g:textArea name="description" value="${fieldValue(bean: show, field: 'description')}"/><br/>
        Tags:<g:textField name="tags" value="${fieldValue(bean: show, field: 'tags')}"/>
        <g:submitButton name="Submit"/>
        <g:actionButton name="Cancel" action="index"/>
    </g:form>
</body>
</html>