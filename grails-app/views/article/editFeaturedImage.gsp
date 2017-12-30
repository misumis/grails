<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'article.label', default: 'Article')}" />
    <title><g:message code="default.editphoto.label" args="[entityName]" default="Edit Article Photo" /></title>
</head>
<body>
    <div id="edit-article" class="content scaffold-edit" role="main">
        <h2><g:message code="default.editphoto.label" args="[entityName]" default="Edit Article Photo" /></h2>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.article}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.article}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:uploadForm name="uploadFeaturedImage" action="uploadFeaturedImage">
            <g:hiddenField name="id" value="${this.article?.id}" />
            <g:hiddenField name="version" value="${this.article?.version}" />
            <input type="file" name="featuredImageFile" />
            <fieldset class="buttons">
                <input class="save btn btn-default btn-submit" type="submit" value="${message(code: 'article.featuredImage.upload.label', default: 'Upload')}" />
            </fieldset>
        </g:uploadForm>
    </div>
</body>
</html>
