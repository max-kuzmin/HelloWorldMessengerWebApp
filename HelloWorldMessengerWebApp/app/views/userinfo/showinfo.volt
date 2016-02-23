
<div class="col-lg-3">
    {{ image("userinfo/getavatar?login=" ~ user.login, "class": "img-rounded img-responsive imgbig" ) }}
</div>
<div class="col-lg-7">

    <div class="h4 brdr-btm" style="margin-bottom: 1em; padding-bottom: 0.5em"> <strong>{{ user.name }}</strong></div>

    <dl class="dl-horizontal">
        <dt>Логин</dt>
        <dd>{{ user.login }}</dd>
        <dt>Пол</dt>
        <dd>{{ this.genders[user.gender] }}</dd>
        <dt>Страна</dt>
        <dd>{{ this.countries[user.country] }}</dd>
    </dl>

</div>

<div class="col-lg-12 text-center" style="margin-top: 2em">

    {% if fullfriend %}
    {{ link_to("dialog\createdialog?login="~user.login, "Создать диалог", "class" : "btn btn-success")  }}
    {{ link_to("friends\removefriend?login="~user.login, "Удалить из друзей", "class" : "btn btn-default", "style": "margin-left: 1em")  }}
    {% elseif halffriend %}
    {{ link_to("friends\removefriend?login="~user.login, "Удалить из друзей", "class" : "btn btn-default", "style": "margin-left: 1em")  }}
    <h5 style="child-align: middle"><small>Вы сможете создать диалог, когда пользователь добавит вас в друзья</small></h5>
    {% else %}
    {{ link_to("friends\addfriend?login="~user.login, "Добавить в друзья", "class" : "btn btn-success")  }}
    {% endif %}

</div>