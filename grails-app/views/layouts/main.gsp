<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:javascript src="application.js"></asset:javascript>
    <asset:javascript src="trumbowyg.js"></asset:javascript>
    <asset:stylesheet src="main.css"/>
    <asset:stylesheet src="trumbowyg.css"/>

    <g:layoutHead/>
</head>
<body>

    <div class="navbar" id="main-navbar">
        <div class="logo-wrapper col-md-3">
            <div class="logo">
                <a href="/"><asset:image src="enuai_inv.svg" class="logo-img"/></a>
            </div>
        </div>

        <asset:image src="grails.svg" class="framework"/>
        <div class="menu col-md-9">
            <g:link action="protectedIndex" controller="article" class="login-link menu-link" >Login</g:link>
        </div>
    </div>
    <div class="container-fluid">
        <g:layoutBody/>
    </div>


    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>
