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
        Show Name:<g:textField name="name" value="${fieldValue(bean: show, field: 'name')}"/><br/>
        Start Date:<g:datePicker name="start_year" value="${new Date()}"
                    noSelection="['':'-Choose-']" precision="year"/><br/>
        End Date:<g:datePicker name="end_year" value="${new Date()}"
                    noSelection="['':'-Choose-']" precision="year"/><br/>
        Show Description:<g:textArea name="description" value="${fieldValue(bean: show, field: 'description')}"/><br/>
        Number of Episodes:<g:textField name="num_episodes" value="${fieldValue(bean: show, field: 'num_episodes')}"/><br/>
        Tags:<g:textField name="tags" value="${fieldValue(bean: show, field: 'tags')}"/><br/>
        <g:submitButton name="Submit"/>
       <g:actionSubmit value="Cancel" action="homepage"/>
    </g:form>
</body>
</html>