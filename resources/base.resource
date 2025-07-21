*** Settings ***
Resource        pages/login.resource
Resource        pages/products_list.resource
Resource        pages/cart.resource
Resource        pages/checkout.resource

*** Variables ***
${URL}            https://www.saucedemo.com
${BROWSER}        chrome
${IS_HEADLESS}    True

*** Keywords ***
Start Session
    ${options}            Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${prefs}              Evaluate    {'profile.password_manager_leak_detection': False}
    Call Method           ${options}    add_experimental_option    prefs    ${prefs}
    Run Keyword If        ${IS_HEADLESS} == True
    ...    Call Method    ${options}    add_argument    --headless
    
    Open Browser          ${URL}    ${BROWSER}    options=${options}
    Maximize Browser Window
    Title Should Be       Swag Labs

End Session
    Capture Page Screenshot
    Close Browser

Verify Message
    [Arguments]                 ${message}
    Wait Until Page Contains    ${message}    5s
