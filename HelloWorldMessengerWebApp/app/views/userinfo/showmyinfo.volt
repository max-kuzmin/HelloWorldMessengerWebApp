<div class="col-lg-3">
    {{ image("userinfo/getavatar?login=" ~ user.login, "class": "img-rounded img-responsive imgbig" ) }}
</div>
<div class="col-lg-7">

    <div class="h4 brdr-btm" style="margin-bottom: 1em; padding-bottom: 0.5em"> <strong>{{ user.name }}</strong></div>

    <dl class="dl-horizontal">
        <dt>Логин</dt>
        <dd>{{ user.login }}</dd>
        <dt>Email</dt>
        <dd>{{ user.email }}</dd>
        <dt>Пол</dt>
        <dd>{{ this.genders[user.gender] }}</dd>
        <dt>Страна</dt>
        <dd>{{ this.countries[user.country] }}</dd>
    </dl>

</div>

<div class="col-lg-12 text-center" style="margin-top: 2em">
    {{ link_to("userinfo\editinfo?login=" ~ user.login, "Редактировать", "class" : "btn btn-default") }}
</div>