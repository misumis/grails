package demo

import grails.transaction.Transactional

class ArticleGormService {

    // tag::list[]
    @Transactional(readOnly = true)
    List list(Map params) {
        [Article.list(params), Article.count()]
    }
    // end::list[]

    // tag::updateArticleFeaturedImage[]
    @Transactional
    Article updateArticleFeaturedImage(Long articleId, Integer version, byte[] bytes, String contentType) {
        Article article = Article.get(articleId)
        if ( !article ) {
          return null
        }
        article.version = version
        article.featuredImageBytes = bytes
        article.featuredImageContentType = contentType
        article.save()
        article
    }

    // end::updatearticleFeaturedImage[]

    // tag::save[]
    @Transactional
    Article save(NameCommand cmd) {
        def article = new Article()
        article.properties = cmd.properties
        article.save()
    }

    // end::save[]

    // tag::deleteById[]
    @Transactional
    void deleteById(Long articleId) {
        def article = Article.get(articleId)
        article?.delete()
    }

    // end::deleteById[]

    // tag::update[]
    @Transactional
    Article update(NameUpdateCommand cmd) {
        def article = Article.get(cmd.id)
        if ( !article ) {
            return null
        }
        article.properties = cmd.properties
        article.save()
    }
    // end::update[]
}
