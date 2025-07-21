*** Settings ***
Resource         ../resources/base.resource
Test Setup       Run Keywords    Start Session
...    AND       Fill Username    standard_user
...    AND       Fill Password    secret_sauce
...    AND       Submit Login
Test Teardown    End Session

*** Test Cases ***
Adicionar um produto ao carrinho
    [Documentation]    Este caso de teste tem como objetivo realizar a adição de um produto ao carrinho
    ...                através da página de lista de produtos. É esperado que o usuário tenha sucesso.
    [Tags]             products_list_sucesso

    Add A Product From List To Cart
    Verify Product Badge In Cart

Remover um produto do carrinho pela página de produtos
    [Documentation]    Este caso de teste tem como objetivo validar a remoção de um produto do carrinho
    ...                quando o usuário ainda está na página da lista de produtos
    [Tags]             products_list_sucesso

    Add A Product From List To Cart
    Remove Product From Cart By Product List
    Verify Product Badge In Cart Does Not Exist

Adicionar mútiplos produtos ao carrinho
    [Documentation]    Este caso de teste tem como objetivo adicionar ao carrinho todos os produtos da lista
    [Tags]             products_list_sucesso

    Add All Products From List To Cart
    Verify Product Quantity In Cart Badge

Ordernar produtos por ordem alfabética crescente
    [Documentation]    Este caso de teste tem como objetivo fazer a ordenação da lista de produtos por ordem alfabética crescente
    [Tags]             products_list_sucesso

    Filter Products A To Z
    Get Product List Order By Name
    Verify Product Order A To Z

Ordernar produtos por ordem alfabética decrescente
    [Documentation]    Este caso de teste tem como objetivo fazer a ordenação da lista de produtos por ordem alfabética decrescente
    [Tags]             products_list_sucesso

    Filter Products Z To A
    Get Product List Order By Name
    Verify Product Order Z To A

Ordernar produtos por preço crescente
    [Documentation]    Este caso de teste tem como objetivo fazer a ordenação da lista de produtos por ordem de preço crescente
    [Tags]             products_list_sucesso

    Filter Products By Price Low To High
    Get Product List Order By Price
    Verify Product Order By Price Low To High

Ordernar produtos por preço decrescente
    [Documentation]    Este caso de teste tem como objetivo fazer a ordenação da lista de produtos por ordem de preço decrescente
    [Tags]             products_list_sucesso
    
    Filter Products By Price High To Low
    Get Product List Order By Price
    Verify Product Order By Price High To Low