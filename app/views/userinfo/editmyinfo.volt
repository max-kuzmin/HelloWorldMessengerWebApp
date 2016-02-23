{{ form("userinfo/editinfo?login=" ~ user.login, "enctype":"multipart/form-data") }}

<div class="col-lg-3">
    {{ image("userinfo/getavatar?login=" ~ user.login, "class": "img-rounded img-responsive imgbig" ) }}
    <input type="file" name="avatar" style="margin-top: 1em">
</div>
<div class="col-lg-7">

    <div class="h4 brdr-btm" style="margin-bottom: 1em; padding-bottom: 0.5em"> <strong>{{ user.name }}</strong></div>

    <dl class="dl-horizontal">
        <dt>Логин</dt>
        <dd>{{ text_field("login", "value" : user.login, "disabled": true, "class" : "form-control") }}</dd>
        <dt>Пароль</dt>
        <dd>
            <div class="form-group has-feedback" id="passGroup">
                <input type="password" name="pass" class="form-control" placeholder="Введите новый пароль" id="pass1" oninput="passCheck()">
                <input type="password" name="pass2" class="form-control" placeholder="Повторите пароль" id="pass2" oninput="passCheck()">
            </div>
        </dd>
        <dt>Email</dt>
        <dd>{{ text_field("email", "value" : user.email, "class" : "form-control") }}</dd>
        <dt>Имя</dt>
        <dd>{{ text_field("name", "value" : user.name, "class" : "form-control") }}</dd>
        <dt>Пол</dt>
        <dd>{{ select_static("gender", this.genders, "value" : user.gender, "class" : "form-control") }}</dd>
        <dt>Страна</dt>
        <dd>{{ select_static("country", this.countries, "value" : user.country, "class" : "form-control") }}</dd>
    </dl>


</div>

<div class="col-lg-12 text-center" style="margin-top: 2em">
    {{ submit_button("Сохранить", "class" : "btn btn-primary") }}
</div>

{{ endForm() }}