<!DOCTYPE html>
<html>
<head>
    <title>Alliance IT</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
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
<div class="container">
    <div class="card">
        <h1 class="text-3xl text-blue font-bold mb-4">Alliance IT</h1>
        <hr class="mb-4">
        <h4 class="text-xl font-bold mb-4">Регистрация</h4>
        <div class="error-message">
            <#if errorMessage?has_content>
                <p>${errorMessage}</p>
            </#if>
        </div>
    <form action="/registration" method="post">
        <div class="mb-4">
            <label class="block">Имя пользователя:</label>
            <input type="text" name="name" required class="border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-blue-500 focus:border-blue-500 w-full" />
        </div>
        <div class="mb-4">
            <label class="block">Эл. почта:</label>
            <input type="email" name="email" required class="border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-blue-500 focus:border-blue-500 w-full" />
        </div>
        <div class="mb-4">
            <label class="block">Номер телефона:</label>
            <input type="text" name="numberPhone" required pattern="\+7[0-9]{10}" class="border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-blue-500 focus:border-blue-500 w-full" />
            <small class="text-gray-500">Формат номера: +79182342333</small>
        </div>
        <div class="mb-4">
            <label class="block">Пароль:</label>
            <input type="password" name="password" required minlength="6" maxlength="64" pattern="[a-zA-Z0-9]+" class="border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-blue-500 focus:border-blue-500 w-full" />
            <small class="text-gray-500">Минимум 6 символов (латинские буквы и цифры)</small>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">Зарегестрироваться</button>
    </form>
    </div>
</div>
<script>
    // Проверка номера телефона
    const phoneNumberInput = document.querySelector('input[name="numberPhone"]');
    phoneNumberInput.addEventListener('input', () => {
        phoneNumberInput.setCustomValidity('');
        if (!phoneNumberInput.validity.patternMismatch && !phoneNumberInput.value.startsWith('+7')) {
            phoneNumberInput.setCustomValidity('Номер телефона должен начинаться с +7');
        }
    });

    // Проверка пароля
    const passwordInput = document.querySelector('input[name="password"]');
    passwordInput.addEventListener('input', () => {
        passwordInput.setCustomValidity('');
        if (passwordInput.validity.tooShort) {
            passwordInput.setCustomValidity('Минимум 6 символов');
        }
        if (passwordInput.validity.tooLong) {
            passwordInput.setCustomValidity('Максимум 64 символа');
        }
        if (!passwordInput.validity.patternMismatch && !passwordInput.value.match(/[a-zA-Z0-9]+/)) {
            passwordInput.setCustomValidity('Пароль может содержать только латинские буквы и цифры');
        }
    });
</script>
</body>
</html>
