<div class="page-header">
    <h1>Congratulations!</h1>
</div>

<p>You're now flying with Phalcon. Great things are about to happen!</p>

<p>This page is located at <code>views/index/index.volt</code></p>


Бла бла бла, главная страница

{{ link_to("accounts\login", "Войти") }}

{{ link_to("accounts\register", "Зарегистрироваться") }}

{{ flash.output() }}