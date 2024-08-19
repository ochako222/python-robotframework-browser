*** Settings ***
Library  Browser
Variables    ../env_variables.yml
Library    ../api/DocumentsService.py  ${CORE_URL}

*** Keywords ***
Delete Folder By Name If Exist
    [Arguments]  ${folder_title}
    ${token}=    Get Token  ${BASE_USERNAME}  ${BASE_USER_PASSWORD}
    ${folders}=  Get All Documents By Name  ${token}[name]  ${token}[value]  ${folder_title}  root

    IF  'list' in str(type(${folders})) and len(${folders}) > 0
        ${id}=    Set Variable    ${folders[0]['id']}
        Delete Folder By Id  ${token}[name]    ${token}[value]    ${id}
    ELSE
        Log To Console    Folder with title "${folder_title}" does not exist, no action taken.
    END

Create Folder With Name
    [Arguments]  ${folder_title}  ${folder_description}
    ${token}=    Get Token  ${BASE_USERNAME}  ${BASE_USER_PASSWORD}
    Create New Folder In Root  ${token}[name]  ${token}[value]  ${folder_title}  ${folder_description}