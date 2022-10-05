<#import "parts/common.ftlh" as common>

<@common.page>
List of users

<table>
    <thead>
    <tr>
        <th>Имя</th>
        <th>Роль</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <#list users as user>
        <tr>
            <td>${user.username}</td>
            <td><#list  user.roles as role>${role}<#sep>, </#list></td>
            <td><a href="/user/${user.id}">edit</a></td>
        </tr>
    </#list>
    </tbody>
</table>
</@common.page>