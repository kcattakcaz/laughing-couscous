package anime
import grails.plugin.springsecurity.annotation.Secured

class ShowController {

    @Secured(['permitAll'])
    def index() {
        def shows = Show.list([sort:"name"])
        [shows:shows]
    }

    def newShowForm() {
        def tags = Tag.list();
        [tags:tags]
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

    def deleteShow(){
        def show = Show.get(params.id)
        show.delete()
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
}
