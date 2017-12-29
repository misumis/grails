<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'article.label', default: 'Article')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-restaurant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>


        %{--<h2><g:message code="default.show.label" args="[entityName]" /></h2>--}%
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <h2><f:display bean="article" property="title" /></h2>
        <div class="row">
            <div class="col-md-8">
                <h3><f:display bean="article" property="teaser"/></h3>
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
                <g:link class="edit" action="editFeaturedImage" resource="${this.article}"><g:message code="article.featuredImageUrl.edit.label" default="Edit Featured Image" /></g:link>
                <g:link class="edit" action="edit" resource="${this.article}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            </fieldset>
            <g:form resource="${this.article}" method="DELETE">
                <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </g:form>
        </div>
    </body>
</html>
