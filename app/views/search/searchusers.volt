<h4 class="brdr-btm" style="padding-bottom: 0.5em; margin-bottom: 1em"><strong>Поиск людей</strong></h4>
<div class="brdr-btm" style="padding-bottom: 1.5em; margin-bottom: 2em">
    {{ form("search/searchusers", 'method': 'get', "class": "form-inline") }}
    <div class="form-group">
        {{ text_field("query", "value": query, "class" : "form-control") }}
    </div>
    {{ submit_button("Поиск", "class" : "btn btn-default") }}
    {{ endForm() }}
</div>

<div id="users_container">
    {{ partial("search/partial") }}
</div>

{% if users %}
<input type="button" class="btn btn-default" value="Показать ещё" style="margin-top: 2em" onclick="loadSearchUsers()">

{% else %}

<h4>
    <small>Ничего не найдено</small>
</h4>
{% endif %}