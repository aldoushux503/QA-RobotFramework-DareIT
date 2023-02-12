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
${SIGNOUTBUTTON}        xpath=//*[@id="__next"]/div[1]/div/div/div/ul[2]/div[2]

*** Test Cases ***
Sign out of the system
    Open login page
    Type in email
    Type in password
    Click on the sign in button
    Assert dashboard
    Click Sign out
    Assert login page title
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
Click Sign out
    Click Element   ${SIGNOUTBUTTON}
Assert login page title
    Wait Until Element Is Visible   ${SIGNINBUTTON}
    Title Should Be     Scouts panel - sign in
    Capture Page Screenshot     alert.png