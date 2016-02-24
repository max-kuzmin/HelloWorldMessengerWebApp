<h4 class="brdr-btm" style="padding-bottom: 0.5em; margin-bottom: 2em"><strong>Мои диалоги</strong></h4>
{% if dialogs %}
{% for dialog in dialogs %}


<div class="row {% if dialog[2] %} bg-warning {% endif %}" style="margin-top: 1em">
    <div class="col-lg-1">
        <a href="{{ url.get('message\showmessages?dialogid='~dialog[0].dialog_id) }}">
            {{ image("userinfo\getavatar?login=" ~ dialog[1][0].login, "class": "img-rounded img-responsive imgsmall")
            }}
        </a>
    </div>
    <div class="col-lg-4">
        {{ link_to("message\showmessages?dialogid="~dialog[0].dialog_id, dialog[0].name) }}
        {% if dialog[2] %}
        <small class="text-muted" style="margin-left: 1em">Новые сообщения</small>
        {% endif %}

        {% for user in dialog[1] %}
        <div class="text-muted">
            <small>{{ user.name }}</small>
        </div>
        {% endfor %}

    </div>
    <div class="col-lg-2">
        <small class="text-muted" style="margin-left: 1em">{{ date('d-m-Y H:i:s', dialog[0].time) }}</small>
    </div>
</div>
<div class="row">
    <div class="col-lg-7 brdr-btm" style="padding-bottom: 1em"></div>
</div>
{% endfor %}

{% endif %}