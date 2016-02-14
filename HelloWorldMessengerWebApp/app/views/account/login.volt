{{ form("account/login") }}
<label for="login">Логин:</label>
{{ text_field("login") }}
<label for="pass">Пароль:</label>
{{ text_field("pass", "placeholder": "Пароль") }}
{{ submit_button("Login") }}
{{ endForm() }}

{{ flash.output() }}