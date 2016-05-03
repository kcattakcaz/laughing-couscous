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
</head>


    <g:uploadForm action="addShow">
        <g:hasErrors bean="${show}">
            <ul>
                <g:eachError var="err" bean="${show}">
                    <li><g:message error="${err}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <h1>Add New Show</h1>
        <div class="form-group">
            <label>Title:</label>
            <g:textField name="name" class="form-control" value="${fieldValue(bean: show, field: 'name')}"/>
        </div>
        <div class="form-group">
            <label>Start Date:</label>
        <g:datePicker class="form-control" name="start_year" value="${new Date()}" noSelection="['': '-Choose-']" precision="year"/>
        </div>

        <div class="form-group">
            <label>End Date:</label>
        <g:datePicker class="form-control" name="end_year" value="${new Date()}" noSelection="['': '-Choose-']" precision="year"/>
        </div>

        <div class="form-group">
        <label>Show Description:</label>
            <g:textArea class="form-control" name="description" value="${fieldValue(bean: show, field: 'description')}"/>
        </div>

        <div class="form-group">
            <label>Cover Image:</label>
            <input type="file" name="image"/>
        </div>
        <div class="form-group">
            <label>Number of Episodes:</label>
        <g:textField name="num_episodes" class="form-control" value="${fieldValue(bean: show, field: 'num_episodes')}"/>
        </div>

        <div class="form-group">
            <label>Tags:</label>
            <g:select class="form-control" name="tagIds" from="${tags}" value="${tags}" controller="Tag" optionKey="id" optionValue="name"/>
        </div>

        <g:hiddenField name="approved" value="false"/>
        <div class="form-group">
            <g:submitButton class="submitButton btn" name="Submit"/>
        </div>

        %{--<g:actionSubmit class="submitButton" value="Cancel" action="homepage"/>--}%
    </g:uploadForm>



</body>
</html>