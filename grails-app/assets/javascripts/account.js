$(document).ready(function() {


    $(".tab").click(function() {
        $(".info").hide();
        $(".tab").removeClass("active");
        $(this).addClass("active");
        if ($(this).attr("id") == "profile") {
            $(".info_profile").show();
        }
        else if ($(this).attr("id") == "favorites") {
            $(".info_favorites").show();
        }
    })
});