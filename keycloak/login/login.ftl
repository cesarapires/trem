<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Login</title>
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
        <form action="${url.loginAction}" id="kc-form-login" method="post" class="flex flex-col gap-6" onsubmit="login.disabled = true; return true;">

          <!-- Título -->
          <div class="flex flex-col items-center gap-2 text-center">
            <h1 class="text-2xl font-bold">${msg("loginAccountTitle")}</h1>
            <p class="text-gray-500 text-sm">${msg("loginAccountSubtitle")}</p>
          </div>

          <!-- Campos -->
          <div class="flex flex-col gap-4">
            
            <!-- Email -->
            <div class="flex flex-col gap-1">
              <label for="username" class="text-sm font-medium"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
              <input type="text" id="username" name="username" placeholder="m@example.com" required
                     autocomplete="off"
                     value="${(login.username!'')}"
                     aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                     class="w-full px-3 py-2 border rounded-md bg-white focus:outline-none focus:ring-2 focus:ring-orange-400<#if messagesPerField.existsError('username','password')> border-red-500</#if>" />
              
              <!-- Adicionando exibição de erro para o campo username -->
              <#if messagesPerField.existsError('username','password')>
                <span id="input-error-username" class="text-red-600 text-sm mt-1" aria-live="polite">
                  ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                </span>
              </#if>
            </div>

            <!-- Senha -->
            <div class="flex flex-col gap-1">
              <div class="flex items-center justify-between">
                <label for="password" class="text-sm font-medium">${msg("password")}</label>
                <#if realm.resetPasswordAllowed>
                  <a class="text-sm text-orange-500 hover:underline" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                </#if>
              </div>
              <input type="password" id="password" name="password" required
                     autocomplete="off"
                     aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                     class="w-full px-3 py-2 border rounded-md bg-white focus:outline-none focus:ring-2 focus:ring-orange-400<#if messagesPerField.existsError('username','password')> border-red-500</#if>" />
              
              <!-- Adicionando exibição de erro para o campo password quando username está oculto -->
              <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                <span id="input-error-password" class="text-red-600 text-sm mt-1" aria-live="polite">
                  ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                </span>
              </#if>
            </div>

            <div class="flex items-center justify-between">
              <label class="flex items-center text-gray-600 text-sm">
              <#if realm.rememberMe && !usernameHidden??>
                <#if login.rememberMe??>
                    <input class="mr-2"id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                <#else>
                    <input class="mr-2" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                </#if>
              </label>
              </#if>
            </div>

            <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>

            <!-- Botão -->
            <button type="submit"
                    class="w-full bg-orange-400 text-white py-2 rounded-md hover:bg-orange-500 transition">
              ${msg("doLogIn")}
            </button>

          </div>

          <!-- Cadastro -->
          <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div class="text-center text-sm mt-2">
              ${msg("noAccount")} 
              <a href="${url.registrationUrl}" id="kc-register" class="text-orange-500 hover:text-orange-600 hover:underline">${msg("doRegister")}</a>
            </div>
          </#if>

        </form>
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
