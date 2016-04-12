package anime

import grails.plugin.springsecurity.annotation.Secured

class TagController {

    @Secured('permitAll')
    def index() {
        def tags = Tag.list()
        [tags:tags]
    }

    @Secured('permitAll')
    def show(){
        def tag = Tag.get(params.id)

        [tag:tag]
    }


    @Secured(value = "hasRole('ROLE_ADMIN')", httpMethod='GET')
    def create(){
        render(view:"create")
    }

    @Secured(value="hasRole('ROLE_ADMIN')",httpMethod='POST')
    def store(){
        def Tag = new Tag(params)
        if(!Tag.save()){
            println(Tag.getErrors())
        }
        redirect(action:"index")
    }

    @Secured(value="hasRole('ROLE_ADMIN')",httpMethod='GET')
    def edit(){

    }

    @Secured(value="hasRole('ROLE_ADMIN')",httpMethod='PUT')
    def update(){

    }


    @Secured(value="hasRole('ROLE_ADMIN')",httpMethod='DELETE')
    def delete(){
        redirect(action: "index")
    }
}
