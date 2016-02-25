<div class="col-lg-offset-5 col-lg-4" style="margin-bottom: 1em">
    <h3 style="margin-bottom: 1em">Регистрация</h3>
    {{ form("account/register") }}

    <div class="form-group">
        <label for="login">Логин:</label>
        {{ text_field("login", "class" : "form-control") }}
    </div>

    <div class="form-group has-feedback" id="passGroup">
        <label for="pass">Пароль:</label>
        <input type="password" name="pass" class="form-control" placeholder="Введите пароль" id="pass1"
               oninput="passCheck()">
        <input type="password" name="pass2" class="form-control" placeholder="Повторите пароль" id="pass2"
               oninput="passCheck()">
    </div>

    <div class="form-group">
        <label for="email">E-mail:</label>
        {{ text_field("email", "class" : "form-control") }}
    </div>

    <div class="form-group">
        <label for="name">Ваше имя:</label>
        {{ text_field("name", "class" : "form-control", "placeholder" : "Имя Фамилия") }}
    </div>

    <div class="form-group">
        <label for="gender">Ваш пол:</label>
        {{ select_static("gender", this.genders, "class" : "form-control", "value" : 0) }}
    </div>

    <div class="form-group" style="margin-bottom: 2em">
        <label for="country">Страна:</label>
        {{ select_static("country", this.countries, "class" : "form-control", "value" : 0) }}
    </div>

    {{ submit_button("Зарегистрировать", "class" : "btn btn-primary") }}

    {{ endForm() }}


</div>