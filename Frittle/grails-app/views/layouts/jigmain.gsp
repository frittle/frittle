<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="JIG" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'jigmain.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'jigmobile.css')}" type="text/css">
<g:layoutHead />
<r:layoutResources />
</head>
<body>
	<div id="grailsLogo" role="banner">
		<img src="${resource(dir: 'images', file: 'jig_logo.png')}" alt="JIG" />
	</div>
	<g:layoutBody />
	<div class="footer" role="contentinfo"></div>
	<div id="spinner" class="spinner" style="display: none;">
		<g:message code="spinner.alt" default="Loading&hellip;" />
	</div>
	<g:javascript library="application" />
	<r:layoutResources />
	<div id="loginBox" class="loginBox">
		<g:if test="${session?.user}">
			<div style="margin-top: 20px">
				<div style="float: right;">
					<a href="#">Profile</a> |
					<g:link controller="user" action="logout">Logout</g:link>
				</div>

				Welcome back <span id="userFirstname">
					${session?.user?.firstname}!
				</span> <br>
				<br>
			</div>
		</g:if>
		<g:else>
			<g:form name="loginForm" url="[controller:'user', action:'login']">
				<div>Username:</div>
				<g:textField name="login"></g:textField>
				<div>Password:</div>
				<g:passwordField name="password" />
				<input type="submit" value="Login" />
			</g:form>
			<g:renderErrors bean="${loginCmd}"></g:renderErrors>
		</g:else>
	</div>
	
	<div id="navPane">
		<g:if test="${session.user}">
			<ul>
				<li><g:link controller="dashboard" action="list"></g:link></li>
			</ul>
		</g:if>
		<g:else>
			<div id="registerPane">
				Need an account?
				<g:link controller="user" action="register">Signup now</g:link>
			</div>
		</g:else>
	</div>

</body>
</html>
