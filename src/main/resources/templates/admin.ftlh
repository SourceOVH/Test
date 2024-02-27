<!DOCTYPE html>
<html>
<head>
    <title>Alliance IT</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.15/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #fff;
        }

        .table-row-even {
            background-color: #edf2f7;
        }

        .table-row-odd {
            background-color: #f7fafc;
        }
    </style>
</head>
<body>
<div class="container mx-auto px-4 py-8">
    <h1 class="text-3xl text-blue-500 font-bold mb-4"><a href="/">Alliance IT</a></h1>
    <hr class="my-4">
    <h4 class="text-lg font-bold mb-4">Панель администратора</h4>
    <div class="overflow-x-auto">
        <table class="w-full bg-white border border-gray-200 shadow-md rounded-lg overflow-hidden">
            <thead>
            <tr>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Email</th>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Номер телефона</th>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Активность</th>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Роли</th>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Бан</th>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Редактирование</th>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Подробная информация</th>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Удалить пользователя</th>
            </tr>
            </thead>
            <tbody>
            <#list users as user>
                <tr class="table-row-even">
                    <td class="border px-4 py-2">${user.email}</td>
                    <td class="border px-4 py-2">${user.numberPhone}</td>
                    <td class="border px-4 py-2"><#if user.active>Активен<#else>Неактивен</#if></td>
                    <td class="border px-4 py-2">
                        <ul class="list-disc list-inside">
                            <#list user.roles as role>
                                <li>${role}</li>
                            </#list>
                        </ul>
                    </td>
                    <td class="border px-4 py-2">
                        <form action="/admin/user/ban/${user.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded">
                                Бан
                            </button>
                        </form>
                    </td>
                    <td class="border px-4 py-2">
                        <a href="/admin/user/edit/${user.id}" class="text-blue-500">Изменить</a>
                    </td>
                    <td class="border px-4 py-2">
                        <a href="/user/${user.id}" class="text-blue-500">Подробно</a>
                    </td>
                    <td class="border px-4 py-2">
                        <form action="/user/delete/${user.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input type="hidden" name="_method" value="DELETE">
                            <input type="submit" value="Удалить" class="bg-red-500 text-white px-4 py-2 rounded">
                        </form>
                    </td>
                </tr>
                <#if user_index == 4>
                    <#break>
                </#if>
            </#list>
            <#if users?size == 0>
                <tr>
                    <td class="border px-4 py-2" colspan="8"><h3 class="text-lg">Пользователей нет</h3></td>
                </tr>
            </#if>
            </tbody>
        </table>
    </div>
    <hr class="my-4">
    <h4 class="text-lg font-bold mb-4">Список заявок</h4>
    <div class="overflow-x-auto">
        <table class="w-full bg-white border border-gray-200 shadow-lg rounded-lg">
            <colgroup>
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 25%;">
                <col style="width: 20%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
            </colgroup>
            <thead>
            <tr>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Время создания заявки</th>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Имя</th>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Номер</th>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Описание</th>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Тема</th>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Статус</th>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Удалить заявку</th>
            </tr>
            </thead>
            <tbody>
            <#if requests?size == 0>
                <tr>
                    <td class="border px-4 py-2" colspan="7">По вашему запросу ничего не найдено</td>
                </tr>
            <#else>
                <#list requests as request>
                    <tr class="<#if (request?index % 2 == 0)>bg-gray-100</#if>">
                        <td class="border px-4 py-2">${request.dateOfCreated}</td>
                        <td class="border px-4 py-2">${request.user.name}</td>
                        <td class="border px-4 py-2">${request.user.numberPhone}</td>
                        <td class="border px-4 py-2">${request.description}</td>
                        <td class="border px-4 py-2">${request.title}</td>
                        <td class="border px-4 py-2">
                            <form action="/admin/request/updateStatus/${request.id}" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <div class="flex items-center">
                                    <select name="statusId" class="block w-full border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 mr-2">
                                        <option value="1" <#if request.status.id == 1>selected</#if>>На рассмотрении</option>
                                        <option value="2" <#if request.status.id == 2>selected</#if>>Рассмотрено</option>
                                        <option value="3" <#if request.status.id == 3>selected</#if>>Архив</option>
                                    </select>
                                    <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">
                                        Изменить статус
                                    </button>
                                </div>
                            </form>
                        </td>
                        <td class="border px-4 py-2">
                            <form action="/admin/request/delete/${request.id}" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded">
                                    Удалить
                                </button>
                            </form>
                        </td>
                    </tr>
                </#list>
            </#if>
            </tbody>
        </table>


    </div>
</div>
</body>
</html>
