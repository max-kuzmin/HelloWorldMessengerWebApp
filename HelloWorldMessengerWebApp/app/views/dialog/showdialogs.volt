{% for dialog in dialogs %}
<p>
    {{ link_to("message\showmessages?dialogid="~dialog[0].dialog_id, dialog[0].name)  }}
    ... Пользователи:
    {% for user in dialog[1] %}
    {{ user.name ~ ', '}}
    {% endfor %}

    {{ link_to("dialog\removedialog?dialogid="~dialog[0].dialog_id, 'Удалить')  }}
</p>
{% endfor %}

{{ flash.output() }}