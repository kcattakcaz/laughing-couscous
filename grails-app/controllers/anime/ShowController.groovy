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

        def saveImage = {
            def file = request.getFile('file').inputStream.text
            file.transferTo(new File('/tmp'))
        }
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
}
