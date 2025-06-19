*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Library    FakerLibrary    locale=pt_BR

*** Variables ***
${BROWSER}                                 chrome
${URL}                                     https://www.saucedemo.com
${CAMPO_USUARIO}                           id=user-name
${CAMPO_SENHA}                             id=password
${BOTAO_LOGIN}                             id=login-button
${BOTAO_ADD_TO_CART_PRODUTOS}              xpath=//button[contains(@name,'add-to-cart')]
${BADGE_CARRINHO_COM_QUANTIDADE}           class=shopping_cart_badge
${BOTAO_REMOVE_FROM_CART_PRODUCTS_LIST}    xpath=//button[contains(.,'Remove')]
${SELETOR_DO_FILTRO}                       css=select.product_sort_container
${FILTRO_AZ}                               xpath=//option[@value='az']
${FILTRO_ZA}                               xpath=//option[@value='za']
${FILTRO_LOHI}                             xpath=//option[@value='lohi']
${FILTRO_HILO}                             xpath=//option[@value='hilo']
${BOTAO_CARRINHO}                          css=a.shopping_cart_link
${BOTAO_REMOVE_FROM_CART_PAGE}             xpath=//button[contains(.,'Remove')]
${ITEM_NAME}                               css=div.inventory_item_name
${BOTAO_CONTINUE_SHOPPING}                 id=continue-shopping
${BOTAO_CHECKOUT}                          id=checkout
${CAMPO_FIRST_NAME}                        id=first-name
${CAMPO_LAST_NAME}                         id=last-name
${CAMPO_ZIP_CODE}                          id=postal-code
${BOTAO_CONTINUE_CHECKOUT}                 id=continue
${BOTAO_FINISH_CHECKOUT}                   id=finish
${BOTAO_CANCEL_CHECKOUT}                   id=cancel

*** Keywords ***
Acessar página
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${prefs}    Evaluate    {'profile.password_manager_leak_detection': False}
    Call Method    ${chrome_options}    add_experimental_option
    ...    prefs    ${prefs}
    Open Browser    ${URL}    ${BROWSER}    options=${chrome_options}
    Maximize Browser Window
    Title Should Be    Swag Labs

Fechar navegador
    Close Browser

Verificar URL
    Location Should Contain    /inventory.html

Preencher usuário
    [Arguments]    ${usuario}
    Wait Until Element Is Visible    ${CAMPO_USUARIO}    5s
    Input Text    ${CAMPO_USUARIO}    ${usuario}

Preencher senha
    [Arguments]    ${senha}
    Wait Until Element Is Visible    ${CAMPO_SENHA}    5s
    Input Text    ${CAMPO_SENHA}    ${senha}

Submeter login
    Wait Until Element Is Visible    ${BOTAO_LOGIN}    5s
    Click Button    ${BOTAO_LOGIN}

Verificar mensagem
    [Arguments]    ${mensagem}
    Wait Until Page Contains    ${mensagem}    5s

Adicionar um produto da lista ao carrinho
    Wait Until Element Is Visible    ${BOTAO_ADD_TO_CART_PRODUTOS}    5s
    Click Button    ${BOTAO_ADD_TO_CART_PRODUTOS}

Verificar badge de produto no carrinho
    Wait Until Element Is Visible    ${BADGE_CARRINHO_COM_QUANTIDADE}    5s

Remover produto do carrinho pela lista de produtos
    Wait Until Element Is Visible    ${BOTAO_REMOVE_FROM_CART_PRODUCTS_LIST}
    Click Button    ${BOTAO_REMOVE_FROM_CART_PRODUCTS_LIST}

Verificar que badge de produto no carrinho não existe
    Wait Until Element Is Not Visible    ${BADGE_CARRINHO_COM_QUANTIDADE}    5s


Adicionar todos os produtos da lista ao carrinho
    Wait Until Page Contains Element    css=.inventory_item    5s
    ${elementos_produtos}    Get WebElements    xpath=//button[contains(@name,'add-to-cart')]
    ${quantidade_atual_no_carrinho}    Get Length    ${elementos_produtos}
    Set Suite Variable    ${quantidade_atual_no_carrinho}
    FOR    ${produto}    IN    @{elementos_produtos}
        Wait Until Element Is Visible    ${produto}    5s
        Scroll Element Into View    ${produto}
        ${data_test}   Get Element Attribute    ${produto}    data-test
        Click Element    xpath=//button[contains(@data-test,'${data_test}')]
    END

Verificar a quantidade descrita na badge de produto no carrinho
    Wait Until Element Is Visible    ${BADGE_CARRINHO_COM_QUANTIDADE}    5s
    ${quantidade_final_do_carrinho}    Get Text    ${BADGE_CARRINHO_COM_QUANTIDADE}
    Should Be Equal As Integers    ${quantidade_final_do_carrinho}    ${quantidade_atual_no_carrinho}

Pegar ordem da lista por nome do produto
    Wait Until Page Contains Element    css=.inventory_item
    ${elementos_produtos}    Get WebElements    css=.inventory_item_name
    @{lista_nomes}    Create List
    FOR    ${elemento}    IN    @{elementos_produtos}
        ${nome_produto}    Get Text    ${elemento}
        Append To List    ${lista_nomes}    ${nome_produto}
    END
    Set Suite Variable    ${lista_nomes}

Filtrar produtos por A a Z
    Wait Until Element Is Visible    ${SELETOR_DO_FILTRO}    5s
    Click Element    ${SELETOR_DO_FILTRO}
    Wait Until Element Is Visible    ${FILTRO_AZ}    5s
    Click Element    ${FILTRO_AZ}

Filtrar produtos por Z a A
    Wait Until Element Is Visible    ${SELETOR_DO_FILTRO}    5s
    Click Element    ${SELETOR_DO_FILTRO}
    Wait Until Element Is Visible    ${FILTRO_ZA}    5s
    Click Element    ${FILTRO_ZA}

Filtrar produtos por preço crescente
    Wait Until Element Is Visible    ${SELETOR_DO_FILTRO}    5s
    Click Element    ${SELETOR_DO_FILTRO}
    Wait Until Element Is Visible    ${FILTRO_LOHI}    5s
    Click Element    ${FILTRO_LOHI}

Filtrar produtos por preço decrescente
    Wait Until Element Is Visible    ${SELETOR_DO_FILTRO}    5s
    Click Element    ${SELETOR_DO_FILTRO}
    Wait Until Element Is Visible    ${FILTRO_HILO}    5s
    Click Element    ${FILTRO_HILO}
    
Verificar ordem dos produtos A a Z
    ${lista_az}    Evaluate    sorted(${lista_nomes})
    Should Be Equal    ${lista_nomes}    ${lista_az}

Verificar ordem dos produtos Z a A
    ${lista_za}    Evaluate    sorted(${lista_nomes}, reverse=True)
    Should Be Equal    ${lista_nomes}    ${lista_za}

Pegar ordem da lista por preço do produto
    Wait Until Page Contains Element    css=.inventory_item
    ${elementos_produtos}    Get WebElements    css=.inventory_item_price
    @{lista_precos}    Create List
    FOR    ${elemento}    IN    @{elementos_produtos}
        ${preco_produto}    Get Text    ${elemento}
        ${precos_sem_simbolos}    Remove String    ${preco_produto}    $
        ${preco_flaot}    Convert To Number    ${precos_sem_simbolos}
        Append To List    ${lista_precos}    ${preco_flaot}
    END
    Set Suite Variable    ${lista_precos}

Verificar ordem dos produtos por preço crescente
    ${lista_lohi}    Evaluate    sorted(${lista_precos})
    Should Be Equal    ${lista_precos}    ${lista_lohi}

Verificar ordem dos produtos por preço decrescente
    ${lista_hilo}    Evaluate    sorted(${lista_precos}, reverse=True)
    Should Be Equal    ${lista_precos}    ${lista_hilo}

Acessar o carrinho
    Wait Until Element Is Visible    ${BOTAO_CARRINHO}    5s
    Click Element    ${BOTAO_CARRINHO}
    Page Should Contain    Your Cart

Remover item do carrinho através da página do carrinho
    Wait Until Element Is Visible    ${BOTAO_REMOVE_FROM_CART_PAGE}
    Click Button    ${BOTAO_REMOVE_FROM_CART_PAGE}
    Element Should Not Be Visible    ${ITEM_NAME}

Continuar comprando
    Click Button    ${BOTAO_CONTINUE_SHOPPING}
    Page Should Contain    Products

Acessar o checkout
    Click Button    ${BOTAO_CHECKOUT}
    Page Should Contain    Checkout: Your Information

Remover todos os itens através da página do carrinho
    Wait Until Element Is Visible    css=.cart_item    5s
    ${elementos_produtos}    Get WebElements    xpath=//button[contains(@name,'remove')]
    FOR    ${produto}    IN    @{elementos_produtos}
        Wait Until Element Is Visible    ${produto}    5s
        Scroll Element Into View    ${produto}
        ${data_test}   Get Element Attribute    ${produto}    data-test
        Click Element    xpath=//button[contains(@data-test,'${data_test}')]
    END
    Element Should Not Be Visible    css=.cart_item

Preencher First Name
    Wait Until Element Is Visible    ${CAMPO_FIRST_NAME}
    ${first_name}    First Name
    Input Text    ${CAMPO_FIRST_NAME}    ${first_name}

Preencher Last Name
    Wait Until Element Is Visible    ${CAMPO_LAST_NAME}
    ${last_name}    Last Name
    Input Text    ${CAMPO_LAST_NAME}    ${last_name}

Preencher Zip/Postal Code
    Wait Until Element Is Visible    ${CAMPO_ZIP_CODE}
    ${valor_aleatorio}    Postcode
    Input Text    ${CAMPO_ZIP_CODE}    ${valor_aleatorio}

Continuar
    Click Button    ${BOTAO_CONTINUE_CHECKOUT}

Cancelar checkout na página de informações
    Page Should Contain    Checkout: Your Information
    Click Button    ${BOTAO_CANCEL_CHECKOUT}
    Page Should Contain    Your Cart

Cancelar checkout na página de visão geral
    Page Should Contain    Checkout: Overview
    Click Button    ${BOTAO_CANCEL_CHECKOUT}
    Page Should Contain    Products

Finalizar Checkout
    Page Should Contain    Checkout: Overview
    Wait Until Element Is Visible    ${BOTAO_FINISH_CHECKOUT}    5s
    Click Button    ${BOTAO_FINISH_CHECKOUT}
    Page Should Contain    Checkout: Complete!