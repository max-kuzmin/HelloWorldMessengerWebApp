{% if users %}
{% for user in users %}
 <div class="row" style="margin-top: 1em;">
        <div class="col-lg-1">
            <a href="{{ url.get('userinfo\showinfo?login='~user['login']) }}">
                {{ image("userinfo\getavatar?login=" ~ user['login'], "class": "img-rounded img-responsive imgsmall") }}
            </a>
        </div>
        <div class="col-lg-8">
            {{ link_to("userinfo\showinfo?login="~user['login'], user['name'])  }}
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4 brdr-btm" style="padding-bottom: 1em"></div>
    </div>

{% endfor %}
{% endif %}