package anime

class Tag {

    static constraints = {
        name maxSize: 100
    }

    String name;

    static hasMany = [shows:Show]
    //static belongsTo = Show
}
