<!DOCTYPE html>
<html>
<head>
    <title>Alliance IT</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="flex items-center justify-center h-screen bg-gray-100">
<div class="max-w-md p-6 bg-white rounded-lg shadow-md">
    <h1 class="text-2xl font-bold mb-4">Alliance IT</h1>
    <hr class="my-4">
    <h3 class="text-lg font-semibold mb-2">Редактирование пользователя ${user.name}</h3>
    <form action="/admin/user/edit" method="post">
        <div class="mb-4">
            <#list roles as role>
                <label class="inline-flex items-center">
                    <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")} class="form-checkbox h-5 w-5 text-blue-500">
                    <span class="ml-2 text-gray-700">${role}</span>
                </label>
            </#list>
        </div>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">Сохранить</button>
    </form>
</div>
</body>
</html>
