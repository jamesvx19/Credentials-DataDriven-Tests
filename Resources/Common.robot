*** Settings ***
Library  SeleniumLibrary
Resource  ../Data/InputData.robot

*** Variables ***

*** Keywords ***
Begin Web Test
    Open Browser  about:blank   ${BROWSER}     #firefox is the default browser for SeleniumLibrary

    Maximize Browser Window
    sleep    3s
End Web Test
    Close All Browsers