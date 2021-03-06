import anime.Favorite
import anime.Show
import com.Anime.Role
import com.Anime.User
import com.Anime.UserRole

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role('ROLE_ADMIN').save()
        def userRole = new Role('ROLE_USER').save()

        def admin = new User('admin', '1', 'test@test.com').save()
        UserRole.create admin, adminRole

        def user = new User('user', '1', 'test1@test.com').save()
        UserRole.create user, userRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }

        /*def show = new Show()
        show.name = "Test"
        show.description = "Test"
        show.num_episodes = 10
        show.approved = true
        show.image = []
        show.save(flush:true)
        show.tags = "Test"

        Show.withSession {
            it.flush()
            it.clear()
        }

        def favorite = new Favorite(User.findByUsername("admin"), show, new Date())
        favorite.save(flush:true)*/
    }
    def destroy = {
    }
}
