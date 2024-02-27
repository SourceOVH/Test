<!DOCTYPE html>
<html>
<head>
    <title>Система управления заявками</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
<header class="py-4">
    <h1 class="text-3xl text-blue-500 font-bold text-center">Система управления заявками</h1>
</header>

<main class="max-w-md mx-auto p-6 bg-white rounded-lg shadow-md">
    <div>
        <b class="block mb-2">Название:</b>
        <p class="mb-4">${request.title}</p>
        <b class="block mb-2">Описание:</b>
        <p class="mb-4">${request.description}</p>
        <b class="block mb-2">Автор:</b>
        <p class="mb-4">${request.user.name}</p>
    </div>

    <form action="/request/delete/${request.id}" method="post">
        <button type="submit" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
            Удалить Заявку
        </button>
    </form>

    <a href="/" class="block text-center mt-4 underline text-blue-500">Вернуться обратно</a>
</main>

</body>
</html>
