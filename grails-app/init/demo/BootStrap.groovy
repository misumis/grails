package demo

class BootStrap {

    def init = { servletContext ->

//        def adminRole = Role.findOrSaveWhere(authority: "ROLE_ADMIN")
//        def user = User.findOrSaveWhere(username: "qmisno@gmail.com", password: "coolbeans")
//        if(!user.getAuthorities().contains(adminRole) ){
//            UserRole.create(user, adminRole, true)
//        }

    }
    def destroy = {
    }
}
