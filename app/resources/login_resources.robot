*** Settings ***
Library  Browser
Variables    ../../env_variables.yml

*** Keywords ***
Open Syndicate Login Page
    Open Browser  ${BASE_URL}

Fill In Login Form
    [Arguments]  ${username}=${NONE}  ${password}=${NONE}
    ${username}  Set Variable If  '${username}'=='${NONE}'  ${BASE_USERNAME}  ${username}
    ${password}  Set Variable If  '${password}'=='${NONE}'  ${BASE_USER_PASSWORD}  ${password}

    Fill Text  css=#username  ${username}
    Fill Text  css=#password  ${password}
    Click  css=#submitBtn

Expect Error Message Appeared
    ${element}  Get Element    css=.alert-danger
    Wait For Elements State    ${element}    visible
    ${errorMessage}  Get Text  ${element}
    Should Be Equal  ${errorMessage}  The username or password is incorrect.

Expect Home Page Loaded
    Wait For Elements State    css=.headerRow    visible
    Wait For Elements State    css=.channels    visible 

Login To Syndicate
    Open Syndicate Login Page
    Fill In Login Form
    Expect Home Page Loaded


    

    