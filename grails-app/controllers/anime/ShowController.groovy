package anime

class ShowController {

    def index() {}

    def mainPage() {}

    def addShow(){
        def show = new Show(params)

        if (show.save()) {
            redirect(action:"mainPage")
        } else {
            render(view:"newShowForm",model:[show:show])
        }
    }

    def deleteShow(){
        def show = Show.get(params.id)
        show.delete()
        redirect(action:"mainPage")
    }

    def updateShow(){

    }
}
