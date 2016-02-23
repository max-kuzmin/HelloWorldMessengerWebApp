var _path = "/HelloWorldMessengerWebApp/";

var passCheck = function () {
    var field = $("#passGroup").removeClass("has-error");
    if ($("#pass1").val() == $("#pass2").val() && $("#pass2").val().length >= 5) {
        field.addClass("has-success");
        field.removeClass("has-error");
    }
    else {
        field.addClass("has-error");
        field.removeClass("has-success");
    }
}


var checkNewDialogs = function () {

    $.get(_path + "/dialog/checknew", function (data) {
        num = $.parseJSON(data)["status"];
        if (num > 0) {
            $("#newdialogs").html($.parseJSON(data)["status"]);
        }
        else {
            $("#newdialogs").html("");
        }
    });

}

var checkNewFriends = function () {

    $.get(_path + "/friends/checknew", function (data) {
        num = $.parseJSON(data)["status"];
        if (num > 0) {
            $("#newfriends").html($.parseJSON(data)["status"]);
        }
        else {
            $("#newfriends").html("");
        }
    });

}


var page = 0;

var loadSearchUsers = function () {

    query = $("#query").val();
    page++;

    $.get(_path + "search/searchusers?query=" + query + "&partial=1&page=" + page, function (data) {
        $("#users_container").append(data);
    });

}




$(document).ready(function () {

    $(".alert").append(
        '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
        '<span aria-hidden="true">&times;</span>' +
        '</button>'
    );

    checkNewDialogs();
    checkNewFriends();
});



