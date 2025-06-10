*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}                                 chrome
${URL}                                     https://www.saucedemo.com
${CAMPO_USUARIO}                           id=user-name
${CAMPO_SENHA}                             id=password
${BOTAO_LOGIN}                             id=login-button
${BOTAO_ADD_TO_CART_BACKPACK}              id=add-to-cart-sauce-labs-backpack
${BOTAO_ADD_TO_CART_BIKE}                  id=add-to-cart-sauce-labs-bike-light
${BOTAO_ADD_TO_CART_TSHIRT}                id=add-to-cart-sauce-labs-bolt-t-shirt
${BADGE_CARRINHO_COM_QUANTIDADE}           element=//span[contains(@class,'badge')]
${BADGE_CARRINHO_TRES_ITENS}               element=//span[@class='shopping_cart_badge'][contains(.,'3')]
${BOTAO_REMOVE_FROM_CART_PRODUCTS_LIST}    id=remove-sauce-labs-backpack

*** Keywords ***
Acessar página
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Swag Labs

Fechar navegador
    Close Browser

Verificar URL
    Location Should Contain    /inventory.html

Preencher usuário
    [Arguments]    ${USUARIO}
    Wait Until Element Is Visible    ${CAMPO_USUARIO}    5s
    Input Text    ${CAMPO_USUARIO}    ${USUARIO}

Preencher senha
    [Arguments]    ${SENHA}
    Wait Until Element Is Visible    ${CAMPO_SENHA}    5s
    Input Text    ${CAMPO_SENHA}    ${SENHA}

Submeter login
    Wait Until Element Is Visible    ${BOTAO_LOGIN}    5s
    Click Button    ${BOTAO_LOGIN}

Verificar mensagem
    [Arguments]    ${MENSAGEM}
    Wait Until Page Contains    ${MENSAGEM}    5s
    # Page Should Contain    ${MENSAGEM}

Adicionar um produto da lista ao carrinho
    Wait Until Element Is Visible    ${BOTAO_ADD_TO_CART_BACKPACK}    5s
    Click Button    ${BOTAO_ADD_TO_CART_BACKPACK}

Verificar badge de produto no carrinho
    Wait Until Element Is Visible    ${BADGE_CARRINHO_COM_QUANTIDADE}    5s

Remover produto do carrinho pela lista de produtos
    Wait Until Element Is Visible    ${BOTAO_REMOVE_FROM_CART_PRODUCTS_LIST}
    Click Button    ${BOTAO_REMOVE_FROM_CART_PRODUCTS_LIST}

Verificar que badge de produto no carrinho não existe
    Wait Until Element Is Not Visible    ${BADGE_CARRINHO_COM_QUANTIDADE}    5s

Adicionar três produtos ao carrinho
    Wait Until Element Is Visible    ${BOTAO_ADD_TO_CART_BACKPACK}    5s
    Click Button    ${BOTAO_ADD_TO_CART_BACKPACK}
    Wait Until Element Is Visible    ${BOTAO_ADD_TO_CART_BIKE}    5s
    Click Button    ${BOTAO_ADD_TO_CART_BIKE}
    Wait Until Element Is Visible    ${BOTAO_ADD_TO_CART_TSHIRT}    5s
    Click Button    ${BOTAO_ADD_TO_CART_TSHIRT}

Verificar a quantidade descrita na badge de produto no carrinho
    Wait Until Element Is Visible    ${BADGE_CARRINHO_TRES_ITENS}    5s
    