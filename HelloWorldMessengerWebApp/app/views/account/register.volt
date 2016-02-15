{{ form("account/register") }}

<label for="login">Логин:</label>
{{ text_field("login") }}

<label for="pass">Пароль:</label>
{{ passwordField("pass") }}

<label for="pass2">Повторите пароль:</label>
{{ passwordField("pass2") }}

<label for="email">E-mail:</label>
{{ text_field("email") }}

<label for="name">Ваше имя:</label>
{{ text_field("name") }}

<label for="gender">Ваш пол:</label>
{{ select_static("gender", ["муж", "жен"]) }}

<label for="country">Страна:</label>
{{ select_static("country", ["Россия", "Украина"]) }}

{{ submit_button("Зарегистрировать") }}

{{ endForm() }}

{{ flash.output() }}