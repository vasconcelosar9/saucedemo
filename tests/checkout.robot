*** Settings ***
Resource         ../resources/base.resource
Test Setup       Run Keywords    Start Session
...    AND       Fill Username    standard_user
...    AND       Fill Password    secret_sauce
...    AND       Submit Login
...    AND       Add A Product From List To Cart
...    AND       Access Cart
...    AND       Access Checkout
Test Teardown    End Session

*** Test Cases ***
Realizar checkout completo com informações válidas
    [Documentation]    Este caso de teste tem como objetivo realizar o checkout com sucesso
    [Tags]             checkout_sucesso

    Fill First Name
    Fill Last Name
    Fill Zip/Postal Code
    Continue
    Finish Checkout

Realizar checkout com campo First Name vazio
    [Documentation]    Este caso de teste tem como objetivo validar a obrigatoriedade de preenchimento do campo First Name
    [Tags]             checkout_falha

    Fill Last Name
    Fill Zip/Postal Code
    Continue
    Verify Message    Error: First Name is required

Realizar checkout com campo Last Name vazio
    [Documentation]    Este caso de teste tem como objetivo validar a obrigatoriedade de preenchimento do campo Last Name
    [Tags]             checkout_falha

    Fill First Name
    Fill Zip/Postal Code
    Continue
    Verify Message    Error: Last Name is required

Realizar checkout com campo Zip/Postal Code vazio
    [Documentation]    Este caso de teste tem como objetivo validar a obrigatoriedade de preenchimento do campo Zip/Postal Code
    [Tags]             checkout_falha

    Fill First Name
    Fill Last Name
    Continue
    Verify Message    Error: Postal Code is required

Cancelar checkout na página de informações
    [Documentation]    Este caso de teste tem como objetivo cancelar o checkout na página de informações
    [Tags]             checkout_falha

    Cancel Checkout On Info Page

Cancelar checkout na página de visão geral
    [Documentation]    Este caso de teste tem como objetivo cancelar o checkout na página de visão geral
    [Tags]             checkout_falha
    
    Fill First Name
    Fill Last Name
    Fill Zip/Postal Code
    Continue
    Cancel Checkout On Overview Page