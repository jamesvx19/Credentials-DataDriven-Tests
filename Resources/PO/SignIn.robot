*** Settings ***
Library  SeleniumLibrary
Resource  ../../Data/InputData.robot

*** Variables ***
${SIGN_IN_EMAIL} =          xpath=//*[@id="username"]
${SIGN_IN_PASSWORD} =       xpath=//*[@id="password"]
${LOGIN_SUBMIT_BUTTON} =    //*[@id="login"]/button/i

*** Keywords ***
Navigate To
    ${SiteUrl} =      Set Variable    ${BASE_URL}[${ENVIRONMENT}]     # so you get the value of prod key in ${BASE_URL} dictionary
    ${SignInUrl} =    Catenate  SEPARATOR=/     ${SiteUrl}      ${LOGIN_PATH}     # append login
    go to  ${SignInUrl}

Enter Credentials
    [Arguments]  ${Credentials}     # I suppose it's a scalar, a single list is passed??
    Log    Email: ${Credentials[0]}
    Log    Password: ${Credentials}[1]
    Log    Error: ${Credentials}[2]
    #Log    Keys: ${Credentials.keys()}      # to get a list of keys in the dictionary

    IF    '${Credentials[0]}' != '#BLANK'       # note the ' ' otherwise it will consider '#BLANK' as a variablem and need to put '${Credentials.Email}'
                                                   # otherwise it will compare #BLANK with '#BLANK' and will consider them unequal.
        Input Text    ${SIGN_IN_EMAIL}    ${Credentials}[0]
    END

    IF  '${Credentials[1]}' != '#BLANK'
        Input Text    ${SIGN_IN_Password}    ${Credentials}[1]
    END
#    sleep   3s
Click Submit
    Click Element  ${LOGIN_SUBMIT_BUTTON}

Verify Error Message
    [Arguments]  ${Credentials}  # [Arguments]  ${ExpectedErrorMessage}
    Page Should Contain  ${Credentials[2]}

Clear Input Fields
    Clear Element Text  ${SIGN_IN_EMAIL}
    Clear Element Text  ${SIGN_IN_PASSWORD}

############################## Before replacing dectionary items with list items #################################

#Enter Credentials
#    [Arguments]  &{Credentials}
#    Log    Email: ${Credentials}[Email]
#    Log    Password: ${Credentials}[Password]
#    Log    Error: ${Credentials}[ExpectedErrorMessage]
#    Log    Keys: @{Credentials.keys()}      # to get a list of keys in the dictionary
#
#    IF    '${Credentials}[Email]' != '#BLANK'       # note the ' ' otherwise it will consider '#BLANK' as a variablem and need to put '${Credentials.Email}'
#                                                   # otherwise it will compare #BLANK with '#BLANK' and will consider them unequal.
#        Input Text    ${SIGN_IN_EMAIL}    ${Credentials}[Email]
#    END
#
#    IF  '${Credentials}[Password]' != '#BLANK'
#        Input Text    ${SIGN_IN_Password}    ${Credentials}[Password]
#    END

##################################################################################################################






