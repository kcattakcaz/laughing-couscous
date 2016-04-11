package anime

class Tag {

    static constraints = {
        value maxSize: 100
    }

    String value;

    static hasMany = [show:Show]
}
