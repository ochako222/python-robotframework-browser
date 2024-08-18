*** Settings ***
Library  Browser
Variables    ../../env_variables.yml

*** Keywords ***
Expect home page loaded
    Wait For Elements State    css=.headerRow    visible
    Wait For Elements State    css=.channels    visible 

Navigate By Link
    [Arguments]  ${link}
    Click  css=.headerMenu .menuList a >> text=${link}