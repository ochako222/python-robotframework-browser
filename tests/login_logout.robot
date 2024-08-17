*** Settings ***
Documentation  Basic example
Resource  ../app/resource.robot

*** Test Cases ***
User is able to log in and then logout
    Open Syndicate Login Page
    Fill in login form
    Sleep  2s
    Expect home page loaded

 User should receive the error message after passing incorrect credentials
    Open Syndicate Login Page
    Fill in login form  Wrong Password
    Sleep  2s
    Expect error message appeared
