*** Settings ***
Documentation  Basic example
Resource  resource.robot


*** Test Cases ***
Open Browser Page
    Open Syndicate Login Page
    Fill in login form
    Expect home page loaded