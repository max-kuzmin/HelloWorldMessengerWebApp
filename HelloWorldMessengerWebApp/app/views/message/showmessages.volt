<h4 class="brdr-btm" style="padding-bottom: 0.5em; margin-bottom: 1em"><strong>{{dialog.name}}</strong></h4>

<div style="margin-bottom: 1em; text-align: right">
    {{ link_to("dialog\removedialog?dialogid="~dialog.dialog_id, "Удалить диалог", "class" : "btn btn-default btn-xs") }}
    <button class="btn btn-default btn-xs" style="margin-left: 1em" onclick="$('#editname').show()">
        Переименовать диалог
    </button>
    <button class="btn btn-default btn-xs" style="margin-left: 1em" onclick="$('#adduser').show()">
        Добавить пользователя
    </button>

</div>



<div class="panel panel-default" id="editname" hidden>
    <div class="panel-body">
        <button type="button" class="close" onclick="$('#editname').hide()">
            <span aria-hidden="true">&times;</span>
        </button>
        <form class="form-inline" method="get" action="{{ url.get('dialog\renamedialog') }}">
            <input type="text" name="name" class="form-control" placeholder="Введите новое название">
            {{ hidden_field("dialogid", "value": dialog.dialog_id) }}
            <input type="submit" class="form-control" value="Переименовать">
        </form>

    </div>
</div>



<div class="panel panel-default" id="adduser" hidden>
    <div class="panel-body">
        <button type="button" class="close" onclick="$('#adduser').hide()">
            <span aria-hidden="true">&times;</span>
        </button>

        <form class="form-inline" method="get" action="{{ url.get('dialog\addusertodialog') }}">
            <input type="text" name="login" class="form-control" placeholder="Введите логин">
            {{ hidden_field("dialogid", "value": dialog.dialog_id) }}
            <input type="submit" class="form-control" value="Добавить в диалог">
        </form>
    </div>
</div>

загрузить до времени
загрузить после времени
отправить асинхронно

{% for message in messages %}
<p>
    {{ message.login ~ ": " ~ message.text }}
    {{ image("message/showimage?messageid="~message.message_id) }}
</p>
{% endfor %}

{{ form("message/addmessage", "enctype":"multipart/form-data") }}
{{ hidden_field("dialogid", "value": dialog.dialog_id) }}
<input type="file" name="image">
{{ text_area("text", "rows" : 10) }}
{{ submit_button("Отправить") }}

{{ endForm() }}
