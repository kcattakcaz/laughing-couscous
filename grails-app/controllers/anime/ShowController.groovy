package anime

import com.Anime.User
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import grails.web.context.ServletContextHolder

@Transactional(readOnly = false)
class ShowController {

    def springSecurityService
    def ser

    @Secured(['permitAll'])
    def index() {
        def shows = Show.findAllByApproved(true) //Find all approved shows to display on homepage
        [shows: shows, user: springSecurityService.getCurrentUser()]
    }

    @Secured(['ROLE_ADMIN'])
    def newShowForm() {
        def tags = Tag.list();
        [tags: tags]
    }

    def addShow() {
        def show = new Show(params)


            params.tagIds.each {
                def t = Tag.findById(it);
                show.addToTags(t); //Add the tags to the show
            }


        def f = request.getFile('image')
        show.image = f.bytes
        show.image_type = f.contentType

        if (show.save()) {
            redirect(action: "index") //redirect user if show is added successfully
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
        def shows = Show.findAllByApproved(false)  //Find the shows awaiting moderators approval
        [shows: shows]
    }

    def approveShow() {
        def s = Show.get(params.id)
        s.approved = true  //Change the approval status of a show to approved and update it in the database
        if(s.save()){
            render(contentType: 'text/json') {[
                    'status': true
            ]}
        }
        else{
            render(contentType: 'text/json') {[
                    'status': false
            ]}
        }
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def addFavorite() {
        def user = springSecurityService.getCurrentUser()
        def show = Show.findById(params.id.toInteger())
        new Favorite(user, show, new Date()).save() //Save the selected show to the current users favorites
        redirect(action: "index")
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def deleteFavorite() {
        def user = springSecurityService.getCurrentUser()
        def show = Show.findById(params.id.toInteger())
        def fav = Favorite.findByUserAndShow(user, show) //Find the favorited show in the users favorites list for deletion
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
        redirect(uri: request.getHeader('referer'))
    }

    def show_image() {
        def show = Show.get(params.id) //Get the show the image is being uploaded for
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
        def searchShows = Show.withCriteria() {
            ilike('name', "%" + params.search + "%") //Find all show titles containing search params
        }

        def searchTags = Show.withCriteria() {
            tags{
                ilike('name', "%" + params.search + "%") //Find all shows containing tags fiting the search params
            }
        }

        //Remove duplicates
        def shows = []
        for(int i; i<searchShows.size();i++){
            if(!shows.contains(searchShows[i])){
                shows.add(searchShows[i])
                println(searchShows[i])
            }
        }
        def tags = []
        for(int i; i<searchTags.size();i++){
            if(!tags.contains(searchTags[i])){
                tags.add(searchTags[i])
                println(searchTags[i])
            }
        }

        //Remove overlaps
        for(int i; i<tags.size();i++){
            if(shows.contains(tags[i])){
                tags.remove(i)
            }
        }
        for(int i; i<shows.size();i++){
            if(tags.contains(shows[i])){
                shows.remove(i)
            }
        }

        [shows: shows, tags: tags]

    }

    def showDisplay(){
        def shows = Show.findById(params.id) //Find selected show
        def reviews = Review.findByShow(shows) //Find reviews for selected show
        println(reviews)
        [show:shows, reviews:reviews]
    }

    def addComment(){
        def user = springSecurityService.getCurrentUser() //Find user
        user.addPoints(5) //Add points for commenting
        user.addComment()
        user.save()
        def comment = new Comment(params)
        comment.save() //Add and save comment
        redirect(action:"showDisplay")
    }

    def addReview(){
        def user = springSecurityService.getCurrentUser() //Find the current user
        user.addPoints(10) //Add points for reviewing a show
        user.addReview()
        user.save()
        def shows = Show.findById(params.showID) //Find show review is being written on
        def review = new Review(user,shows,params.reviewText) //Add show review
        println(user.id)
        println(shows.name)
        println(params.reviewText)
        review.save()
        println(review.errors.allErrors)
        redirect(uri: request.getHeader('referer'))
    }
}
