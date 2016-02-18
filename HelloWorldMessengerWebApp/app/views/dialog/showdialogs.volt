{% for dialog in dialogs %}
<p>
    {{ link_to("message\showmessages?dialogid="~dialog.dialog_id, dialog.name)  }}
</p>
{% endfor %}

{{ flash.output() }}