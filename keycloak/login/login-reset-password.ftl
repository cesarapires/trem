<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Redefinir Senha</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="antialiased bg-gray-50">

<div class="grid min-h-screen lg:grid-cols-2">
  <!-- Lado do formulário -->
  <div class="flex flex-col gap-6 p-6 md:p-10">
    
    <!-- Logo -->
    <div class="flex justify-center gap-2 md:justify-start mb-6">
      <div class="font-bold text-lg p-3 rounded-md flex items-center">
        <div class="w-8 h-8 bg-gray-200 rounded-full flex items-center justify-center mr-2 text-lg">T</div>
        T.R.E.M.
      </div>
    </div>

    <!-- Formulário -->
    <div class="flex flex-1 items-center justify-center">
      <div class="w-full max-w-xs">
        
        <!-- Simplificando título e removendo descrição longa -->
        <div class="flex flex-col items-center gap-2 text-center mb-6">
          <h1 class="text-2xl font-bold">Esqueceu sua senha?</h1>
          <p class="text-gray-500 text-sm">Digite seu email para redefinir</p>
        </div>

        <form id="kc-reset-password-form" action="${url.loginAction}" method="post" class="flex flex-col gap-4">
          
          <!-- Email Field -->
          <div class="flex flex-col gap-1">
            <label for="username" class="text-sm font-medium">
              <#if !realm.loginWithEmailAllowed>Nome de usuário<#elseif !realm.registrationEmailAsUsername>Nome de usuário ou email<#else>Email</#if>
            </label>
            <input 
              id="username" 
              name="username" 
              type="text" 
              autocomplete="username" 
              required 
              autofocus
              class="w-full px-3 py-2 border rounded-md bg-white focus:outline-none focus:ring-2 focus:ring-orange-400<#if messagesPerField.existsError('username')> border-red-500</#if>"
              placeholder="seu@email.com"
              value="${(auth.attemptedUsername!'')}"
              aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
              dir="ltr"
            >
            <#if messagesPerField.existsError('username')>
              <span class="text-red-600 text-sm mt-1" aria-live="polite">
                ${kcSanitize(messagesPerField.get('username'))?no_esc}
              </span>
            </#if>
          </div>

          <!-- Submit Button -->
          <button type="submit" class="w-full bg-orange-400 text-white py-2 rounded-md hover:bg-orange-500 transition">
            Enviar email
          </button>

          <!-- Back to Login Link -->
          <div class="text-center text-sm">
            <a href="${url.loginUrl}" class="text-orange-500 hover:text-orange-600 underline">Voltar ao login</a>
          </div>

        </form>

        <!-- Removendo mensagem informativa longa para manter simplicidade -->
      </div>
    </div>
  </div>

  <!-- Lado da imagem -->
  <div class="hidden lg:block relative bg-gray-200">
    <img src="${url.resourcesPath}/login-banner.png" alt="Imagem" class="absolute inset-0 h-full w-full object-cover" />
  </div>

</div>

</body>
</html>
