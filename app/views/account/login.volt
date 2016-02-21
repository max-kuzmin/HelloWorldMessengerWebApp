{{ form("account/login") }}

<label for="login">Логин:</label>
{{ text_field("login") }}

<label for="pass">Пароль:</label>
{{ password_field("pass", "placeholder": "Пароль") }}

{{ check_field("remember", "checked": "checked") }}

{{ submit_button("Войти") }}

{{ endForm() }}

{{ flash.output() }}