
{{ image("userinfo/getavatar?login=" ~ user.login) }}


<p>Логин: {{ user.login }}</p>
<p>Имя: {{ user.name }}</p>
<p>Пол: {{ this.genders[user.gender] }}</p>
<p>Страна: {{ this.countries[user.country] }}</p>

{{ flash.output() }}