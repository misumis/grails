package demo

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        '/'(controller: 'article', action: 'index')
        '/protected'(controller: 'article', action: 'protectedIndex')
        '/home'(view: '/index')
        '500'(view: '/error')
        '404'(view: '/notFound')
    }
}
