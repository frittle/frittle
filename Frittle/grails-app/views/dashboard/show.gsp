
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
<%--    border-width: 1px;--%>
<%--    border-style: solid;--%>
<%--    border-color: black;--%>
<%--    -moz-border-radius: 4px;--%>
<%--    border-radius: 4px;--%>
    padding: 5px;
    margin: 5px;
}

.usercolumn {
    float: left;
    width: 120px;
<%--    border-width: 1px;--%>
<%--    border-style: solid;--%>
<%--    border-color: black;--%>
<%--    -moz-border-radius: 4px;--%>
<%--    border-radius: 4px;--%>
    padding: 5px;
    margin: 5px;
    background-color: #EC7404;
}

.actie {
    color: black;
    background-color: #FFE620;
<%--    lichte kleur FEF5A6--%>
}

.actief {
    color: white;
    background-color: #8B4492;
<%--    lichte kleur D1B4D3--%>    
}

.voltooid {
    color: white;
    background-color: #67AF25;
<%--    lichte kleur C2DFA7--%>      
}
.
.columnheader {
    padding: 5px;
    margin: 5px;
    color: #006dba;
    font-weight: bold;
}

.card {
    width: 200px;
<%--    border-width: 1px;--%>
<%--    border-style: solid;--%>
<%--    border-color: black;--%>
<%--    -moz-border-radius: 4px;--%>
<%--    border-radius: 4px;--%>
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
    float: left;
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
                    <%--                        <g:each in="${dashboardInstance.cards}" var="c">--%> <%--                       <span class="property-value" aria-labelledby="cards-label"><g:link controller="card" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>--%>
                    <%--                        </g:each>               --%>
                    <div id="container">
                        <div id="todo" class="cardcolumn actie" ondrop="drop(event)" ondragover="allowDrop(event)">
                            <div class="columnheader">Actie</div>
                            <g:each in="${dashboardInstance.cards}" var="c">
                                <g:if test="${c.column == 'TODO'}">
                                    <div id="${c.id}"  class="card" draggable="true" ondragstart="drag(event)">
                                        <span class="property-value" aria-labelledby="cards-label"><g:link controller="card" action="show" id="${c.id}">
                                                ${c?.text.encodeAsHTML()}
                                            </g:link></span>
                                    </div>
                                </g:if>
                            </g:each>
                        </div>
                        <div id="doing" class="cardcolumn actief" ondrop="drop(event)" ondragover="allowDrop(event)">
                            <div class="columnheader">Actief</div>
                            <g:each in="${dashboardInstance.cards}" var="c">
                                <g:if test="${c.column == 'DOING'}">
                                    <div id="${c.id}"  class="card" draggable="true" ondragstart="drag(event)">
                                        <span class="property-value" aria-labelledby="cards-label"><g:link controller="card" action="show" id="${c.id}">
                                                ${c?.text.encodeAsHTML()}
                                            </g:link></span>
                                    </div>
                                </g:if>
                            </g:each>
                        </div>
                        <div id="done" class="cardcolumn voltooid" ondrop="drop(event)" ondragover="allowDrop(event)">
                            <div class="columnheader">Voltooid</div>
                            <g:each in="${dashboardInstance.cards}" var="c">
                                <g:if test="${c.column == 'DONE'}">
                                    <div id="${c.id}"  class="card" draggable="true" ondragstart="drag(event)">
                                        <span class="property-value" aria-labelledby="cards-label"><g:link controller="card" action="show" id="${c.id}">
                                                ${c?.text.encodeAsHTML()}
                                            </g:link></span>
                                            
                                    </div>
                                </g:if>
                            </g:each>
                        </div>
                        
                        <g:if test="${dashboardInstance?.users}">
                            <div id="users" class="usercolumn">
                                <g:each in="${dashboardInstance.users}" var="u">
                                    <div class="userbox">${u?.firstname.encodeAsHTML()}</div>
                                </g:each>
                            </div>
                        </g:if>
                        
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
function allowDrop(ev) {
	ev.preventDefault();
}
function drag(ev) {
	ev.dataTransfer.setData("Text",ev.target.id);
}

function drop(ev) {
	ev.preventDefault();
	var data=ev.dataTransfer.getData("Text");
	var card = document.getElementById(data);
	ev.target.appendChild(card);

	alert("card met id = '" + card.id + "' is geplaatst in kolom '" + ev.target.id + "'. \r\nDit wordt doorgeven aan de server in function DashboardController.processCardMove() mbv een jsonobject. \r\nZie ook de Console!!");
// LEO A:
//alleen de id is bekend op de client, de card is er niet...(grails op de server..)
//Er zijn volgens mij 3 oplossingen :
//1) er moet dan vooraf een JSON object worden meegegeven met het gehele dashboard en alle kaarten...
// (grails is dan niet meer nodig --> thick client), dan gehele card teruggeven aan server en opslaan
//2) alleen de card.id (en nieuwe kolom) teruggeven naar de server, de server haalt de card op, werkt de card bij en slaat deze op 
//3) (Wat onzinnig volgens mij...) Met de card.id de card ophalen van de server naar de client , card bijwerken met de nieuwe kolom, 
//  dan de hele card teruggeven en opslaan

//hieronder oplossing 2
	var userdata = {
		'id' : card.id,
		'column' : ev.target.id
	}
	var jsondata = JSON.stringify(userdata)
	<g:remoteFunction action="processCardMove" params="'jsondata='+jsondata"  />
}

</script>
			
		</div>
	</body>
</html>
