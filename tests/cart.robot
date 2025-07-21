*** Settings ***
Resource         ../resources/base.resource
Test Setup       Run Keywords    Start Session
...    AND    Fill Username    standard_user
...    AND    Fill Password    secret_sauce
...    AND    Submit Login
Test Teardown    End Session

*** Test Cases ***
Visualizar itens no carrinho
    [Documentation]    Este caso de teste tem como objetivo visualizar os itens adicionados ao carrinho
    [Tags]             cart_sucesso

    Add A Product From List To Cart
    Access Cart

Remover um item do carrinho pela página do carrinho
    [Documentation]    Este caso de teste tem como objetivo remover um item através da página do carrinho
    [Tags]             cart_sucesso

    Add A Product From List To Cart
    Access Cart
    Remove Item From Cart On Cart Page

Remover todos os itens do carrinho pela página do carrinho
    [Documentation]    Este caso de teste tem como objetivo remover todos os itens que estão na página do carrinho
    [Tags]             cart_sucesso

    Add All Products From List To Cart
    Access Cart
    Remove All Items On Cart Page

Continuar comprando
    [Documentation]    Este caso de teste tem como objetivo validar a continuação da compra
    [Tags]             cart_sucesso

    Add A Product From List To Cart
    Access Cart
    Continue Shopping

Navegar para o checkout
    [Documentation]    Este caso de teste tem como objetivo validar o acesso ao checkout
    [Tags]             cart_sucesso
    
    Add A Product From List To Cart
    Access Cart
    Access Checkout