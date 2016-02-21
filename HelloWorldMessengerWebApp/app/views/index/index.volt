<div class="page-header">
    <h1>Congratulations!</h1>
</div>

{% if login %}

{{ link_to("userinfo\showinfo?login=" ~ login, "Моя инфа") }}
{{ link_to("dialog\showdialogs", "Диалоги") }}
{{ link_to("account\logout", "Выход") }}
{{ link_to("search\searchusers", "Поиск") }}
{{ link_to("friends\showfriends", "Друзья") }}

{% else %}

{{ link_to("account\login", "Войти") }}
{{ link_to("account\register", "Зарегистрироваться") }}
{{ link_to("account\forgotpass", "Восстановить") }}

{% endif %}

{{ flash.output() }}