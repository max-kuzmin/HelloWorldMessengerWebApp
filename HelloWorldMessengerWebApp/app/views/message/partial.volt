{% for message in messages %}
<div class=" message panel panel-default
"
     style="padding: 0.5em; margin-bottom: 0.25em; margin-top: 0.25em;
     {% if message['login'] != session.get('auth')['login'] %} margin-left: 5em; {% else %} margin-right: 5em; {% endif %}
     {% if new == true %} background-color: #fcf8e3 {% endif %}">

    <div class="text-muted small row">
        <div class="col-lg-8">
            <a href="{{url.get(" userinfo/showinfo?login="~message['login'])}}" class="text-muted">
            {{ names[message['login']] ~ ":" }}
            </a>
        </div>
        <div class="col-lg-4" style="text-align: right; padding-right: 3em">
            {{ date('d-m-Y H:i:s', message['time']) }}
        </div>
    </div>

    <div class="row">
        <div class="col-lg-10" style="margin-left: 0.5em">
            {{ message['text'] }}

            <div style="margin: 0.5em">
                {% if images[message['message_id']] == true %}
                <a href="{{url.get(" message/showimage?messageid="~message['message_id'])}}">
                {{ image("message/showimage?messageid="~message['message_id'], "class": "img-rounded img-responsive
                imgsmall") }}
                </a>
                {% endif %}
            </div>
        </div>

    </div>


    <input type="hidden" value="{{message['time']}}">
</div>

{% endfor %}