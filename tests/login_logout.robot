*** Settings ***
Documentation  Basic example
Resource  ../app/resources/login_page_resources.robot
Resource  ../app/resources/home_page_resources.robot

*** Test Cases ***
Login User with Password
    [Tags]    smoke
    Open Syndicate Login Page
    Fill in login form
    Expect home page loaded

 Denied Login with Wrong Password
    [Tags]    smoke
    Open Syndicate Login Page
    Fill in login form  Wrong Password
    Expect error message appeared
