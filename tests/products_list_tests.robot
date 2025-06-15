*** Settings ***
Resource         ../resources/base.resource
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
    Adicionar todos os produtos da lista ao carrinho
    Verificar a quantidade descrita na badge de produto no carrinho

Caso de teste #04: Ordernar produtos por ordem alfabética crescente
    [Documentation]    Este caso de teste tem como objetivo fazer a ordenação da lista de produtos por ordem alfabética crescente
    [Tags]             products_list_sucesso
    Filtrar produtos por A a Z
    Pegar ordem da lista por nome do produto
    Verificar ordem dos produtos A a Z

Caso de teste #05: Ordernar produtos por ordem alfabética decrescente
    [Documentation]    Este caso de teste tem como objetivo fazer a ordenação da lista de produtos por ordem alfabética decrescente
    [Tags]             products_list_sucesso
    Filtrar produtos por Z a A
    Pegar ordem da lista por nome do produto
    Verificar ordem dos produtos Z a A

Caso de teste #06: Ordernar produtos por preço crescente
    [Documentation]    Este caso de teste tem como objetivo fazer a ordenação da lista de produtos por ordem de preço crescente
    [Tags]             products_list_sucesso
    Filtrar produtos por preço crescente
    Pegar ordem da lista por preço do produto
    Verificar ordem dos produtos por preço crescente

Caso de teste #07: Ordernar produtos por preço decrescente
    [Documentation]    Este caso de teste tem como objetivo fazer a ordenação da lista de produtos por ordem de preço decrescente
    [Tags]             products_list_sucesso
    Filtrar produtos por preço decrescente
    Pegar ordem da lista por preço do produto
    Verificar ordem dos produtos por preço decrescente