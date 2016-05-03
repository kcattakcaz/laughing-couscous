package anime

import com.Anime.User

class Favorite {

    static constraints = {
    }

    Date date
    static belongsTo = [user: User, show: Show]

    Favorite (User u, Show s, Date d) {
        user = u
        show = s
        date = d
    }
}
