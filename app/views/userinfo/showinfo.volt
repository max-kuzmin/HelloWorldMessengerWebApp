
{{ image("userinfo/getavatar?login=" ~ user.login) }}


<p>Логин: {{ user.login }}</p>
<p>Имя: {{ user.name }}</p>
<p>Пол: {{ this.genders[user.gender] }}</p>
<p>Страна: {{ this.countries[user.country] }}</p>

{% if fullfriend %}
{{ link_to("dialog\createdialog?login="~user.login, "Создать диалог")  }}
{% endif %}
{% if not halffriend %}
{{ link_to("friends\addfriend?login="~user.login, "Добавить в друзья")  }}
{% endif %}


{{ flash.output() }}