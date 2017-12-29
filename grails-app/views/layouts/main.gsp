<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="main.css"/>

    <g:layoutHead/>
</head>
<body>

    <div class="navbar" id="main-navbar">
        <div class="logo-wrapper">
            <div class="logo">
                <a href="/"><asset:image src="enuai_inv.svg" class="logo-img"/></a>
            </div>
        </div>
        <asset:image src="grails.svg" class="framework"/>
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
