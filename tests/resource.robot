*** Settings ***
Library  Browser

*** Variables ***
${URL}  https://portal3.qa.bravais.com

*** Keywords ***
Open Syndicate Login Page
    Open Browser  ${URL}

Fill in login form
    Fill Text  css=#username  oleksandr.chako+1@xyleme.com
    Fill Text  css=#password  Mypass@123
    Click  css=#submitBtn

Expect home page loaded
    # TODO: fix this part
    # Wait For Elements State    css=.favorites-grid:nth-of-type(1)   visible
    Wait For Elements State    css=.headerRow    visible
    Wait For Elements State    css=.channels    visible 

    