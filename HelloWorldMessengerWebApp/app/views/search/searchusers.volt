{{ form("search/searchusers") }}
{{ text_field("query") }}
{{ submit_button("Поиск") }}
{{ endForm() }}

{% if users %}
{% for user in users %}
<p>
    {{ image("userinfo\getavatar?login=" ~ user.login) }}
    {{ link_to("userinfo\showinfo?login="~user.login, user.name)  }}
</p>
{% endfor %}

{% endif %}

{{ flash.output() }}