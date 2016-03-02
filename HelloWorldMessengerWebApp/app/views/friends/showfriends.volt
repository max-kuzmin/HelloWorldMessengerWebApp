<h4 class="brdr-btm" style="padding-bottom: 0.5em; margin-bottom: 2em"><strong>Мои друзья</strong></h4>
{% if friends %}
{% for friend in friends %}


<div class="row {% if not friend[1] %} bg-warning {% endif %}" style="margin-top: 1em">
    <div class="col-lg-1">
        <a href="{{ url.get('userinfo/showinfo?login='~friend[0].login) }}">
            {{ image("userinfo/getavatar?login=" ~ friend[0].login, "class": "img-rounded img-responsive imgsmall") }}
        </a>
    </div>
    <div class="col-lg-8">
        {{ link_to("userinfo/showinfo?login="~friend[0].login, friend[0].name) }}
        {% if not friend[1] %}
        <h5 style="child-align: middle">
            <small>Пользователь добавил вас в друзья</small>
        </h5>
        {% endif %}
    </div>
</div>
<div class="row">
    <div class="col-lg-4 brdr-btm" style="padding-bottom: 1em"></div>
</div>
{% endfor %}

{% else %}

<h4>
    <small>У вас нет друзей :(</small>
</h4>
{% endif %}
