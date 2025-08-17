<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Login - Meu App</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="login-container">
        <h1>Bem-vindo ao Meu App</h1>
        <form action="${url.loginAction}" method="post">
            <input type="text" name="username" placeholder="Usuário" required>
            <input type="password" name="password" placeholder="Senha" required>
            <button type="submit">Entrar</button>
        </form>
        <#if message!=null>
            <div class="error">${message.summary!}</div>
        </#if>
    </div>
</body>
</html>
