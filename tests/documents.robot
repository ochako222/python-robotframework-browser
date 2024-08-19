*** Settings ***
Documentation  Documents Feature
Resource  ../app/resources/document_resources.robot
Resource  ../app/resources/login_resources.robot
Resource  ../app/resources/navigation_resources.robot
Resource  ../app/hooks.robot

Suite Setup  Login To Syndicate

*** Variables ***
&{NEW_FOLDER_FIRST}  title=AUTOMATION_FOLDER_FIRST  description=TEST_AUTOMATION_DESCRIPTION
&{NEW_FOLDER_SECOND}  title=AUTOMATION_FOLDER_SECOND  description=TEST_AUTOMATION_DESCRIPTION

*** Test Cases ***
Create New Folder
    [Tags]  smoke
    Navigate By Link  Documents
    Expect Documents Page Loaded
    Create New Folder With Name ${NEW_FOLDER_FIRST}
    Navigate By Link  Documents
    Expect Documents Page Loaded
    Filter Document ${NEW_FOLDER_FIRST}[title]
    Select Document By Name ${NEW_FOLDER_FIRST}[title] And Click Delete
    Confirm Delete Document Modal
    Expect Document With Name ${NEW_FOLDER_FIRST}[title] Deleted

Create Folder Via API
    [Tags]  api
    [Setup]  Delete Folder By Name If Exist  ${NEW_FOLDER_SECOND}[title]

    Navigate By Link  Documents
    Expect Documents Page Loaded
    Filter Document ${NEW_FOLDER_SECOND}[title]
    Expect Document With Name ${NEW_FOLDER_SECOND}[title] Deleted

    Create Folder With Name  ${NEW_FOLDER_SECOND}[title]  ${NEW_FOLDER_SECOND}[description]

    Navigate By Link  Documents
    Expect Documents Page Loaded
    Filter Document ${NEW_FOLDER_SECOND}[title]
    Expect Document With Name ${NEW_FOLDER_SECOND}[title] Visible

    [Teardown]  Delete Folder By Name If Exist  ${NEW_FOLDER_SECOND}[title]

  

    