*** Settings ***
Resource         ../resources/base.resource
Test Setup       Start Session
Test Teardown    End Session


*** Test Cases ***
Efetuar login com credenciais válidas
    [Documentation]    É esperado que o usuário seja redirecionado à página de lista de produtos.
    [Tags]             login_sucesso

    Fill Username    standard_user
    Fill Password    secret_sauce
    Submit Login
    Verify Url

Efetuar login com usuário inválido
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre o usuário ou senha estarem errados
    [Tags]             login_falha

    Fill Username     usuario_invalido
    Fill Password     secret_sauce
    Submit Login
    Verify Message    Epic sadface: Username and password do not match any user in this service

Efetuar login com senha inválida
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre o usuário ou senha estarem errados
    [Tags]             login_falha

    Fill Username     standard_user
    Fill Password     senha_invalida
    Submit Login
    Verify Message    Epic sadface: Username and password do not match any user in this service

Efetuar login com usuário e senha inválidos
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre o usuário ou senha estarem errados
    [Tags]             login_falha

    Fill Username     usuario_invalido
    Fill Password     senha_invalida
    Submit Login
    Verify Message    Epic sadface: Username and password do not match any user in this service

Efetuar login com usuário e senha vazios
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre ser necessário preencher o campo Username
    [Tags]             login_falha

    Submit Login
    Verify Message    Epic sadface: Username is required

Efetuar login com campo de usuário vazio
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre ser necessário preencher o campo Username
    [Tags]             login_falha

    Fill Password     secret_sauce
    Submit Login
    Verify Message    Epic sadface: Username is required

Efetuar login com campo de senha vazio
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre ser necessário preencher o campo Password
    [Tags]             login_falha

    Fill Username     standard_user
    Submit Login
    Verify Message    Epic sadface: Password is required

Efetuar login com usuário bloqueado
    [Documentation]    É esperado que o usuário não consiga logar e que seja exibida uma mensagem de erro
    ...                sobre o usuário estar bloqueado
    [Tags]             login_falha
    
    Fill Username     locked_out_user
    Fill Password     secret_sauce
    Submit Login
    Verify Message    Epic sadface: Sorry, this user has been locked out.