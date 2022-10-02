*** Settings ***
Documentation  Page Object for google maps
Library        SeleniumLibrary
Library        String

*** Variables ***
${cookies_accepted}   false
${cookie_consent}     xpath=//*[@id="yDmH0d"]//button[@aria-label="Accept all"]
${search_box}         id=searchboxinput
${search_icon}        id=searchbox-searchbutton
${panel_heading}      css=.DUwDvf.fontHeadlineLarge
${directions_icon}    xpath=//img[@alt='Directions']
${destination_input}  xpath=//*[@id="directions-searchbox-1"]//*/input

*** Keyword ***
Open google maps page
    Log To Console  \nNavigating to url.
    Go To  ${app_url}
    Run Keyword If   "${cookies_accepted}"=="true"   Return From Keyword
    Cookie Consent

Cookie Consent
    Log To Console  \nAccepting cookies.
    Wait Until Page Contains Element  ${cookie_consent}
    Click Element  ${cookie_consent}
    Set Global Variable  ${cookies_accepted}  true

Enter ${location} in the search input
    Log To Console  \nGoing to search for ${location}.
    Wait Until Page Contains Element  ${search_box}
    Input Text  ${search_box}  ${location}

Click on the search icon
    Log To Console  \nSubmitting the search.
    Click Button  ${search_icon}

Verify left panel heading contains ${location}
    Log To Console  \nVerifying the left panel heading.
    Wait Until Page Contains Element  ${panel_heading}
    ${ui_heading}  Get Text  ${panel_heading}
    Should Be Equal  ${ui_heading}  ${location}

Click on the directions icon
    Log To Console  \nClicking on the directions icon.
    Click Image  ${directions_icon}

Verify the destination field content is ${location}
    Log To Console  \nVerifying the destination field content.
    Wait Until Page Contains Element  ${destination_input}
    ${ui_destination}  Get Element Attribute  ${destination_input}  aria-label
    ${ui_destination}  Replace String  ${ui_destination}  Destination  ${EMPTY}
    ${ui_destination}  Strip String  ${ui_destination}
    #Should Be Equal  ${ui_destination}  ${location}
    Should Contain  ${ui_destination}  ${location}
    