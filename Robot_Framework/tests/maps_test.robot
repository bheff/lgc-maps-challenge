*** Settings ***
Documentation  Verify google maps search and directions functionality
Resource  %{RESOURCE_ROOT}/maps_keywords.robot

*** Test Cases ***
Verify google maps search and directions functionality to Dublin
    [Tags]  google-maps-dublin
    Go to google maps website
    Enter Dublin in the search box
    Click the Search icon
    Verify left panel has Dublin as a headline text
    Click Directions icon
    Verify destination field is Dublin

Verify google maps search and directions functionality to Galway
    [Tags]  google-maps-galway
    Go to google maps website
    Enter Galway in the search box
    Click the Search icon
    Verify left panel has Galway as a headline text
    Click Directions icon
    Verify destination field is Galway