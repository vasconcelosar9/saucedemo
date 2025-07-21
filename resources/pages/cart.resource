*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${REMOVE_FROM_CART_BUTTON}    xpath=//button[contains(.,'Remove')]
${ITEM_NAME}                  css=div.inventory_item_name
${CONTINUE_SHOPPING_BUTTON}   id=continue-shopping
${CHECKOUT_BUTTON}            id=checkout

*** Keywords ***
Remove Item From Cart On Cart Page
    Wait Until Element Is Visible    ${REMOVE_FROM_CART_BUTTON}
    Click Button                     ${REMOVE_FROM_CART_BUTTON}
    Element Should Not Be Visible    ${ITEM_NAME}

Remove All Items On Cart Page
    Wait Until Element Is Visible    css=.cart_item    5s
    ${elements}                      Get WebElements    xpath=//button[contains(@name,'remove')]

    FOR    ${product}    IN    @{elements}
        Wait Until Element Is Visible    ${product}    5s
        Scroll Element Into View         ${product}
        ${data_test}                     Get Element Attribute    ${product}    data-test
        Click Element                    xpath=//button[contains(@data-test,'${data_test}')]
    END
    Element Should Not Be Visible    css=.cart_item

Continue Shopping
    Click Button           ${CONTINUE_SHOPPING_BUTTON}
    Page Should Contain    Products

Access Checkout
    Click Button           ${CHECKOUT_BUTTON}
    Page Should Contain    Checkout: Your Information

