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
    <g:hasErrors bean="${show}">
        <ul>
            <g:eachError var="err" bean="${show}">
                <li><g:message error="${err}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <h1>Add New Show</h1>
    <g:form action="addShow">
        Show Name:<g:textField name="name" value="${fieldValue(bean: show, field: 'name')}"/><br/>
        Start Date:<g:datePicker name="start_year" value="${new Date()}"
                    noSelection="['':'-Choose-']" precision="year"/><br/>
        End Date:<g:datePicker name="end_year" value="${new Date()}"
                    noSelection="['':'-Choose-']" precision="year"/><br/>
        Show Description:<g:textArea name="description" value="${fieldValue(bean: show, field: 'description')}"/><br/>
        Number of Episodes:<g:textField name="num_episodes" value="${fieldValue(bean: show, field: 'num_episodes')}"/><br/>
        Tags:<g:textField name="tags" value="${fieldValue(bean: show, field: 'tags')}"/><br/>
        <g:set var="approved" value="false"/>
        <g:submitButton name="Submit"/>
       <g:actionSubmit value="Cancel" action="homepage"/>
    </g:form>
    <g:form controller="logout">
        <g:submitButton name="logout" value="Logout" />
    </g:form>
</body>
</html>