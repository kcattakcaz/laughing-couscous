package anime

class Show {

    static constraints = {
        description maxSize: 10000
    }

    String name
    Date start_year
    Date end_year
    String description
    Integer num_episodes
    Boolean approved

    static mapping = {
        description type: "mediumtext"
    }

    static belongsTo = [tag:Tag]
}
