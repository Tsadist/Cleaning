<#import "parts/common.ftlh" as common>
<#import "parts/login.ftlh" as login>

<@common.page>
<div class="mb-1"> Добавить нового сотрудника</div>
    ${message!}
    <@login.login "/registration" true/>
</@common.page>