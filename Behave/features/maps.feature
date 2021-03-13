Feature: Search google maps and get directions
    Scenario: Search google maps
        Given The user is at the applications website
        When The user enters "Dublin" in the search box
        And Clicks on the search icon
        And Verify left panel has "Dublin" as a headline text
        And Clicks on the directions icon
        Then Verify destination field is "Dublin"
