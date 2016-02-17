{{ image("userinfo/getavatar?login=" ~ user.login) }}

<p>Логин: {{ user.login }}</p>
<p>Email: {{ user.email }}</p>
<p>Имя: {{ user.name }}</p>
<p>Пол: {{ this.genders[user.gender] }}</p>
<p>Страна: {{ this.countries[user.country] }}</p>

{{ link_to("userinfo\editinfo?login=" ~ user.login, "Редактировать") }}

{{ flash.output() }}