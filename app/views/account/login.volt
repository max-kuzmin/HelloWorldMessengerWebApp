<div class="col-lg-offset-5 col-lg-4" style="margin-bottom: 5em; margin-top: 3em">
    <h3 style="margin-bottom: 1em">Вход в аккаунт</h3>
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

    <div style="margin-top: 2em">
        {{ submit_button("Войти", "class" : "btn btn-primary") }}
        <div style="margin-top: 1em"></div>
        {{ link_to("account/forgotpass", "Восстановить аккаунт", "class":"text-muted small") }}
    </div>
    {{ endForm() }}


</div>