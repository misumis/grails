<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'article.label', default: 'Article')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-restaurant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>

            <h2><g:message code="default.list.label" args="[entityName]" /></h2>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            %{--<f:table collection="${articleList}" properties="['name']"/>--}%
        <div class="row" style="display: flex;flex-wrap: wrap;">
            <g:each in="${articleList}">
                <div class="article-wrapper col-xs-12 col-sm-6 col-md-3">
                    <div class="article-inner">
                        <a class="article-inner-img" href="<g:createLink action="show" id="${it.id}" />">
                            <div class="image"  alt="" style="background:url(<g:createLink controller="article" action="featuredImage" id="${it.id}"/>); background-size: cover;
                            background-repeat: no-repeat;
                            background-position: 50% 50%;"></div>
                        </a>
                        <a  href="@routes.ArticleController.show(article.id)"><p class="article-inner__title">${it.title}</p></a>
                        <p class="article-inner-text">${it.teaser}</p>
                        <p class="article-inner-author">Author: ${it.author}</p>
                    </div>
                </div>
            </g:each>

            <div class="pagination">
                <g:paginate total="${articleCount ?: 0}" />
            </div>
        </div>
    </body>
</html>