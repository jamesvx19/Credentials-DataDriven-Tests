*** Settings ***
Documentation  Demonstrate a need for data-driven testing
Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/HeroApp.robot
Resource  ../Resources/DataManager.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

# robot -d results tests/Hero.robot

*** Variables ***

*** Test Cases ***
Should see correct error messages with invalid logins
    @{InvalidLoginScenarios} =    DataManager.Get CSV Data    ${INVALID_CREDENTIALS_PATH_CSV}
    HeroApp.Login with Many Invalid Credentials   @{InvalidLoginScenarios}

#Unregistered user should see correct error message at login
#    HeroApp.Navigate to Sign In Page
#    HeroApp.Attempt Login  &{UNREGISTERED_USER}  # ${UNREGISTERED_USER} with ${Credentials} in HeroAppwill work but prefer to use & for consistency.
#    HeroApp.Verify Login Page Error Message  ${UNREGISTERED_USER}[ExpectedErrorMessage]
#
#Login with invalid password should show correct error message
#    HeroApp.Navigate to Sign In Page
#    HeroApp.Attempt Login  &{INVALID_PASSWORD_USER}
#    HeroApp.Verify Login Page Error Message  ${INVALID_PASSWORD_USER}[ExpectedErrorMessage]
#
#Login with blank email and password should show correct error message
#    HeroApp.Navigate to Sign In Page
#    HeroApp.Attempt Login  &{BLANK_CREDENTIALS_USER}
#    HeroApp.Verify Login Page Error Message  ${BLANK_CREDENTIALS_USER}[ExpectedErrorMessage]