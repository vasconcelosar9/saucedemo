*** Settings ***
Library        SeleniumLibrary
Library        FakerLibrary    locale=pt_BR

*** Variables ***
${CONTINUE_CHECKOUT_BUTTON}    id=continue
${FINISH_CHECKOUT_BUTTON}      id=finish
${CANCEL_CHECKOUT_BUTTON}      id=cancel

*** Keywords ***
Fill First Name
    ${first_name_field}              Set Variable    id=first-name
    Wait Until Element Is Visible    ${first_name_field}    5s
    ${first_name}                    First Name
    Input Text                       ${first_name_field}    ${first_name}

Fill Last Name
    ${last_name_field}               Set Variable    id=last-name
    Wait Until Element Is Visible    ${last_name_field}    5s
    ${last_name}                     Last Name
    Input Text                       ${last_name_field}    ${last_name}

Fill Zip/Postal Code
    ${zip_code_field}                Set Variable    id=postal-code
    Wait Until Element Is Visible    ${zip_code_field}    5s
    ${zip_code}                      Postcode
    Input Text                       ${zip_code_field}    ${zip_code}

Continue
    Click Button    ${CONTINUE_CHECKOUT_BUTTON}

Cancel Checkout On Info Page
    Page Should Contain    Checkout: Your Information
    Click Button           ${CANCEL_CHECKOUT_BUTTON}
    Page Should Contain    Your Cart

Cancel Checkout On Overview Page
    Page Should Contain    Checkout: Overview
    Click Button           ${CANCEL_CHECKOUT_BUTTON}
    Page Should Contain    Products

Finish Checkout
    Page Should Contain              Checkout: Overview
    Wait Until Element Is Visible    ${FINISH_CHECKOUT_BUTTON}    5s
    Click Button                     ${FINISH_CHECKOUT_BUTTON}
    Page Should Contain              Checkout: Complete!