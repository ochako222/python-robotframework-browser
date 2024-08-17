*** Settings ***
Documentation  Basic example
Resource  ../app/resource.robot
Resource  ../app/hooks.robot

Test Setup  Login to Syndicate

*** Test Cases ***
Create New Folder
    Navigate By Link  Documents
    Expect Documents Page Loaded



