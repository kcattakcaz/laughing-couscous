package anime

import com.Anime.User

class Favorite {

    static constraints = {
    }

    Date date
    //Show show
    //String username
    static belongsTo = [user: User, show: Show]

    Favorite (User u, Show s, Date d) {
        user = u
        show = s
        date = d
    }
}
