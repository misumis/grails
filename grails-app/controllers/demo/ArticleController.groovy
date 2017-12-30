package demo

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.OK
import static org.springframework.http.HttpStatus.NOT_FOUND
import static org.springframework.http.HttpStatus.NO_CONTENT
import static org.springframework.http.HttpStatus.CREATED
import grails.transaction.Transactional

@SuppressWarnings('LineLength')
class ArticleController {

    static allowedMethods = [
            save: 'POST',
            update: 'PUT',
            uploadFeaturedImage: 'POST',
            delete: 'DELETE',
    ]

    def uploadArticleFeaturedImageService

    def articleGormService

    // tag::featuredImage[]
    @Transactional(readOnly = true)
    def featuredImage(Article article) {
        if (article == null || article.featuredImageBytes == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        render file: article.featuredImageBytes, contentType: article.featuredImageContentType
    }

    // end::featuredImage[]

    // tag::editFeaturedImage[]
    @Secured(value=["hasRole('ROLE_ADMIN')"])
    @Transactional(readOnly = true)
    def editFeaturedImage(Article article) {
        respond article
    }

    // end::editFeaturedImage[]

    // tag::index[]
    @Transactional(readOnly = true)
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def (l, total) = articleGormService.list(params)
        respond l, model:[articleCount: total]
    }

    // end::index[]

    // tag::show[]

    @Transactional(readOnly = true)
    def show(Article article) {
        respond article
    }

    // end::show[]

    // tag::create[]
    @Secured(value=["hasRole('ROLE_ADMIN')"])
    @SuppressWarnings(['GrailsMassAssignment', 'FactoryMethodName'])
    @Transactional(readOnly = true)
    def create() {
        respond new Article(params)
    }

    // end::create[]

    // tag::edit[]
    @Secured(value=["hasRole('ROLE_ADMIN')"])
    @Transactional(readOnly = true)
    def edit(Article article) {
        respond article
    }

    // end::edit[]

    // tag::uploadFeaturedImage[]
    @Secured(value=["hasRole('ROLE_ADMIN')"])
    def uploadFeaturedImage(FeaturedImageCommand cmd) {
        if (cmd == null) {
            notFound()
            return
        }

        if (cmd.hasErrors()) {
            respond(cmd.errors, model: [article: cmd], view: 'editFeaturedImage')
            return
        }

        def article = uploadArticleFeaturedImageService.uploadFeatureImage(cmd)

        if (article == null) {
            notFound()
            return
        }

        if (article.hasErrors()) {
            respond(article.errors, model: [article: article], view: 'editFeaturedImage')
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'article.label', default: 'Article'), article.id])
                redirect (controller: 'article', action: 'protectedIndex')
            }
            '*' { respond article, [status: OK] }
        }
    }

    // end::uploadFeaturedImage[]

    // tag::save[]
    @Secured(value=["hasRole('ROLE_ADMIN')"])
    def save(NameCommand cmd) {
        if (cmd == null) {
            notFound()
            return
        }

        if (cmd.hasErrors()) {
            respond cmd.errors, model: [article: cmd], view:'create'
            return
        }

        def article = articleGormService.save(cmd)

        if (article == null) {
            notFound()
            return
        }

        if (article.hasErrors()) {
            respond article.errors, model: [article: article], view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'article.label', default: 'Article'), article.id])
                redirect (controller: 'article', action: 'protectedIndex')
            }
            '*' { respond article, [status: CREATED] }
        }
    }

    // end::save[]

    // tag::update[]
    @Secured(value=["hasRole('ROLE_ADMIN')"])
    def update(NameUpdateCommand cmd) {
        if (cmd == null) {
            notFound()
            return
        }

        if (cmd.hasErrors()) {
            respond article.errors, model: [article: cmd], view:'edit'
            return
        }

        def article = articleGormService.update(cmd)

        if (article == null) {
            notFound()
            return
        }

        if (article.hasErrors()) {
            respond article.errors, model: [article: article], view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'article.label', default: 'Article'), article.id])
                redirect (controller: 'article', action: 'protectedIndex')
            }
            '*' { respond article, [status: OK] }
        }
    }

    // end::update[]

    // tag::delete[]
    @Secured(value=["hasRole('ROLE_ADMIN')"])
    def delete() {

        Long articleId = params.long('id')

        if (articleId == null) {
            notFound()
            return
        }

        articleGormService.deleteById(articleId)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'article.label', default: 'Article'), articleId])
                redirect action: 'index', method: 'GET'
            }
            '*' { render status: NO_CONTENT }
        }
    }

    // end::delete[]

    // tag::protectedIndex[]
    @Transactional(readOnly = true)
    @Secured(value=["hasRole('ROLE_ADMIN')"])
    def protectedIndex(Integer max){
        params.max = Math.min(max ?: 10, 100)
        def (l, total) = articleGormService.list(params)
        respond l, model:[articleCount: total]
    }
    // end::protectedIndex[]

    // tag::notFound[]
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'article.label', default: 'Article'), params.id])
                redirect action: 'index', method: 'GET'
            }
            '*' { render status: NOT_FOUND }
        }
    }

    // end::notFound[]
}
