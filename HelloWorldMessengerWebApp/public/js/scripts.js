var _path = "/HelloWorldMessengerWebApp/";

//валидация пароля
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
};

//проверка на наличие новых сообщений
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

};

//проверка на наличие новых друзей
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

};

//загрузка страницы результатов поиска
var page = 0;
var loadSearchUsers = function () {

    query = $("#query").val();
    page++;

    $.get(_path + "search/searchusers?query=" + query + "&partial=1&page=" + page, function (data) {
        $("#users_container").append(data);
    });

};

//загрузка предыдущих сообщений
var loadPrevMessages = function () {
    time = $("#messages_container").children().first().children().last().val();

    $.get(_path + "message/showprevmessages?dialogid=" + $("#dialogid").val() + "&time=" + time, function (data) {
        $("#messages_container").prepend(data);
        if (data == "") $("#loadmore").hide();
    });
};

//загркзка последних сообщений
var loadLastMessages = function () {

    time = $("#messages_container").children().last().children().last().val();

    $.get(_path + "message/showlastmessages?dialogid=" + $("#dialogid").val() + "&time=" + time, function (data) {
        $("#messages_container").append(data);

        if (data != "") $("#messages_container").scrollTop($("#messages_container")[0].scrollHeight);

    });

};

//отправка сообщения
var img;
var postmessage = function (e) {

    form = new FormData();


    form.append("dialogid", $("#dialogid").val());
    form.append("text", $("#text").val());
    if (img) form.append("image", img);

    $("#text").val("");

    $.ajax({
        url: "addmessage",
        type: "POST",
        data: form,
        async: true,
        success: false,
        cache: false,
        contentType: false,
        processData: false
    });

    return false;
};


$(document).ready(function () {

    $(".alert").append(
        '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
        '<span aria-hidden="true">&times;</span>' +
        '</button>'
    );


    $('#image').change(function () {
        img = this.files[0];
    });


    $("#sendmessage").submit(postmessage);

    checkNewDialogs();

    checkNewFriends();

    setInterval(loadLastMessages, 5000);

    setInterval(checkNewDialogs, 5000);
    setInterval(checkNewFriends, 5000);
});



