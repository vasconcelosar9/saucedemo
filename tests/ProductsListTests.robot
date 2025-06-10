*** Settings ***
Resource         ../resources/ResourceSaucedemoTest.resource
Test Setup       Acessar página
Test Teardown    Fechar navegador

*** Test Cases ***
Caso de teste #01: Adicionar um produto ao carrinho
    [Documentation]    Este caso de teste tem como objetivo realizar a adição de um produto ao carrinho
    ...                através da página de lista de produtos. É esperado que o usuário tenha sucesso.
    [Tags]             products_list_sucesso
    Preencher usuário    standard_user
    Preencher senha      secret_sauce
    Submeter login
    Adicionar um produto da lista ao carrinho
    Verificar badge de produto no carrinho