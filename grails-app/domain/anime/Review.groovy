package anime

import com.Anime.User

class Review {

    static belongsTo = [user: User]
    static constraints = {
    }

    String showName
    String text

    Review(User u, String s, String t){
        user = u
        showName = s
        text = t
    }
}
