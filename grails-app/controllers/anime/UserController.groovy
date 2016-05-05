package anime

import com.Anime.Role
import com.Anime.User
import com.Anime.UserRole
import grails.plugin.springsecurity.annotation.Secured

class UserController {

    def springSecurityService

    def index() {}

    def register() {}

    def createUser() {
        def userRole = Role.findByAuthority("ROLE_USER")
        def user = new User(params.name, params.password, params.email).save(flush: true)
        UserRole.create user, userRole, true
        springSecurityService.reauthenticate(user.username, user.password)
        redirect(controller: "show", action: "index")
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def account() {
        def user = springSecurityService.getCurrentUser()
        def favorites = Favorite.findAllByUser(user)
        [user: user, favorites: favorites]
    }
}
