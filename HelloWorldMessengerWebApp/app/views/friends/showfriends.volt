
{% if friends %}
{% for friend in friends %}
<p>
    {{ image("userinfo\getavatar?login=" ~ friend[0].login) }}
    {{ link_to("userinfo\showinfo?login="~friend[0].login, friend[0].name)  }}
    {% if not friend[1] %}
        {{ link_to("friends\addfriend?login="~friend[0].login, "Добавить в друзья")  }}
    {% endif %}
    {{ link_to("friends\removefriend?login="~friend[0].login, "Удалить")  }}
</p>
{% endfor %}

{% endif %}

{{ flash.output() }}