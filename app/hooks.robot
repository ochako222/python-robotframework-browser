*** Settings ***
Library  Browser
Variables    ../env_variables.yml
Resource  ../app/resources/login_page_resources.robot
Resource  ../app/resources/home_page_resources.robot


*** Keywords ***
Login to Syndicate
    Open Syndicate Login Page
    Fill in login form
    Expect home page loaded
    