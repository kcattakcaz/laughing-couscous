package anime

class ShowController {

    def index() {}

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
        redirect(actio:"index")
    }
}
