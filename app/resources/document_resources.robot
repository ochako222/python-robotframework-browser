*** Settings ***
Library  Browser

*** Keywords ***
Create New Folder With Name ${folder_entity}
     Click  css=[data-cy="add-folder-btn"]
     Wait For Elements State    css=[data-cy="new-folder-title"]    visible
    #  Sleep  60s
     Get Text  css=[data-cy="new-folder-title"]  ==  Add new folder
     Fill Text  css=[data-cy="name-text-field"] >> input  ${folder_entity}[title]
     Fill Text  css=[data-cy="description-text-area"]  ${folder_entity}[description]
     Click  css=[data-cy="save-button"]
     Get Text    .documents-breadcrumbs-text    ==   ${folder_entity}[title]

Filter Document ${document}
    Fill Text  css=[placeholder="Start typing name..."]  ${document}
    
    
Select Document By Name ${document} And Click Delete
    ${element}=  Get Element  css=[data-id*="${document}"]
    Wait For Elements State    ${element}    visible
    Click  ${element} >> [data-cy="data-grid-checkbox"]
    Click  css=[data-cy="delete-action-icon"]

Expect Documents Page Loaded
    Wait For Elements State    css=.documents-header    visible
    Wait For Elements State    css=.documents-breadcrumbs    visible
    Wait For Elements State    css=[data-cy="add-folder-btn"]    visible
    Wait For Elements State    css=[data-cy="add-document-btn"]    visible

Confirm Delete Document Modal
    Get Text    css=[data-cy="confirmation-archive-title"]  ==  Archive item
    Click  css=[data-cy="archive-button"]


Expect Document With Name ${document} Deleted
    Wait For Condition    Element States    css=[data-id*="${document}"]    ==    detached

Expect Document With Name ${document} Visible
     Wait For Elements State    css=[data-id*="${document}"]    visible


    



