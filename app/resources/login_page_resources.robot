*** Settings ***
Library  Browser
Variables    ../../env_variables.yml

*** Keywords ***
Open Syndicate Login Page
    Open Browser  ${BASE_URL}

Fill in login form
    [Arguments]  ${username}=${NONE}  ${password}=${NONE}
    ${username}  Set Variable If  '${username}'=='${NONE}'  ${BASE_USERNAME}  ${username}
    ${password}  Set Variable If  '${password}'=='${NONE}'  ${BASE_USER_PASSWORD}  ${password}

    Fill Text  css=#username  ${username}
    Fill Text  css=#password  ${password}
    Click  css=#submitBtn



Expect error message appeared
    ${element}  Get Element    css=.alert-danger
    Wait For Elements State    ${element}    visible
    ${errorMessage}  Get Text  ${element}
    Should Be Equal  ${errorMessage}  The username or password is incorrect.


    

    