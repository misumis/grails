<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'article.label', default: 'Article')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="create-article" class="content scaffold-create" role="main">
            <h2><g:message code="default.create.label" args="[entityName]" /></h2>
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
            <g:form action="save">
                <fieldset class="form">
                    <label for="title" >Title</label>
                    <g:textField class="article_input" name="title" value="${this.article?.title}"/>
                    <label for="teaser" >Teaser</label>
                    <g:textField class="article_input" name="teaser" value="${this.article?.teaser}"/>
                    <label for="text" >Text</label>
                    <g:textArea class="" id="editor" name="text" value="${this.article?.text}"/>
                    <label for="author" >Author</label>
                    <g:textField class="article_input" name="author" value="${this.article?.author}"/>

                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save btn btn-default btn-submit" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
