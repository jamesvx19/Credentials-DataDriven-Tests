*** Settings ***
Documentation   Use this layer to get data from external files
Library         ../CustomLibs/Csv.py


*** Keywords ***
Get CSV Data
    [Arguments]    ${FilePath}
    @{Data} =    read csv file  ${FilePath}       # you get the data from the CustomsLib Csv.py file.
    [Return]  @{Data}        # [Return] for RF. Return in the case of python





