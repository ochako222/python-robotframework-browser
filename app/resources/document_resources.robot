*** Settings ***
Library  Browser
Variables    ../../env_variables.yml

*** Keywords ***
Create New Folder With Name ${folder_entity}
     Click  css=[data-cy="add-folder-btn"]
     Wait For Elements State    css=[data-cy="new-folder-title"]    visible
     Get Text  css=[data-cy="new-folder-title"]  visible
     Fill Text  css=[data-cy="name-text-field"] >> input  ${folder_entity}.name
     Fill Text  css=[data-cy="description-text-area"]  ${folder_entity}.description
     Click  css=[data-cy="save-button"]
     Get Text    .documents-breadcrumbs-text    ==   ${folder_entity}.name

Filter Document ${folder_entity}
    Fill Text  placeholder=Start typing name...  ${folder_entity}.name
    
    

Delete Folder With Name ${folder_entity}
    ${element}=  Get Element  css=[data-id*="Foo"]
    Wait For Elements State    ${element}    visible
    Click  ${element} >> [data-cy="data-grid-checkbox"]
    Click  css=[data-cy="delete-action-icon"]
    Wait For Condition    Element States    css=[data-id*="Foo"]    ==    detached

Expect Documents Page Loaded
    Wait For Elements State    css=.documents-header    visible
    Wait For Elements State    css=.documents-breadcrumbs    visible
    Wait For Elements State    css=[data-cy="add-folder-btn"]    visible
    Wait For Elements State    css=[data-cy="add-document-btn"]    visible


    



