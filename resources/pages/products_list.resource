*** Settings ***
Library        SeleniumLibrary
Library        Collections
Library        String

*** Variables ***
${ADD_TO_CART_BUTTON}         xpath=//button[contains(@name,'add-to-cart')]
${QUANTITY_BADGE}             class=shopping_cart_badge
${REMOVE_FROM_CART_BUTTON}    xpath=//button[contains(.,'Remove')]
${FILTER_SELECTOR}            css=select.product_sort_container
${AZ_FILTER}                  xpath=//option[@value='az']
${ZA_FILTER}                  xpath=//option[@value='za']
${LOHI_FILTER}                xpath=//option[@value='lohi']
${HILO_FILTER}                xpath=//option[@value='hilo']
${CART_BUTTON}                css=a.shopping_cart_link

*** Keywords ***
Verify Url
    Location Should Contain    /inventory.html

Add A Product From List To Cart
    Wait Until Element Is Visible    ${ADD_TO_CART_BUTTON}    5s
    Click Button                     ${ADD_TO_CART_BUTTON}

Verify Product Badge In Cart
    Wait Until Element Is Visible    ${QUANTITY_BADGE}    5s

Remove Product From Cart By Product List
    Wait Until Element Is Visible    ${REMOVE_FROM_CART_BUTTON}
    Click Button                     ${REMOVE_FROM_CART_BUTTON}

Verify Product Badge In Cart Does Not Exist
    Wait Until Element Is Not Visible    ${QUANTITY_BADGE}    5s

Add All Products From List To Cart
    Wait Until Page Contains Element    css=.inventory_item    5s

    ${elements}           Get WebElements    xpath=//button[contains(@name,'add-to-cart')]
    ${cart_quantity}      Get Length         ${elements}
    Set Suite Variable    ${cart_quantity}
    
    FOR    ${products}    IN    @{elements}
        Wait Until Element Is Visible    ${products}    5s
        Scroll Element Into View         ${products}
        ${data_test}                     Get Element Attribute    ${products}    data-test
        Click Element                    xpath=//button[contains(@data-test,'${data_test}')]
    END

Verify Product Quantity In Cart Badge
    Wait Until Element Is Visible    ${QUANTITY_BADGE}    5s
    ${final_cart_quantity}           Get Text    ${QUANTITY_BADGE}
    Should Be Equal As Integers      ${final_cart_quantity}    ${cart_quantity}

Get Product List Order By Name
    Wait Until Page Contains Element    css=.inventory_item
    ${elements}                         Get WebElements    css=.inventory_item_name
    @{products_list}                    Create List

    FOR    ${element}    IN    @{elements}
        ${product}        Get Text    ${element}
        Append To List    ${products_list}    ${product}
    END
    Set Suite Variable    ${products_list}

Filter Products A To Z
    Wait Until Element Is Visible    ${FILTER_SELECTOR}    5s
    Click Element                    ${FILTER_SELECTOR}
    Wait Until Element Is Visible    ${AZ_FILTER}    5s
    Click Element                    ${AZ_FILTER}

Filter Products Z To A
    Wait Until Element Is Visible    ${FILTER_SELECTOR}    5s
    Click Element                    ${FILTER_SELECTOR}
    Wait Until Element Is Visible    ${ZA_FILTER}    5s
    Click Element                    ${ZA_FILTER}

Filter Products By Price Low To High
    Wait Until Element Is Visible    ${FILTER_SELECTOR}    5s
    Click Element                    ${FILTER_SELECTOR}
    Wait Until Element Is Visible    ${LOHI_FILTER}    5s
    Click Element                    ${LOHI_FILTER}

Filter Products By Price High To Low
    Wait Until Element Is Visible    ${FILTER_SELECTOR}    5s
    Click Element                    ${FILTER_SELECTOR}
    Wait Until Element Is Visible    ${HILO_FILTER}    5s
    Click Element                    ${HILO_FILTER}
    
Verify Product Order A To Z
    ${az_list}         Evaluate    sorted(${products_list})
    Should Be Equal    ${products_list}    ${az_list}

Verify Product Order Z To A
    ${za_list}         Evaluate    sorted(${products_list}, reverse=True)
    Should Be Equal    ${products_list}    ${za_list}

Get Product List Order By Price
    Wait Until Page Contains Element    css=.inventory_item
    ${elements}                         Get WebElements    css=.inventory_item_price
    @{prices_list}                      Create List
    
    FOR    ${element}    IN    @{elements}
        ${products_price}    Get Text    ${element}
        ${prices_value}      Remove String    ${products_price}    $
        ${float_price}       Convert To Number    ${prices_value}
        Append To List       ${prices_list}    ${float_price}
    END
    Set Suite Variable    ${prices_list}

Verify Product Order By Price Low To High
    ${lohi_list}       Evaluate    sorted(${prices_list})
    Should Be Equal    ${prices_list}    ${lohi_list}

Verify Product Order By Price High To Low
    ${hilo_list}       Evaluate    sorted(${prices_list}, reverse=True)
    Should Be Equal    ${prices_list}    ${hilo_list}

Access Cart
    Wait Until Element Is Visible    ${CART_BUTTON}    5s
    Click Element                    ${CART_BUTTON}
    Page Should Contain              Your Cart