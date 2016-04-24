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
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="bootstrap-theme.min.css"/>
    <asset:javascript src="bootstrap.min.js"/>
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
        <%--Image: <g:uploadForm controller="show" action="saveImage" >
                    <input type="file" name="imageFile" />
                    <input type="submit" />
                </g:uploadForm>--%>
        Show Name:<g:textField name="name" value="${fieldValue(bean: show, field: 'name')}"/><br/>
        Start Date:<g:datePicker name="start_year" value="${new Date()}"
                    noSelection="['':'-Choose-']" precision="year"/><br/>
        End Date:<g:datePicker name="end_year" value="${new Date()}"
                    noSelection="['':'-Choose-']" precision="year"/><br/>
        Show Description:<g:textArea name="description" value="${fieldValue(bean: show, field: 'description')}"/><br/>
        Number of Episodes:<g:textField name="num_episodes" value="${fieldValue(bean: show, field: 'num_episodes')}"/><br/>
        Tags:
        <g:select name="tags" from="${tags}" value="${tags}" controller="Tag" optionKey="id" optionValue="name">

        </g:select>
        <br/>
        <g:set var="approved" value="false"/>
        <g:submitButton name="Submit"/>
       <g:actionSubmit value="Cancel" action="homepage"/>
    </g:form>

</body>
</html>