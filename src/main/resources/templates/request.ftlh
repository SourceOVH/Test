<!DOCTYPE html>
<html>
<head>
    <title>Alliance IT</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #ffffff;
        }

        .container {
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .table-container {
            max-height: 500px;
            overflow-y: auto;
        }
    </style>
</head>
<body>
<div class="container mx-auto py-8 px-4 bg-white">
    <h1 class="text-3xl text-blue font-bold mb-4">Alliance IT</h1>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="bg-red-500 text-white rounded px-4 py-2">
            Выйти из аккаунта
        </button>
    </form>
    <hr class="my-8">
    <h4 class="text-xl font-bold">Товары со всей России</h4>
    <form action="/" method="get" class="mb-4">
        <div class="flex">
            <input type="text" name="title" class="border border-gray-300 px-4 py-2 rounded-l-md" placeholder="Поиск по теме">
            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-r-md">Поиск</button>
        </div>
    </form>
    <div class="table-container">

        <table class="w-full bg-white border border-gray-200 shadow-lg rounded-lg">
            <thead>
            <tr>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Время создания заявки</th>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Описание</th>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Тема</th>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Статус</th>
                <th class="border-b-2 bg-gray-100 px-4 py-2">Действие</th>
            </tr>
            </thead>
            <tbody>
            <#if requests?size == 0>
                <tr>
                    <td class="border px-4 py-2" colspan="5">Заявок нет</td>
                </tr>
            <#else>
                <#list requests as request>
                    <tr class="<#if (request?index % 2 == 0)>bg-gray-100</#if>">
                        <td class="border px-4 py-2">${request.dateOfCreated}</td>
                        <td class="border px-4 py-2">${request.description}</td>
                        <td class="border px-4 py-2">${request.title}</td>
                        <td class="border px-4 py-2">${request.status.name}</td>
                        <td class="border px-4 py-2">
                            <#if request.status.id == 1>
                                <form action="/request/delete/${request.id}" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <input type="hidden" name="_method" value="DELETE">
                                    <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded">
                                        Удалить заявку
                                    </button>
                                </form>
                            <#else>
                                Удалить не получится
                            </#if>
                        </td>
                    </tr>
                </#list>
            </#if>
            </tbody>
        </table>




    </div>
    <hr class="my-8">
    <h3 class="text-2xl font-bold mb-4">Создать новый товар</h3>
    <form action="/request/create" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
        <div class="mb-4">
            <label for="title" class="block">Тема заявки:</label>
            <input type="text" name="title" id="title" class="border border-gray-300 px-4 py-2 rounded">
            <span id="titleError" class="text-red-500"></span>
        </div>
        <div class="mb-4">
            <label for="description" class="block">Описание заявки:</label>
            <input type="text" name="description" id="description" class="border border-gray-300 px-4 py-2 rounded">
            <span id="descriptionError" class="text-red-500"></span>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить заявку" class="bg-green-500 text-white px-4 py-2 rounded">
    </form>

    <script>
        function validateForm() {
            var title = document.getElementById("title").value;
            var description = document.getElementById("description").value;

            if (title === "" || description === "") {
                document.getElementById("titleError").textContent = "Тема заявки и описание заявки не могут быть пустыми";
                document.getElementById("descriptionError").textContent = "Тема заявки и описание заявки не могут быть пустыми";
                return false;
            }

            return true;
        }
    </script>
</div>
</body>
</html>
