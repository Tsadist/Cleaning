<#import "parts/common.ftlh" as common>
<#import "parts/login.ftlh" as login>

<@common.page>
<div>
    <@login.logout />
    <span><a href="/user">Список пользователей</a></span>
</div>
<div>
    <form method="post" enctype="multipart/form-data">
        <input type="text" name="name" placeholder="Имя"/>
        <input type="text" name="tag" placeholder="Год рождения" />
        <input type="file" name="file" />
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit">Добавить</button>
    </form>
</div>
<div>Список сотрудников</div>
<form method="get" action="/main">
    <input type="text" name="filter" value="${filter?ifExists}">
    <button type="submit">Найти сотрудника</button>
</form>
<#list messages as message>
<div>
    <b>${message.id}</b>
    <span>${message.name}</span>
    <i>${message.tag}</i>
    <strong>${message.authorName}</strong>
    <div>
        <#if message.filename??>
            <img src="/img/${message.filename}">
        </#if>
    </div>
</div>
<#else>
    Список пуст
</#list>
</@common.page>