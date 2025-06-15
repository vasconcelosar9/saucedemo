*** Settings ***
Resource         ../resources/base.resource
Test Setup       Acessar página
Test Teardown    Fechar navegador


*** Test Cases ***
Caso de teste #01: Login com credenciais válidas
    [Documentation]    É esperado que o usuário seja redirecionado à página de lista de produtos.
    [Tags]             login_sucesso
    Preencher usuário    standard_user
    Preencher senha      secret_sauce
    Submeter login
    Verificar URL

Caso de teste #02: Login com usuário inválido
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre o usuário ou senha estarem errados
    [Tags]             login_falha
    Preencher usuário    usuario_invalido
    Preencher senha      secret_sauce
    Submeter login
    Verificar mensagem    Epic sadface: Username and password do not match any user in this service

Caso de teste #03: Login com senha inválida
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre o usuário ou senha estarem errados
    [Tags]             login_falha
    Preencher usuário    standard_user
    Preencher senha      senha_invalida
    Submeter login
    Verificar mensagem    Epic sadface: Username and password do not match any user in this service

Caso de teste #04: Login com usuário e senha inválidos
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre o usuário ou senha estarem errados
    [Tags]             login_falha
    Preencher usuário    usuario_invalido
    Preencher senha      senha_invalida
    Submeter login
    Verificar mensagem    Epic sadface: Username and password do not match any user in this service

Caso de teste #05: Login com usuário e senha vazios
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre ser necessário preencher o campo Username
    [Tags]             login_falha
    Submeter login
    Verificar mensagem    Epic sadface: Username is required

Caso de teste #06: Login com campo de usuário vazio
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre ser necessário preencher o campo Username
    [Tags]             login_falha
    Preencher senha    secret_sauce
    Submeter login
    Verificar mensagem    Epic sadface: Username is required

Caso de teste #07: Login com campo de senha vazio
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre ser necessário preencher o campo Password
    [Tags]             login_falha
    Preencher usuário    standard_user
    Submeter login
    Verificar mensagem    Epic sadface: Password is required

Caso de teste #08: Login com usuário bloqueado
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre o usuário estar bloqueado
    [Tags]             login_falha
    Preencher usuário    locked_out_user
    Preencher senha      secret_sauce
    Submeter login
    Verificar mensagem    Epic sadface: Sorry, this user has been locked out.