package anime

import com.Anime.User

class Rating {
    static belongsTo = [user: User, show: Show]

    static constraints = {
    }

    Integer stars

    Rating (User u, Show s, Integer r) {
        user = u
        show = s
        stars = r
    }
}
