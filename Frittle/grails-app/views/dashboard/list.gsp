
<%@ page import="frittle.Dashboard" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jigmain">
		<g:set var="entityName" value="${message(code: 'dashboard.label', default: 'Dashboard')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-dashboard" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-dashboard" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'dashboard.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="author" title="${message(code: 'dashboard.author.label', default: 'Author')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'dashboard.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'dashboard.email.label', default: 'Email')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${dashboardInstanceList}" status="i" var="dashboardInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${dashboardInstance.id}">${fieldValue(bean: dashboardInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: dashboardInstance, field: "author")}</td>
					
						<td>${fieldValue(bean: dashboardInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: dashboardInstance, field: "email")}</td>
						
						<td>${fieldValue(bean: dashboardInstance, field: "users")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${dashboardInstanceTotal}" />
			</div>
		</div>
		<div id="clickit" onclick="">
			CLICK HERE
		</div>
		
		<div id="clickitremote" onclick="clickitremote()">
			CLICK REMOTE
		</div>
		
		<div id="sendJSON" onclick="sendJSON()">
			SEND JSON OBJECT
		</div>
		
		<g:javascript>
			function clickitremote() {
				<g:remoteFunction action="showIt" id="1"  onSuccess="great(data,textStatus);" />
			}
    		
    		function sendJSON() {
    			var userdata = {
    				'username' : "marcdix",
    				'usernameShort' : "md"
    			}
    			
    			var jsondata = JSON.stringify(userdata)
    			alert(jsondata)
    			
    			<g:remoteFunction action="processJSON" params="'jsondata='+jsondata" onSuccess="great(data,textStatus);" />
    		}
    		
    		function great(data,textStatus) {
        		alert('data: ' + JSON.stringify(data) + " - " + 'textStatus: ' + textStatus) 
    		}
		</g:javascript>
		
		
	</body>
</html>
