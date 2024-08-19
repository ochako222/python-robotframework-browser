*** Settings ***
Documentation  Basic example
Resource  ../app/resources/document_resources.robot
Resource  ../app/hooks.robot
Library  ../app/Types.py

*** Variables ***
&{NEW_FOLDER_NAME}  title=TEST_AUTOMATION_FOLDER  description=TEST_AUTOMATION_DESCRIPTION

*** Test Cases ***
Create New Folder
    [Tags]  smoke
    [Setup]  Login to Syndicate
    Navigate By Link  Documents
    Expect Documents Page Loaded
    Create New Folder With Name ${NEW_FOLDER_NAME}
    Navigate By Link  Documents
    Expect Documents Page Loaded
    Filter Document ${NEW_FOLDER_NAME}[title]
    Select Document By Name ${NEW_FOLDER_NAME}[title] And Click Delete
    Confirm Delete Document Modal
    Expect Document With Name ${NEW_FOLDER_NAME}[title] Deleted

    