*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${SIGNINBUTTON}     xpath=//*[contains(@class, 'MuiButtonBase-root MuiButton-root')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}       xpath=//*[@id='password']
${INVALIDPASSWORD}      xpath=//*[@id='__next']/form/div/div[1]/div[3]/span


*** Test Cases ***
Invalid login to the system
    Open login page
    Type in email
    Type in password
    Click on the sign in button
    Assert invalid login message
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text    ${EMAILINPUT}     user01getnada.com
Type in password
    Input Text    ${PASSWORDINPUT}      Test-134
Click on the sign in button
    Click Element   ${SIGNINBUTTON}
Assert invalid login message
    Wait Until Element Is Visible   ${INVALIDPASSWORD}
    Element Text Should Be  ${INVALIDPASSWORD}  Identifier or password invalid.
    Capture Page Screenshot     alert.png