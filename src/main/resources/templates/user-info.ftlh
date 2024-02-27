<!DOCTYPE html>
<html>
<head>
    <title>Alliance IT</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
<div class="max-w-xl mx-auto p-6 bg-white rounded-lg shadow-md">
    <h1 class="text-3xl text-blue-500 font-bold mb-4"><a href="/">Alliance IT</a></h1>
    <hr class="my-4">
    <h3 class="text-xl font-semibold mb-2">Подробная информация о пользователе ${user.name}</h3>
    <b class="block mb-2">Номер телефона:</b>
    <p class="mb-4">${user.numberPhone}</p>
    <b class="block mb-2">Email:</b>
    <p class="mb-4">${user.email}</p>
    <h4 class="text-lg font-semibold mb-2">Заявки пользователя ${user.name}</h4>
    <table class="w-full bg-white border border-gray-200 rounded-lg">
        <tbody>
        <#list requests as request>
            <tr class="<#if (request?index % 2 == 0)>bg-gray-100<#else>bg-gray-200</#if>">
                <td class="border px-4 py-2"><b>${request.title}</b></td>
                <td class="border px-4 py-2">${request.description} руб.</td>
                <td class="border px-4 py-2"><a href="/request/${request.id}" class="text-blue-500">Подробнее...</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
    <#if requests?size == 0>
        <h3 class="text-lg mt-4">Товаров нет</h3>
    </#if>
</div>
</body>
</html>
