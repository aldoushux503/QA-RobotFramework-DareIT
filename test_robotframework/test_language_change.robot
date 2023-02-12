*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${SIGNINBUTTON}     xpath=//*[contains(@class, 'MuiButtonBase-root MuiButton-root')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}       xpath=//*[@id='password']
${PAGELOGO}       xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${LANGUAGEBUTTON}       xpath=//*[@id="__next"]/div[1]/div/div/div/ul[2]/div[1]

*** Test Cases ***
Language change
    Open login page
    Type in email
    Type in password
    Click on the sign in button
    Assert dashboard
    Click on the language button
    Assert language
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text    ${EMAILINPUT}     user01@getnada.com
Type in password
    Input Text    ${PASSWORDINPUT}      Test-1234
Click on the sign in button
    Click Element   ${SIGNINBUTTON}
Assert dashboard
    Wait Until Element Is Visible   ${PAGELOGO}
    Title Should Be     Scouts panel
    Capture Page Screenshot     alert.png
Click on the language button
    Click Element   ${LANGUAGEBUTTON}
Assert language
    Element Text Should Be  ${LANGUAGEBUTTON}    English
    Capture Page Screenshot     alert.png