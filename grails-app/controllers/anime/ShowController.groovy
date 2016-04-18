package anime

class ShowController {

    def index() {
        def shows = Show.list([sort:"name"])
        [shows:shows]
    }

    def newShowForm() {}

    def addShow(){
        def show = new Show(params)

        if (show.save()) {
            redirect(action:"index")
        } else {
            render(view:"newShowForm",model:[show:show])
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
