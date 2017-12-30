<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'article.label', default: 'Article')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        %{--<h2><g:message code="default.show.label" args="[entityName]" /></h2>--}%
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <h2><f:display bean="article" property="title" /></h2>
        <div class="row">
            <div class="col-md-8">
                <h3 class="article-teaser"><f:display bean="article" property="teaser"/></h3>
            </div>
            <g:if test="${this.article.featuredImageBytes}">
                <div class="article-image-wrapper col-md-4">
                    <img class="article-image" src="<g:createLink controller="article" action="featuredImage" id="${this.article.id}"/>"/>
                </div>
            </g:if>
            <div class="col-md-8 article-text">
                <p>
                    <f:display bean="article" property="text"  />
                </p>
                <p class="article-text-author">
                    <f:display bean="article" property="author" />
                </p>
            </div>
        </div>
        <div class="row">
            <fieldset class="buttons">


            </fieldset>

        </div>
    </body>
</html>
