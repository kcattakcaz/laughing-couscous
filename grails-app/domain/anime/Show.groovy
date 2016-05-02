package anime

class Show {

    static hasMany = [tags:Tag, favorites: Favorite, ratings: Rating]
    static belongsTo = Tag

    static constraints = {
        name blank: false
        start_year min: Date.parse('yyyy','1980'),
                max: Date.parse('yyyy','2016'),
                nullable: true
        end_year min: Date.parse('yyyy', '1980'),
                max: Date.parse('yyyy', '2016'),
                nullable: true
        description blank: false, maxSize: 10000
        num_episodes blank: false, min:1, max:99999
        approved nullable: true
        tags nullable: true
        ratings nullable: true
        rating nullable: true
        image(nullable:true, maxSize: 16384 /* 16K */)
        image_type(nullable:true)
    }

    String name
    Date start_year
    Date end_year
    String description
    Integer num_episodes
    Boolean approved
    String tags
    Float rating
    byte[] image
    String image_type

    static mapping = {
        description column: 'description', sqlType: 'mediumtext'
    }
}