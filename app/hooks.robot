*** Settings ***
Library  Browser
Variables    ../env_variables.yml
Resource  ../app/resource.robot


*** Keywords ***
Login to Syndicate
    Open Syndicate Login Page
    Fill in login form
    Expect home page loaded
    