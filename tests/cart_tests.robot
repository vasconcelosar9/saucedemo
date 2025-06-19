*** Settings ***
Resource         ../resources/base.resource
Test Setup       Run Keywords    Acessar página
...    AND    Preencher usuário    standard_user
...    AND    Preencher senha      secret_sauce
...    AND    Submeter login
Test Teardown    Fechar navegador

*** Test Cases ***
Caso de teste #01: Visualizar itens no carrinho
    [Documentation]    Este caso de teste tem como objetivo visualizar os itens adicionados ao carrinho
    [Tags]             cart_sucesso
    Adicionar um produto da lista ao carrinho
    Acessar o carrinho

Caso de teste #02: Remover um item do carrinho pela página do carrinho
    [Documentation]    Este caso de teste tem como objetivo remover um item através da página do carrinho
    [Tags]             cart_sucesso
    Adicionar um produto da lista ao carrinho
    Acessar o carrinho
    Remover item do carrinho através da página do carrinho

Caso de teste #03: Remover todos os itens do carrinho pela página do carrinho
    [Documentation]    Este caso de teste tem como objetivo remover todos os itens que estão na página do carrinho
    [Tags]             cart_sucesso
    Adicionar todos os produtos da lista ao carrinho
    Acessar o carrinho
    Remover todos os itens através da página do carrinho


Caso de teste #04: Continuar comprando
    [Documentation]    Este caso de teste tem como objetivo validar a continuação da compra
    [Tags]             cart_sucesso
    Adicionar um produto da lista ao carrinho
    Acessar o carrinho
    Continuar comprando

Caso de teste #05: Navegar para o checkout
    [Documentation]    Este caso de teste tem como objetivo validar o acesso ao checkout
    [Tags]             cart_sucesso
    Adicionar um produto da lista ao carrinho
    Acessar o carrinho
    Acessar o checkout