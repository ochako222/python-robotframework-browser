*** Settings ***
Library  Browser
Variables    ../../env_variables.yml

*** Keywords ***


Navigate By Link
    [Arguments]  ${link}
    Click  css=.headerMenu .menuList a >> text=${link}