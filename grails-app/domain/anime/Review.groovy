package anime

import com.Anime.User

class Review {

    static belongsTo = [user: User, show: Show]
    static constraints = {
    }

    String text

    Review(User u, Show s, String t){
        user = u
        show = s
        text = t
    }
}
