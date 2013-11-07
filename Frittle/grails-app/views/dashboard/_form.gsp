<%@ page import="frittle.Dashboard" %>



<div class="fieldcontain ${hasErrors(bean: dashboardInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="dashboard.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${dashboardInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dashboardInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="dashboard.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="author" required="" value="${dashboardInstance?.author}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dashboardInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="dashboard.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${dashboardInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dashboardInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="dashboard.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${dashboardInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dashboardInstance, field: 'cards', 'error')} ">
	<label for="cards">
		<g:message code="dashboard.cards.label" default="Cards" />
		
	</label>
	<g:select name="cards" from="${frittle.Card.list()}" multiple="multiple" optionKey="id" size="5" value="${dashboardInstance?.cards*.id}" class="many-to-many"/>
</div>

