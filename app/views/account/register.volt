{{ form("account/register") }}

<label for="login">Логин:</label>
{{ text_field("login") }}

<label for="pass">Пароль:</label>
{{ text_field("pass") }}

<label for="pass2">Повторите пароль:</label>
{{ text_field("pass2") }}

<label for="email">E-mail:</label>
{{ text_field("email") }}

<label for="name">Ваше имя:</label>
{{ text_field("name") }}

{{ submit_button("Зарегистрировать") }}

{{ endForm() }}

{{ flash.output() }}