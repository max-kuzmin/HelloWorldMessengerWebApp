{{ form("account/forgotpass") }}

<label for="email">Email:</label>
{{ text_field("email") }}

<label for="login">Login:</label>
{{ text_field("login") }}

{{ submit_button("Восстановить") }}

{{ endForm() }}

{{ flash.output() }}