*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}                           chrome
${URL}                               https://www.saucedemo.com
${CAMPO_USUARIO}                     id=user-name
${CAMPO_SENHA}                       id=password
${BOTAO_LOGIN}                       id=login-button
${BOTAO_ADD_TO_CART_PRODUCTS_LIST}   id=add-to-cart-sauce-labs-backpack
${BADGE_CARRINHO_COM_VALOR}          //span[contains(@class,'badge')]

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
    Wait Until Element Is Visible    ${BOTAO_ADD_TO_CART_PRODUCTS_LIST}    5s
    Click Button    ${BOTAO_ADD_TO_CART_PRODUCTS_LIST}

Verificar badge de produto no carrinho
    Wait Until Element Is Visible    ${BADGE_CARRINHO_COM_VALOR}    5s