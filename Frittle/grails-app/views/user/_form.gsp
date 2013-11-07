<%@ page import="frittle.User" %>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="user.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" maxlength="15" pattern="${userInstance.constraints.login.matches}" required="" value="${userInstance?.login}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" maxlength="15" pattern="${userInstance.constraints.password.matches}" required="" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstname', 'error')} required">
	<label for="firstname">
		<g:message code="user.firstname.label" default="Firstname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstname" required="" value="${userInstance?.firstname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastname', 'error')} required">
	<label for="lastname">
		<g:message code="user.lastname.label" default="Lastname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastname" required="" value="${userInstance?.lastname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'dashboards', 'error')} ">
	<label for="dashboards">
		<g:message code="user.dashboards.label" default="Dashboards" />
		
	</label>
	<g:select name="dashboards" from="${frittle.Dashboard.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.dashboards*.id}" class="many-to-many"/>
</div>

