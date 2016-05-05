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
        def userRole = Role.findByAuthority("ROLE_USER") //Define newly registered users with the USER role
        def user = new User(params.username, params.password, params.email)
        if (!user.save()) {
            render(view: "register", model: [user: user]) //User did not save properly, take user back to register page
        }
        else {
            UserRole.create user, userRole, true
            springSecurityService.reauthenticate(user.username, user.password) //Create and save new user
            redirect(controller: "show", action: "index")
        }


    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def account() {
        def user = springSecurityService.getCurrentUser() //Get the current user
        def favorites = Favorite.findAllByUser(user) //Get favorites for current user
        [user: user, favorites: favorites]
    }
}
