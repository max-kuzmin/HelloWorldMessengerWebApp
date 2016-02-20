{% for message in messages %}
<p>
    {{ message.login ~ ": " ~ message.text  }}
    {{ image("message/showimage?messageid="~message.message_id)  }}
</p>
{% endfor %}

{{ form("message/addmessage", "enctype":"multipart/form-data") }}
{{ hidden_field("dialogid", "value": dialogid) }}
<input type="file" name="image">
{{ text_area("text", "rows" : 10) }}
{{ submit_button("Отправить") }}

{{ endForm() }}

{{ flash.output() }}