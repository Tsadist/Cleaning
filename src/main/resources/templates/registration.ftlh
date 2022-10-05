<#import "parts/common.ftlh" as common>
<#import "parts/login.ftlh" as login>

<@common.page>
Добавить новго сотрудника
${message?if_exists}
<@login.login "/registration"/>
</@common.page>