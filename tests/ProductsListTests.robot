*** Settings ***
Resource         ../resources/ResourceSaucedemoTest.resource
Test Setup       Run Keywords    Acessar página
...    AND    Preencher usuário    standard_user
...    AND    Preencher senha      secret_sauce
...    AND    Submeter login
Test Teardown    Fechar navegador

*** Test Cases ***
Caso de teste #01: Adicionar um produto ao carrinho
    [Documentation]    Este caso de teste tem como objetivo realizar a adição de um produto ao carrinho
    ...                através da página de lista de produtos. É esperado que o usuário tenha sucesso.
    [Tags]             products_list_sucesso
    Adicionar um produto da lista ao carrinho
    Verificar badge de produto no carrinho

Caso de teste #02: Remover um produto do carrinho pela página de produtos
    [Documentation]    Este caso de teste tem como objetivo validar a remoção de um produto do carrinho
    ...                quando o usuário ainda está na página da lista de produtos
    [Tags]             products_list_sucesso
    Adicionar um produto da lista ao carrinho
    Remover produto do carrinho pela lista de produtos
    Verificar que badge de produto no carrinho não existe

Caso de teste #03: Adicionar mútiplos produtos ao carrinho
    [Documentation]    Este caso de teste tem como objetivo adicionar ao carrinho todos os produtos da lista
    [Tags]             products_list_sucesso
    Adicionar três produtos ao carrinho
    Verificar badge de produto no carrinho
    Verificar a quantidade descrita na badge de produto no carrinho