<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Логин: </label>
            <div class="col-sm-6">
                <label>
                    <input type="text" name="username" class="form-control" placeholder="User name" />
                </label>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Пароль: </label>
            <div class="col-sm-6">
                <label>
                    <input type="password" name="password" class="form-control" placeholder="Password" />
                </label>
            </div>
        </div>

        <#if isRegisterForm>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Email: </label>
            <div class="col-sm-6">
                <label>
                    <input type="email" name="email" class="form-control" placeholder="some@some.com" />
                </label>
            </div>
        </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <#if !isRegisterForm><a href="/registration">Добавить нового сотрудника</a></#if>
        <button class="btn btn-primary" type="submit">
            <#if isRegisterForm> Create
            <#else> Sign In
            </#if></button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">Sing Out</button>
    </form>
</#macro>