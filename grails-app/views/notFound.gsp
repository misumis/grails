<!doctype html>
<html>
    <head>
        <title>Page Not Found</title>
        <asset:stylesheet src="main.css"/>
        <meta name="layout" content="">
        <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
    </head>
    <body class="error-page">
        <p class="error-page-title">Page Not Found</p>
        <p class="error-page-text">Page could not be found</p>
        <p class="error-page-text">Path: ${request.forwardURI}</p>
        <a class="error-page-btn" href="/">Home</a>
    </body>
</html>
