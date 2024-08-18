*** Settings ***
Documentation  Basic example
Resource  ../app/resources/document_resources.robot
Resource  ../app/hooks.robot

# Test Setup  Login to Syndicate
*** Variables ***
${NEW_FOLDER_NAME}  Evaluate  FolderEntity("NewFolder", "My Awesome Folder") 

*** Test Cases ***
Create New Folder
    [Tags]  smoke
    [Setup]  Login to Syndicate
    Navigate By Link  Documents
    Expect Documents Page Loaded
    Create New Folder With Name ${NEW_FOLDER_NAME}
    Navigate By Link  Documents
    Expect Documents Page Loaded
    Filter Document ${NEW_FOLDER_NAME}
    Delete Folder With Name ${NEW_FOLDER_NAME}
    