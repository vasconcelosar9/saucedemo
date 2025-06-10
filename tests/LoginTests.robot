*** Settings ***
Resource         ../resources/ResourceSaucedemoTest.robot
Test Setup       Acessar página
Test Teardown    Fechar navegador


*** Test Cases ***
Caso de teste #01: Login com credenciais válidas
    [Documentation]    É esperado que o usuário seja redirecionado à página de lista de produtos.
    [Tags]             login_sucesso
    Preencher usuário válido
    Preencher senha válida
    Submeter login
    Verificar URL

Caso de teste #02: Login com usuário inválido
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre o usuário ou senha estarem errados
    [Tags]             login_falha
    Preencher usuário inválido
    Preencher senha válida
    Submeter login
    Verificar mensagem de erro "Epic sadface: Username and password do not match any user in this service"

Caso de teste #03: Login com senha inválida
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre o usuário ou senha estarem errados
    [Tags]             login_falha
    Preencher usuário válido
    Preencher senha inválida
    Submeter login
    Verificar mensagem de erro "Epic sadface: Username and password do not match any user in this service"

Caso de teste #4: Login com usuário e senha inválidos
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre o usuário ou senha estarem errados
    [Tags]             login_falha
    Preencher usuário inválido
    Preencher senha inválida
    Submeter login
    Verificar mensagem de erro "Epic sadface: Username and password do not match any user in this service"

Caso de teste #05: Login com usuário e senha vazios
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre ser necessário preencher o campo Username
    [Tags]             login_falha
    Submeter login
    Verificar mensagem de erro "Epic sadface: Username is required"

Caso de teste #06: Login com campo de usuário vazio
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre ser necessário preencher o campo Username
    [Tags]             login_falha
    Preencher senha válida
    Submeter login
    Verificar mensagem de erro "Epic sadface: Username is required"

Caso de teste #07: Login com campo de senha vazio
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre ser necessário preencher o campo Password
    [Tags]             login_falha
    Preencher usuário válido
    Submeter login
    Verificar mensagem de erro "Epic sadface: Password is required"

Caso de teste #08: Login com usuário bloqueado "locked_out_user"
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre o usuário estar bloqueado
    [Tags]             login_falha
    Preencher usuário bloqueado
    Preencher senha válida
    Submeter login
    Verificar mensagem de erro "Epic sadface: Sorry, this user has been locked out."