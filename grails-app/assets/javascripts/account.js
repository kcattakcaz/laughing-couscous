/**
 * Created by Jacob on 4/18/2016.
 */
$(document).ready(function() {
    $(".tab").click(function() {
        $(".info").hide();
        if ($(this).attr("id") == "profile") {
            $(".info_profile").show();
        }
        else if ($(this).attr("id") == "favorites") {
            $(".info_favorites").show();
        }
    })
});