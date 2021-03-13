*** Settings ***
Documentation   UI Test Suite for Sigil
Suite Setup     ${setup}
Suite Teardown  Close All Browsers
Library         OperatingSystem
Library         SeleniumLibrary

*** Variables ***
${setup}     Open App Page
${browser}   chrome
${app_url}   https://www.google.com/maps

*** Keywords ***
Open App Page
    Set Log Level  Trace
    Set Environment Vars
    Set Selenium Implicit Wait  30
    Set Selenium Timeout  30
    Log To Console  Opening ${browser} Browser.
    Open Browser  about:blank  ${browser}  options=add_argument("--disable-popup-blocking"); add_argument("--ignore-certificate-errors")
    Maximize Browser Window
    Set Global Variable  ${app_url}

Set Environment Vars
    Set Environment Variable  RESOURCE_ROOT  ${CURDIR}/resources

