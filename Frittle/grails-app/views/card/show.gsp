
<%@ page import="frittle.Card" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'card.label', default: 'Card')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-card" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-card" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list card">
			
				<g:if test="${cardInstance?.discipline}">
				<li class="fieldcontain">
					<span id="discipline-label" class="property-label"><g:message code="card.discipline.label" default="Discipline" /></span>
					
						<span class="property-value" aria-labelledby="discipline-label"><g:fieldValue bean="${cardInstance}" field="discipline"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardInstance?.text}">
				<li class="fieldcontain">
					<span id="text-label" class="property-label"><g:message code="card.text.label" default="Text" /></span>
					
						<span class="property-value" aria-labelledby="text-label"><g:fieldValue bean="${cardInstance}" field="text"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="card.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${cardInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardInstance?.usernameShort}">
				<li class="fieldcontain">
					<span id="usernameShort-label" class="property-label"><g:message code="card.usernameShort.label" default="Username Short" /></span>
					
						<span class="property-value" aria-labelledby="usernameShort-label"><g:fieldValue bean="${cardInstance}" field="usernameShort"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cardInstance?.id}" />
					<g:link class="edit" action="edit" id="${cardInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
