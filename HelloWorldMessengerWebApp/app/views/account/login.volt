<div class="col-lg-offset-5 col-lg-4" style="margin-bottom: 5em; margin-top: 4em">

{{ form("account/login") }}

<div class="form-group">
    <label for="login">Логин:</label>
    {{ text_field("login", "class" : "form-control") }}
</div>

<div class="form-group">
    <label for="pass">Пароль:</label>
    {{ password_field("pass", "class" : "form-control") }}
</div>

<div class="checkbox">
    <label>
        {{ check_field("remember", "checked": "checked") }}
        Запомнить
    </label>
</div>

{{ submit_button("Войти", "class" : "btn btn-primary") }}

{{ endForm() }}


</div>