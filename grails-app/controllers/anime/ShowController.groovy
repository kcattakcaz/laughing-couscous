package anime

import com.Anime.User
import grails.plugin.springsecurity.annotation.Secured
import grails.web.context.ServletContextHolder

class ShowController {

    def springSecurityService
    def ser

    @Secured(['permitAll'])
    def index() {
        def shows = Show.findAllByApproved(true)
        [shows: shows, user: springSecurityService.getCurrentUser()]
    }

    @Secured(['ROLE_ADMIN'])
    def newShowForm() {
        def tags = Tag.list();
        [tags: tags]
    }

    def addShow() {
        def show = new Show(params)

        if (params.tagIds instanceof java.lang.String)
        {
            def t = Tag.findByName(params.tagIds);
            show.addToTags(t);
        }
        else {
            params.tagIds.each {
                def t = Tag.findById(it);
                show.addToTags(t);
            }
        }

        def f = request.getFile('image')
        show.image = f.bytes
        show.image_type = f.contentType

        if (show.save()) {
//            params.tagIds.each {
//                def tag = Tag.findById(it)
//                tag.addToShows(show)
//                //println tag.name
//                //show.addToTags(tag)
//            }
            redirect(action: "index")
        } else {
            def tags = Tag.list()
            render(view: "newShowForm", model: [show: show, tags: tags])
        }
    }

    @Secured(['ROLE_ADMIN'])
    def deleteShow() {
        def s = Show.get(params.id)
        s.delete()
        redirect(action: "index")
    }

    def updateShow() {
    }

    def homepage() {
        redirect(action: "index")
    }

    def pendingShow() {
        def shows = Show.findAllByApproved(false)
        [shows: shows]
    }

    def approveShow() {
        def s = Show.get(params.id)
        s.approved = true
        s.save()
        redirect(action: "index")
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def addFavorite() {
        def user = springSecurityService.getCurrentUser()
        def show = Show.findById(params.id.toInteger())
        new Favorite(user, show, new Date()).save()
        redirect(action: "index")
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def deleteFavorite() {
        def user = springSecurityService.getCurrentUser()
        def show = Show.findById(params.id.toInteger())
        def fav = Favorite.findByUserAndShow(user, show)
        fav.delete()
        redirect(action: "index")
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def rate() {
        def show = Show.findById(params.id.toInteger())
        def user = springSecurityService.getCurrentUser()
        def r = Rating.findByShowAndUser(show, user)

        if (r) {
            r.stars = params.star.toInteger()
            r.save()
        } else {
            def rating = new Rating(user, show, params.star.toInteger())
            show.addToRatings(rating)
        }

        def total = 0
        show.ratings.each {
            total += it.stars
        }
        show.rating = total / show.ratings.size()
        show.save()
        redirect(action: "index")
    }

    def show_image() {
        def show = Show.get(params.id)
        if (!show || !show.image || !show.image_type) {
            response.sendError(404)
            return
        }
        response.contentType = show.image_type
        response.contentLength = show.image.size()
        OutputStream out = response.outputStream
        out.write(show.image)
        out.close()
    }

    def search(){
        def shows = Show.findAllByNameIlike("%" + params.search + "%")
        [shows: shows]
    }


}
