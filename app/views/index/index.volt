<div class="page-header">
    <h1>Congratulations!</h1>
</div>

<p>You're now flying with Phalcon. Great things are about to happen!</p>

<p>This page is located at <code>views/index/index.volt</code></p>

{% if login %}

{{ link_to("userinfo\showinfo?login=" ~ login, "Моя инфа") }}

{% else %}

{{ link_to("account\login", "Войти") }}
{{ link_to("account\register", "Зарегистрироваться") }}

{% endif %}

{{ flash.output() }}