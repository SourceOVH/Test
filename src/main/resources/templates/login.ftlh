<!DOCTYPE html>
<html>
<head>
    <title>Alliance IT</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .bg-blue {
            background-color: #3490dc;
        }
        .text-blue {
            color: #3490dc;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .card {
            width: 400px;
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card">
        <h1 class="text-3xl text-blue font-bold mb-4">Alliance IT</h1>
        <hr class="mb-4">
        <h4 class="text-xl font-bold mb-4">Авторизация</h4>
        <div class="error-message">
            <#if errorMessage?has_content>
                <p>${errorMessage}</p>
            </#if>
        </div>

        <form action="/login" method="post" class="mb-4">
            <div class="mb-4">
                <label for="username" class="block text-gray-700">Эл. почта:</label>
                <input type="email" id="username" name="username" class="border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-blue-500 focus:border-blue-500 w-full" required>
            </div>
            <div class="mb-4">
                <label for="password" class="block text-gray-700">Пароль:</label>
                <input type="password" id="password" name="password" class="border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-blue-500 focus:border-blue-500 w-full" required>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Вход" class="bg-blue text-white py-2 px-4 rounded-md cursor-pointer w-full">
        </form>
        <a href="/registration" class="text-blue">Зарегистрироваться</a>
    </div>
</div>
</body>
</html>
