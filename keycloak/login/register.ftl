<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar Conta</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-slate-50 flex flex-col items-center justify-center p-4 font-sans">
    <!-- Logo -->
    <div class="mb-5 flex justify-center">
        <div class="font-bold text-lg p-3 rounded-md flex items-center">
            <div class="w-8 h-8 bg-gray-300 rounded-full flex items-center justify-center mr-2 text-lg">T</div>
            T.R.E.M.
        </div>
    </div>

    <!-- Card -->
    <div class="bg-white rounded-lg shadow-sm w-full max-w-sm">
        <!-- Header -->
        <div class="pt-5 px-6 pb-0 text-center mb-5">
            <h1 class="text-xl font-bold text-slate-900 mb-1.5">
                <#if messageHeader??>
                    ${ kcSanitize(msg("${messageHeader}"))?no_esc }
                <#else>
                    ${ msg("registerTitle") }
                </#if>
            </h1>
            <p class="text-slate-500 text-sm">${ msg("registerAccountSubtitle") }</p>
        </div>
        
        <!-- Content -->
        <div class="px-6 pb-5">
            <#if messagesPerField.existsError('global')>
                <div class="bg-red-50 border border-red-200 rounded-md p-2.5 mb-3 text-red-600 text-sm">
                    ${kcSanitize(messagesPerField.getFirstError('global'))?no_esc}
                </div>
            </#if>

            <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post" novalidate="novalidate">
                <!-- Nome e Sobrenome -->
                <div class="grid grid-cols-2 gap-3 mb-3">
                    <div>
                        <label for="firstName" class="block text-sm font-medium text-slate-900 mb-1.5">Nome</label>
                        <input 
                            id="firstName" 
                            name="firstName" 
                            type="text" 
                            autocomplete="given-name" 
                            required 
                            class="w-full px-3 py-2 border border-gray-300 rounded-md text-sm transition-colors focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-100 bg-white ${messagesPerField.existsError('firstName')?then('border-red-600 focus:border-red-600 focus:ring-red-100', '')}"
                            placeholder="Seu nome"
                            value="${(register.formData.firstName!'')}"
                            aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                        >
                        <#if messagesPerField.existsError('firstName')>
                            <span class="text-red-600 text-xs mt-1 block">
                                ${kcSanitize(messagesPerField.getFirstError('firstName'))?no_esc}
                            </span>
                        </#if>
                    </div>
                    <div>
                        <label for="lastName" class="block text-sm font-medium text-slate-900 mb-1.5">Sobrenome</label>
                        <input 
                            id="lastName" 
                            name="lastName" 
                            type="text" 
                            autocomplete="family-name" 
                            required 
                            class="w-full px-3 py-2 border border-gray-300 rounded-md text-sm transition-colors focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-100 bg-white ${messagesPerField.existsError('lastName')?then('border-red-600 focus:border-red-600 focus:ring-red-100', '')}"
                            placeholder="Seu sobrenome"
                            value="${(register.formData.lastName!'')}"
                            aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                        >
                        <#if messagesPerField.existsError('lastName')>
                            <span class="text-red-600 text-xs mt-1 block">
                                ${kcSanitize(messagesPerField.getFirstError('lastName'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>

                <!-- Email -->
                <div class="mb-3">
                    <label for="email" class="block text-sm font-medium text-slate-900 mb-1.5">Email</label>
                    <input 
                        id="email" 
                        name="email" 
                        type="email" 
                        autocomplete="email" 
                        required 
                        class="w-full px-3 py-2 border border-gray-300 rounded-md text-sm transition-colors focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-100 bg-white ${messagesPerField.existsError('email')?then('border-red-600 focus:border-red-600 focus:ring-red-100', '')}"
                        placeholder="seu@email.com"
                        value="${(register.formData.email!'')}"
                        aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                    >
                    <#if messagesPerField.existsError('email')>
                        <span class="text-red-600 text-xs mt-1 block">
                            ${kcSanitize(messagesPerField.getFirstError('email'))?no_esc}
                        </span>
                    </#if>
                </div>

                <!-- Username (se necessário) -->
                <#if !realm.registrationEmailAsUsername>
                <div class="mb-3">
                    <label for="username" class="block text-sm font-medium text-slate-900 mb-1.5">Nome de usuário</label>
                    <input 
                        id="username" 
                        name="username" 
                        type="text" 
                        autocomplete="username" 
                        required 
                        class="w-full px-3 py-2 border border-gray-300 rounded-md text-sm transition-colors focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-100 bg-white ${messagesPerField.existsError('username')?then('border-red-600 focus:border-red-600 focus:ring-red-100', '')}"
                        placeholder="Seu nome de usuário"
                        value="${(register.formData.username!'')}"
                        aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                    >
                    <#if messagesPerField.existsError('username')>
                        <span class="text-red-600 text-xs mt-1 block">
                            ${kcSanitize(messagesPerField.getFirstError('username'))?no_esc}
                        </span>
                    </#if>
                </div>
                </#if>

                <!-- Senha -->
                <div class="mb-3">
                    <label for="password" class="block text-sm font-medium text-slate-900 mb-1.5">Senha</label>
                    <div class="relative">
                        <input 
                            id="password" 
                            name="password" 
                            type="password" 
                            autocomplete="new-password" 
                            required 
                            class="w-full px-3 py-2 border border-gray-300 rounded-md text-sm transition-colors focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-100 bg-white ${messagesPerField.existsError('password')?then('border-red-600 focus:border-red-600 focus:ring-red-100', '')}"
                            placeholder="Sua senha"
                            aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                        >
                        <button type="button" class="absolute right-2 top-1/2 -translate-y-1/2 bg-transparent border-none cursor-pointer p-1 text-slate-500 flex items-center justify-center hover:text-gray-700" onclick="togglePassword('password')">
                            <svg class="w-4 h-4" id="passwordEyeIcon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
                            </svg>
                        </button>
                    </div>
                    <#if messagesPerField.existsError('password')>
                        <span class="text-red-600 text-xs mt-1 block">
                            ${kcSanitize(messagesPerField.getFirstError('password'))?no_esc}
                        </span>
                    </#if>
                </div>

                <!-- Confirmar Senha -->
                <div class="mb-3">
                    <label for="password-confirm" class="block text-sm font-medium text-slate-900 mb-1.5">Confirmar Senha</label>
                    <div class="relative">
                        <input 
                            id="password-confirm" 
                            name="password-confirm" 
                            type="password" 
                            autocomplete="new-password" 
                            required 
                            class="w-full px-3 py-2 border border-gray-300 rounded-md text-sm transition-colors focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-100 bg-white ${messagesPerField.existsError('password-confirm')?then('border-red-600 focus:border-red-600 focus:ring-red-100', '')}"
                            placeholder="Confirme sua senha"
                            aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                        >
                        <button type="button" class="absolute right-2 top-1/2 -translate-y-1/2 bg-transparent border-none cursor-pointer p-1 text-slate-500 flex items-center justify-center hover:text-gray-700" onclick="togglePassword('password-confirm')">
                            <svg class="w-4 h-4" id="passwordConfirmEyeIcon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
                            </svg>
                        </button>
                    </div>
                    <#if messagesPerField.existsError('password-confirm')>
                        <span class="text-red-600 text-xs mt-1 block">
                            ${kcSanitize(messagesPerField.getFirstError('password-confirm'))?no_esc}
                        </span>
                    </#if>
                </div>

                <!-- Termos de Uso -->
                <#if termsAcceptanceRequired??>
                <div class="flex items-start gap-2 mb-3">
                    <input 
                        id="termsAccepted" 
                        name="termsAccepted" 
                        type="checkbox" 
                        required
                        class="mt-0.5"
                        aria-invalid="<#if messagesPerField.existsError('termsAccepted')>true</#if>"
                    >
                    <label for="termsAccepted" class="text-xs text-gray-700 leading-tight">
                        Eu aceito os 
                        <a href="#" class="text-blue-600 no-underline hover:underline">termos de uso</a> 
                        e a 
                        <a href="#" class="text-blue-600 no-underline hover:underline">política de privacidade</a>
                    </label>
                </div>
                <#if messagesPerField.existsError('termsAccepted')>
                    <span class="text-red-600 text-xs -mt-2 mb-4 block">
                        ${kcSanitize(messagesPerField.getFirstError('termsAccepted'))?no_esc}
                    </span>
                </#if>
                </#if>

                <!-- reCAPTCHA -->
                <#if recaptchaRequired?? && (recaptchaVisible!false)>
                <div class="flex justify-center mb-3">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}" data-action="${recaptchaAction}"></div>
                </div>
                </#if>

                <!-- Botão Submit -->
                <#if recaptchaRequired?? && !(recaptchaVisible!false)>
                    <button 
                        type="submit"
                        class="w-full bg-orange-400 text-white border-none rounded-md py-2.5 px-4 text-sm font-medium cursor-pointer transition-colors mt-1.5 flex items-center justify-center gap-2 hover:bg-orange-500 disabled:bg-slate-400 disabled:cursor-not-allowed g-recaptcha"
                        data-sitekey="${recaptchaSiteKey}" 
                        data-callback="onSubmitRecaptcha" 
                        data-action="${recaptchaAction}"
                    >
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path>
                        </svg>
                        ${ msg("doRegister") }
                    </button>
                <#else>
                    <button type="submit" class="w-full bg-orange-400 text-white border-none rounded-md py-2.5 px-4 text-sm font-medium cursor-pointer transition-colors mt-1.5 flex items-center justify-center gap-2 hover:bg-orange-500 disabled:bg-slate-400 disabled:cursor-not-allowed">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path>
                        </svg>
                        ${ msg("doRegister") }
                    </button>
                </#if>

                <!-- Link para Login -->
                <div class="text-center mt-3 text-sm">
                    <span class="text-slate-500">${ kcSanitize(msg("hasAccount"))?no_esc }</span>
                    <a href="${url.loginUrl}" class="text-orange-500 hover:text-orange-600 hover:underline">${ kcSanitize(msg("backToLogin"))?no_esc }</a>
                </div>
            </form>
        </div>
    </div>

    <script>
        function togglePassword(fieldId) {
            const field = document.getElementById(fieldId);
            const icon = document.getElementById(fieldId === 'password' ? 'passwordEyeIcon' : 'passwordConfirmEyeIcon');
            
            if (field.type === 'password') {
                field.type = 'text';
                icon.innerHTML = `
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.878 9.878L3 3m6.878 6.878L21 21"></path>
                `;
            } else {
                field.type = 'password';
                icon.innerHTML = `
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
                `;
            }
        }

        <#if recaptchaRequired?? && !(recaptchaVisible!false)>
        function onSubmitRecaptcha(token) {
            document.getElementById("kc-register-form").requestSubmit();
        }
        </#if>
    </script>

    <#if recaptchaRequired??>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    </#if>
</body>
</html>
