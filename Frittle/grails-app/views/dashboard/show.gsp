
<%@ page import="frittle.Dashboard" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jigmain">
		<g:set var="entityName" value="${message(code: 'dashboard.label', default: 'Dashboard')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
<style type="text/css">

.cardcolumn {
    float: left;
    width: 220px;
    border-width: 1px;
    border-style: solid;
    border-color: black;
    -moz-border-radius: 4px;
	border-radius: 4px;
    padding: 5px;
    margin: 5px;
    background-color: #efefef;
}
.columnheader {
    padding: 5px;
    margin: 5px;
    color: #006dba;
    font-weight: bold;
}

.card {
    width: 200px;
    border-width: 1px;
    border-style: solid;
    border-color: black;
    -moz-border-radius: 4px;
	border-radius: 4px;
/*     padding: 5px; */
    margin: 5px; 
    background-color: white;
    min-height: 50px;
}

.cardheader {
    width: 100%;
    border-width: 1px;
    border-style: solid;
    border-color: black;
    background-color: blue;
    height: 30px;
}

.userbox {
    float: right;
    position: relative;
/*     width: 20px; */
    border-width: 1px;
    border-style: solid;
    border-color: black;
    -moz-border-radius: 4px;
	border-radius: 4px;
    padding: 1px;
    margin: 1px;
    background-color: #cccccc;
}

.activitytype {
	background-color: blue;
	color: blue;
}



</style>		
	</head>
	<body>
		<a href="#show-dashboard" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-dashboard" class="content scaffold-show" role="main">
<%--			<h1><g:message code="default.show.label" args="[entityName]" /></h1>--%>
			
			<h1><g:fieldValue bean="${dashboardInstance}" field="title"/></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list dashboard">
			
<%--				<g:if test="${dashboardInstance?.title}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="title-label" class="property-label"><g:message code="dashboard.title.label" default="Title" /></span>--%>
<%--					--%>
<%--						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${dashboardInstance}" field="title"/></span>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
<%--				<g:if test="${dashboardInstance?.author}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="author-label" class="property-label"><g:message code="dashboard.author.label" default="Author" /></span>--%>
<%--					--%>
<%--						<span class="property-value" aria-labelledby="author-label"><g:fieldValue bean="${dashboardInstance}" field="author"/></span>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
<%--			--%>
<%--				<g:if test="${dashboardInstance?.description}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="description-label" class="property-label"><g:message code="dashboard.description.label" default="Description" /></span>--%>
<%--					--%>
<%--						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${dashboardInstance}" field="description"/></span>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
<%--			--%>
<%--				<g:if test="${dashboardInstance?.email}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="email-label" class="property-label"><g:message code="dashboard.email.label" default="Email" /></span>--%>
<%--					--%>
<%--						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${dashboardInstance}" field="email"/></span>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
				<g:if test="${dashboardInstance?.cards}">

				<li class="fieldcontain">
					<%--						<g:each in="${dashboardInstance.cards}" var="c">--%> <%--						<span class="property-value" aria-labelledby="cards-label"><g:link controller="card" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>--%>
					<%--						</g:each>				--%>
					<div id="container">
						<div id="todo" class="cardcolumn" ondrop="drop(event)" ondragover="allowDrop(event)">
							<div class="columnheader">Todo</div>
							<g:each in="${dashboardInstance.cards}" var="c">
								<g:if test="${c.column == 'TODO'}">
									<div id="${c.id}"  class="card" draggable="true" ondragstart="drag(event)">
										<span class="property-value" aria-labelledby="cards-label"><g:link controller="card" action="show" id="${c.id}">
												${c?.encodeAsHTML()}
											</g:link></span>
									</div>
								</g:if>
							</g:each>
						</div>
						<div id="doing" class="cardcolumn" ondrop="drop(event)" ondragover="allowDrop(event)">
							<div class="columnheader">Doing</div>
							<g:each in="${dashboardInstance.cards}" var="c">
								<g:if test="${c.column == 'DOING'}">
									<div id="${c.id}" class="card" draggable="true" ondragstart="drag(event)">
										<span class="property-value" aria-labelledby="cards-label"><g:link controller="card" action="show" id="${c.id}">
												${c?.encodeAsHTML()}
											</g:link></span>
									</div>
								</g:if>
							</g:each>
						</div>
						<div id="done" class="cardcolumn" ondrop="drop(event)" ondragover="allowDrop(event)">
							<div class="columnheader">Done</div>
							<g:each in="${dashboardInstance.cards}" var="c">
								<g:if test="${c.column == 'DONE'}">
									<div id="${c.id}"  class="card" draggable="true" ondragstart="drag(event)">
										<span class="property-value" aria-labelledby="cards-label"><g:link controller="card" action="show" id="${c.id}">
												${c?.encodeAsHTML()}
											</g:link></span>
									</div>
								</g:if>
							</g:each>
						</div>
					</div>
				</li>


			</g:if>
			
			</ol>
			<g:form>
			
			
			
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${dashboardInstance?.id}" />
					<g:link class="edit" action="edit" id="${dashboardInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			
<script>
function allowDrop(ev)
{
ev.preventDefault();
}
function disallowDrop(ev)
//return true;
//uitzoeken
{
	
}
function drag(ev)
{
ev.dataTransfer.setData("Text",ev.target.id);
}

function drop(ev)
{
ev.preventDefault();
var data=ev.dataTransfer.getData("Text");
ev.target.appendChild(document.getElementById(data));
}
</script>
			
		</div>
	</body>
</html>
