<%@ page import="frittle.User"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="jigmain">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body id="body">
	<h1>Registration</h1>
	<p>Complete the form below to create an account</p>

	<div id="edit-user" class="content scaffold-edit" role="main">
		<h1>Register</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form method="post" action="register">
			<g:hiddenField name="id" value="${userInstance?.id}" />
			<g:hiddenField name="version" value="${userInstance?.version}" />
			
			<fieldset class="form">
				<g:render template="form"/>
			</fieldset>
			
			<br>

			<fieldset class="buttons">
				<g:submitButton class="save" name="register" value="Register" />
			</fieldset>
		</g:form>
	</div>

</body>
</html>
