<#import "parts/common.ftlh"as common>
<#import "parts/login.ftlh" as login>

<@common.page>
Страница регистрации
    <@login.login "/login" />
    <a href="/registration">Добавить нового сотрудника</a>
</@common.page>