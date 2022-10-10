<#import "parts/common.ftlh" as common>

<@common.page>

<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" value="${filter?ifExists}" placeholder="Search by year">
            <button type="submit" class="btn btn-primary ml-2">Найти сотрудника</button>
        </form>
    </div>
</div>

<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Добавить новое сообщение
</a>

<div class="collapse" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control" name="name" placeholder="Имя"/>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="tag" placeholder="Год рождения"/>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Добавить</button>
            </div>
        </form>
    </div>
</div>

<div class="card-columns">
    <#list messages as message>
    <div class="card my-3">
        <#if message.filename??>
            <img src="/img/${message.filename}" class="card-img-top">
        </#if>

        <div class="m-2">
            <span>${message.name}</span>
            <i>${message.tag}</i>
        </div>

        <div class="card-footer text-muted">
            ${message.authorName}
        </div>
    </div>
    <#else>
        Список пуст
    </#list>
</div>
</@common.page>