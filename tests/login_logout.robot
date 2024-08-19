*** Settings ***
Documentation  Basic example
Resource  ../app/resources/login_resources.robot


*** Test Cases ***
Login User with Password
    [Tags]    smoke
    Open Syndicate Login Page
    Fill In Login Form
    Expect Home Page Loaded

 Denied Login with Wrong Password
    [Tags]    regression
    Open Syndicate Login Page
    Fill In Login Form  Wrong Password
    Expect Error Message Appeared
