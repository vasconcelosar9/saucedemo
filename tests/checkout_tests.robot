*** Settings ***
Resource         ../resources/base.resource
Test Setup       Run Keywords    Acessar página
...    AND    Preencher usuário    standard_user
...    AND    Preencher senha      secret_sauce
...    AND    Submeter login
...    AND    Adicionar um produto da lista ao carrinho
...    AND    Acessar o carrinho
...    AND    Acessar o checkout
Test Teardown    Fechar navegador

*** Test Cases ***
Caso de teste #01: Checkout completo com informações válidas
    [Documentation]    Este caso de teste tem como objetivo realizar o checkout com sucesso
    [Tags]             checkout_sucesso
    Preencher First Name
    Preencher Last Name
    Preencher Zip/Postal Code
    Continuar
    Finalizar Checkout

Caso de teste #02: Checkout com campo First Name vazio
    [Documentation]    Este caso de teste tem como objetivo validar a obrigatoriedade de preenchimento do campo First Name
    [Tags]             checkout_falha
    Preencher Last Name
    Preencher Zip/Postal Code
    Continuar
    Verificar mensagem    Error: First Name is required

Caso de teste #03: Checkout com campo Last Name vazio
    [Documentation]    Este caso de teste tem como objetivo validar a obrigatoriedade de preenchimento do campo Last Name
    [Tags]             checkout_falha
    Preencher First Name
    Preencher Zip/Postal Code
    Continuar
    Verificar mensagem    Error: Last Name is required

Caso de teste #04: Checkout com campo Zip/Postal Code vazio
    [Documentation]    Este caso de teste tem como objetivo validar a obrigatoriedade de preenchimento do campo Zip/Postal Code
    [Tags]             checkout_falha
    Preencher First Name
    Preencher Last Name
    Continuar
    Verificar mensagem    Error: Postal Code is required

Caso de teste #05: Cancelar checkout na página de informações
    [Documentation]    Este caso de teste tem como objetivo cancelar o checkout na página de informações
    [Tags]             checkout_falha
    Cancelar checkout na página de informações


Caso de teste #05: Cancelar checkout na página de visão geral
    [Documentation]    Este caso de teste tem como objetivo cancelar o checkout na página de visão geral
    [Tags]             checkout_falha
    Preencher First Name
    Preencher Last Name
    Preencher Zip/Postal Code
    Continuar
    Cancelar checkout na página de visão geral