package anime

class Show {

    static constraints = {
        name blank: false
        start_year min: Date.parse('yyyy','1980'),
                max: Date.parse('yyyy','2016')
        end_year min: Date.parse('yyyy', '1980'),
                max: Date.parse('yyyy', '2016')
        description blank: false, maxSize: 10000
        num_episodes blank: false, min:1, max:99999
        approved nullable: true
    }

    String name
    Date start_year
    Date end_year
    String description
    Integer num_episodes
    Boolean approved

    static mapping = {
        description column: 'description', sqlType: 'mediumtext'
    }

    static hasMany = [tags:Tag]
    static belongsTo = Tag
}
