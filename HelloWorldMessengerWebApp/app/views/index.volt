<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    {{ stylesheet_link("css/bootstrap.min.css") }}
    {{ stylesheet_link("css/styles.css") }}
</head>
<body>
<div class="container">

    <div class="row navbar navbar-default">
        <div class="col-lg-8">
            <h2>HelloWorld Messenger</h2>
        </div>
        <div class="col-lg-4" style="margin-top: 1em">
            {% if not session.get("auth") %}
            <div class="row">
                <div class="col-lg-6 col-lg-offset-6" style="margin-top: 0.25em">
                    {{ link_to("account/login", "Вход", "class" : "btn btn-default btn-sm") }}
                    {{ link_to("account/register", "Регистрация", "class" : "btn btn-default btn-sm") }}
                </div>
            </div>
            {% else %}
            <div class="row">
                <div class="col-lg-2 col-lg-offset-3">
                    {{ image("userinfo/getavatar?login=" ~ session.get("auth")["login"], "class": "img-rounded
                    img-responsive" ) }}
                </div>
                <div class="col-lg-3">
                    <h5>{{ session.get("auth")["login"]}}</h5>
                </div>
                <div class="col-lg-4" style="margin-top: 0.25em">
                    {{ link_to("account/logout", "Выход", "class" : "btn btn-default btn-sm") }}
                </div>
            </div>
            {% endif %}
        </div>
    </div>
    <div class="row">
        {{ flash.output() }}
    </div>
    <div class="row">

        {% if session.get("auth") %}
        <div class="col-lg-2">

            <ul class="nav nav-pills nav-stacked nav-pills-stacked-example panel panel-default">
                <li class="brdr-btm">{{ link_to("userinfo/showinfo", "Моя страница") }}</li>
                <li class="brdr-btm brdr-top">{{ link_to("dialog/showdialogs", 'Мои диалоги <span id="newdialogs" class="label label-default" style="margin-left: 1em"></span> ') }}</li>
                <li class="brdr-btm brdr-top">{{ link_to("friends/showfriends", 'Мои друзья <span id="newfriends" class="label label-default" style="margin-left: 1em"></span>') }}</li>
                <li class="brdr-top">{{ link_to("search/searchusers", "Поиск людей") }}</li>
            </ul>


        </div>

        {% endif %}
        <div class="col-lg-10">
            <div class="row" style="margin-left: 1em">
                {{ content() }}
            </div>
        </div>
    </div>


    <div class="row panel-footer text-center text-muted" style="margin-top: 2em">
        <small>Copyright © 2016 Maxim Kuzmin | <a href="mailto:kuzmin@gapps.ispu.ru" class="text-muted">Send Email</a>
        </small>
    </div>
</div>

{{ javascript_include("js/jquery.min.js") }}
{{ javascript_include("js/scripts.js") }}
{{ javascript_include("js/bootstrap.min.js") }}
</body>
</html>
