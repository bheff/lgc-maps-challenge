*** Settings ***
Documentation  Keywords file for google maps
Resource  %{RESOURCE_ROOT}/pages/maps.robot

*** Keywords ***
Go to google maps website
    Maps.Open google maps page

Enter ${location} in the search box
    Maps.Enter ${location} in the search input

Click the Search icon
    Maps.Click on the search icon

Verify left panel has ${location} as a headline text
    Maps.Verify left panel heading contains ${location}

Click Directions icon
    Maps.Click on the directions icon

Verify destination field is ${location}
    Maps.Verify the destination field content is ${location}