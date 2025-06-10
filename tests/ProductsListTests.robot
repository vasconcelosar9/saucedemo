*** Settings ***
Resource         ../resources/ResourceSaucedemoTest.robot
Test Setup       Acessar página
Test Teardown    Fechar navegador

*** Test Cases ***
Caso de teste #01: Adicionar um produto ao carrinho
    [Documentation]    Este caso de teste tem como objetivo realizar a adição de um produto ao carrinho
    ...                através da página de lista de produtos. É esperado que o usuário tenha sucesso.
    [Tags]             products_list_sucesso
    Preencher usuário válido
    Preencher senha válida
    Submeter login
    Adicionar um produto da lista ao carrinho
    Verificar que o produto foi adicionado