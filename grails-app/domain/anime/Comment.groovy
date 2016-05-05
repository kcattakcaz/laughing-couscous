package anime

import com.Anime.User

class Comment {

    static belongsTo = [user: User, review: Review]
    static constraints = {
    }

    String text

    Comment(User u, Review r, String t){
        user = u
        review = r
        text = t
    }
}
