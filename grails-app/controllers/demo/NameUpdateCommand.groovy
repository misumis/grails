package demo

import grails.compiler.GrailsCompileStatic
import grails.validation.Validateable

@GrailsCompileStatic
class NameUpdateCommand implements Validateable {
    Long id
    Integer version
    String title
    String teaser
    String text
    String author

    static constraints = {
        id nullable: false
        version nullable: false
        title nullable: false, blank: false
    }
}
