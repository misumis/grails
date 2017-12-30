<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'article.label', default: 'Article')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<h2><g:message code="default.list.label" args="[entityName]" /></h2>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
%{--<f:table collection="${articleList}" properties="['name']"/>--}%
<div class="row">
    <div class="col-md-12">
        <table class="article-table">
            <tr>
                <th style="text-align: center">ID</th>
                <th>Title</th>
                <th>Author</th>
                <th style="text-align: center">Add/Edit Picture</th>
                <th style="text-align: center">Edit</th>
                <th style="text-align: center">Delete</th>
            </tr>
            <g:each in="${articleList}">
            <tr>
                <td style="text-align: center">${it.id}</td>
                <td><g:link action="show" id="${it.id}" style="font-weight: 700;">${it.title}</g:link></td>
                <td class="article-inner-author">${it.author}</td>
                <td style="text-align: center"><g:link class="edit" action="editFeaturedImage" resource="${it}"><g:message code="article.featuredImageUrl.edit.label" default="Edit Featured Image" /></g:link></td>
                <td style="text-align: center"><g:link class="edit" style="font-weight: 700;" action="edit" resource="${it}"><g:message code="default.button.edit.label" default="Edit" /></g:link></td>
                <td style="background: #C71D4A;text-align: center">
                    <g:form resource="${it}" method="DELETE">
                        <input style="color:white;font-weight: 700;background: transparent;border:none;" class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </g:form>
                </td>
            </tr>
            </g:each>
        </table>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <g:link class="btn btn-primary btn-default btn-submit" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
        <g:link class=" btn btn-primary btn-default btn-submit" controller='logout'>Logout</g:link>
    </div>
</div>

</body>
</html>