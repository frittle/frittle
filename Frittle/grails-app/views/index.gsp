<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jigmain"/>
		<title>Welcome to JIG</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
			
			td.center {
				text-align: center;
			}
			table.login {
				width:400px;
				border: 0px;
			}
		</style>
		
		
	</head>
	<body>
		<div id="page-body" role="main">
			<h1>Welcome to JIG</h1>
			
			<i>"In metalworking and woodworking, a jig is a type of custom-made tool used to control the location and/or motion of another tool. <br />
			A jig's primary purpose is to provide repeatability, accuracy, and interchangeability in the manufacturing of products."</i><br />
			<br />
			In other words; a jig is a tool helping an other tool to create the end-product. <br />
			That is excactly what this tool does. JIG helps you to plan your development activities. <br />
			Actually it is an ordinary Kanban-tool....
			<br />
					
			
			
			<div id="loginBox" class="loginBox">
				<g:if test="${session?.user}">
					<div style="margin-top: 20px">
						<div style="float: right;">
							<a href="#">Profile</a> |
							<g:link controller="user" action="logout">Logout</g:link>
						</div>

					You are logged in as : <span id="userFirstname">	${session?.user?.firstname}	</span> <br>
				<br>

				<div id="controller-list" role="navigation">
					<h2>Go to:</h2>
					<ul>
						<li class="controller"><g:link controller="dashboard">Dashboards</g:link></li>
						<li class="controller"><g:link controller="card">Cards</g:link></li>
					</ul>
				</div>

			</div>
		</g:if>
		<g:else>
			<g:form name="loginForm" url="[controller:'user', action:'login']">

			<table class="login">
			<tr><td  class="center">
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'login', 'error')} required">
				<label for="login"> <g:message code="user.login.label"
						default="Login" /> <span class="required-indicator">*</span>
				</label>
				<g:textField name="login" maxlength="15"
					required=""
					value="${user?.login}" />
			</div>
			</td></tr>
			<tr><td class="center">
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
				<label for="password"> <g:message code="user.password.label"
						default="Password" /> <span class="required-indicator">*</span>
				</label>
				<g:passwordField name="password" maxlength="15"
					required=""
					value="${user?.password}" />
			</div>
			</td></tr>
			<tr><td class="center">
			
				<!--  <div>Username:</div>
				<g:textField name="login"></g:textField>
				<div>Password:</div>
				<g:passwordField name="password" /> -->
				
				<input type="submit" value="Login" />
			</td></tr>
			</table>
			
			
			</g:form>
			<g:renderErrors bean="${loginCmd}"></g:renderErrors>
		</g:else>
	</div>
	
	<div id="navPane">
		<g:if test="${!session.user}">
			<div id="registerPane">
				<br/>Need an account?
				<g:link controller="user" action="register">Signup now</g:link>
			</div>
		</g:if>
	</div>
	
			<!-- 
			<div id="controller-list" role="navigation">
				<h2>Maintenance</h2>
				<ul>
					<li class="controller"><g:link controller="dashboard">Dashboards</g:link></li>
					<li class="controller"><g:link controller="card">Cards</g:link></li>
					<li class="controller"><g:link controller="user">User</g:link></li>
				</ul>
			</div>
			 -->
			
		</div>
	</body>
</html>
