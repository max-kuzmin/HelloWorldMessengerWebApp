
{{ image("userinfo/getavatar?login=" ~ user.login) }}


<p>Логин: {{ user.login }}</p>
<p>Имя: {{ user.name }}</p>
<p>Пол: {{ user.gender }}</p>
<p>Страна: {{ user.country }}</p>

{{ flash.output() }}