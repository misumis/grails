package demo

import grails.compiler.GrailsCompileStatic
import grails.validation.Validateable

@GrailsCompileStatic
class NameCommand implements Validateable {
    String title
    String teaser
    String text
    String author


    static constraints = {
        title nullable: false, blank: false

    }
}
