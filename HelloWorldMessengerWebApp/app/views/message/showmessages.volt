<h4 class="brdr-btm" style="padding-bottom: 0.5em; margin-bottom: 1em"><strong>{{dialog.name}}</strong></h4>


<div style="margin-bottom: 1em; text-align: right">
    <button onclick="loadPrevMessages()" class="btn btn-default btn-xs" id="loadmore" style="margin-right: 1em;">
        Загрузить предыдущие сообшения
    </button>
    {{ link_to("dialog\removedialog?dialogid="~dialog.dialog_id, "Удалить диалог", "class" : "btn btn-default btn-xs")
    }}
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

<div id="messages_container" class="panel panel-default"
     style="background-color: #f5f5f5; padding: 1em; max-height: 350px; overflow-y: scroll">
    {{ partial("message/partial") }}
</div>

{{ form("message/addmessage", "id": "sendmessage", "enctype":"multipart/form-data") }}

{{ hidden_field("dialogid", "value": dialog.dialog_id) }}

<div>
    {{ text_area("text", "rows" : 5, "class" : "form-control", "placeholder" : "Введите сообщение ... ") }}
</div>
<div style="margin-top: 0.5em">
    <input type="file" name="image" id="image" class="form-control">
</div>
<div style="margin-top: 1em">
    {{ submit_button("Отправить", "class" : "btn btn-primary", "style" : "width:20%") }}
</div>

{{ endForm() }}
