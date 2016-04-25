package anime

import com.Anime.User
import grails.plugin.springsecurity.annotation.Secured

class ShowController {

    def springSecurityService

    @Secured(['permitAll'])
    def index() {
        def shows = Show.findAllByApproved(true)
        [shows:shows]

    }
    @Secured(['ROLE_ADMIN'])
    def newShowForm() {
        def tags = Tag.list();
        [tags:tags]

       // def saveImage = {
       //     def file = request.getFile('file').inputStream.text
       //     file.transferTo(new File('/tmp'))
       // }
    }

    def addShow(){

      def show = new Show(params)


        if (show.save()) {
            redirect(action:"index")
        } else {
            def tags = Tag.list()
            render(view:"newShowForm",model:[show:show,tags:tags])
        }
    }

    @Secured(['ROLE_ADMIN'])
    def deleteShow(){
        def s = Show.get(params.id)
        s.delete()
        redirect(action:"index")
    }


    def updateShow(){
    }

    def homepage(){
        redirect(action:"index")
    }

    def pendingShow () {
        def shows = Show.findAllByApproved(false)
        [shows:shows]
    }

    def approveShow(){
        def s = Show.get(params.id)
        s.approved = true
        s.save()
        redirect(action:"index")
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def addFavorite() {
        def user = springSecurityService.getCurrentUser()
        def show = Show.findById(params.id.toInteger())
        new Favorite(user, show, new Date()).save()
        redirect(action:"index")
    }
}
