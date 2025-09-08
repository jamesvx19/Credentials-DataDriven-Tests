*** Settings ***
Resource  ./PO/SignIn.robot

*** Keywords ***
HeroApp.Login with Many Invalid Credentials
    [Arguments]     @{InvalidLoginScenarios}
    FOR  ${LoginScenario}  IN  @{InvalidLoginScenarios}     # so you will get 1 item of the list instead of the entire list
        run keyword and continue on failure    Navigate to Sign In Page                # he used - SignIn.Navigate To
        run keyword and continue on failure    Attempt Login  ${LoginScenario}
        run keyword and continue on failure    Verify Login Page Error Message  ${LoginScenario}
    END

Navigate to Sign In Page
    SignIn.Navigate To

Attempt Login
    [Arguments]  ${LoginScenario}              # ${Credentials}  - will give Keyword 'HeroApp.Attempt Login' expected 1 argument, got 0.
    SignIn.Enter Credentials  ${LoginScenario}
    SignIn.Click Submit
    Sleep  1s

Verify Login Page Error Message
    [Arguments]  ${LoginScenario}
    SignIn.Verify Error Message  ${LoginScenario}

