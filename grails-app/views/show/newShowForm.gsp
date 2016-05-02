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
    <meta name="layout" content="main">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asset:stylesheet src="newShow.css"/>
</head>

<body>
<div class="container">
    <g:uploadForm action="addShow">
        <g:hasErrors bean="${show}">
            <ul>
                <g:eachError var="err" bean="${show}">
                    <li><g:message error="${err}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <h1>Add New Show</h1>
        <input type="file" name="image"/>
        <div class="form_label">Title:</div><g:textField name="name" value="${fieldValue(bean: show, field: 'name')}"/><br/>
        <div class="form_label">Start Date:</div><g:datePicker name="start_year" value="${new Date()}"
                                          noSelection="['': '-Choose-']" precision="year"/><br/>
        <div class="form_label">End Date:</div><g:datePicker name="end_year" value="${new Date()}"
                                          noSelection="['': '-Choose-']" precision="year"/><br/>
        <div class="form_label description_label">Show Description:</div><g:textArea name="description"
                                        value="${fieldValue(bean: show, field: 'description')}"/><br/>
        <div class="form_label">Number of Episodes:</div><g:textField name="num_episodes"
                                         value="${fieldValue(bean: show, field: 'num_episodes')}"/><br/>
        <div class="form_label tag_label">Tags:</div>
        <g:select name="tags" from="${tags}" value="${tags}" controller="Tag" optionKey="id" optionValue="name">

        </g:select>
        <br/>
        <g:hiddenField name="approved" value="false"/>
        <g:submitButton class="submitButton btn" name="Submit"/>
        %{--<g:actionSubmit class="submitButton" value="Cancel" action="homepage"/>--}%
    </g:uploadForm>

</div>

</body>
</html>