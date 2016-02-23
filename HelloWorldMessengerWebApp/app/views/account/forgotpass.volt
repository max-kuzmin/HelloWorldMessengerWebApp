<div class="col-lg-offset-5 col-lg-4" style="margin-bottom: 5em; margin-top: 2em">
    <h3 style="margin-bottom: 1em">Восстановление аккаунта</h3>
    {{ form("account/forgotpass") }}

    <div class="form-group">
        <label for="email">Email:</label>
        {{ text_field("email", "class" : "form-control") }}
    </div>

    <div class="form-group">
        <label for="login">Логин:</label>
        {{ text_field("login", "class" : "form-control") }}
    </div>
    <h4>
        <small>Сообщение с данными для восстановления придет на указанный e-mail</small>
    </h4>

    <div style="margin-top: 2em">
        {{ submit_button("Восстановить", "class" : "btn btn-primary") }}
    </div>

    {{ endForm() }}


</div>