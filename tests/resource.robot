*** Settings ***
Library  Browser

*** Variables ***
${URL}  https://marketsquare.github.io/robotframework-browser/Browser.html
${SEARCH_FIELD}  //input[@placeholder="Search"]
${CLICK_BROWSER_KEYWORD}  //li//a//span[contains(text(), "Open Browser")]


*** Keywords ***
Open Webpage
    Open Browser  ${URL}

Search Keywords
    Fill Text  ${SEARCH_FIELD}  Download

Click Keyword
    Click  ${CLICK_BROWSER_KEYWORD}