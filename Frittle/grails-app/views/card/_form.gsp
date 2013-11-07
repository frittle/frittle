<%@ page import="frittle.Card" %>



<div class="fieldcontain ${hasErrors(bean: cardInstance, field: 'discipline', 'error')} ">
	<label for="discipline">
		<g:message code="card.discipline.label" default="Discipline" />
		
	</label>
	<g:textField name="discipline" value="${cardInstance?.discipline}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cardInstance, field: 'text', 'error')} ">
	<label for="text">
		<g:message code="card.text.label" default="Text" />
		
	</label>
	<g:textField name="text" value="${cardInstance?.text}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cardInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="card.username.label" default="Username" />
		
	</label>
	<g:textField name="username" value="${cardInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cardInstance, field: 'usernameShort', 'error')} ">
	<label for="usernameShort">
		<g:message code="card.usernameShort.label" default="Username Short" />
		
	</label>
	<g:textField name="usernameShort" value="${cardInstance?.usernameShort}"/>
</div>

