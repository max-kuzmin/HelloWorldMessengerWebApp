{% for message in messages %}
<p>
    {{ message.login ~ ": " ~ message.text  }}
</p>
{% endfor %}

{{ form("message/addmessage") }}
{{ hidden_field("dialogid", "value": message.dialog_id) }}
{{ text_area("text", "rows" : 10) }}
{{ submit_button("Отправить") }}

{{ endForm() }}

{{ flash.output() }}