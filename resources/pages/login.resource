*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${USERNAME_FIELD}    id=user-name
${PASSWORD_FIELD}    id=password
${LOGIN_BUTTON}      id=login-button

*** Keywords ***
Fill Username
    [Arguments]                      ${username}
    Wait Until Element Is Visible    ${USERNAME_FIELD}    5s
    Input Text                       ${USERNAME_FIELD}    ${username}

Fill Password
    [Arguments]                      ${password}
    Wait Until Element Is Visible    ${PASSWORD_FIELD}    5s
    Input Text                       ${PASSWORD_FIELD}    ${password}

Submit Login
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    5s
    Click Button                     ${LOGIN_BUTTON}