{{ image("userinfo/getavatar?login=" ~ user.login) }}

{{ form("userinfo/editinfo?login=" ~ user.login, "enctype":"multipart/form-data") }}

<input type="file" name="avatar">

<label for="login">Логин:</label>
{{ text_field("login", "value" : user.login, "disabled": true) }}

<label for="pass">Пароль:</label>
{{ passwordField("pass") }}

<label for="pass2">Повторите пароль:</label>
{{ passwordField("pass2") }}

<label for="email">E-mail:</label>
{{ text_field("email", "value" : user.email) }}

<label for="name">Ваше имя:</label>
{{ text_field("name", "value" : user.name) }}

<label for="gender">Ваш пол:</label>
{{ select_static("gender", this.genders, "value" : user.gender) }}

<label for="country">Страна:</label>
{{ select_static("country", this.countries, "value" : user.country) }}

{{ submit_button("Сохранить") }}

{{ endForm() }}

{{ flash.output() }}