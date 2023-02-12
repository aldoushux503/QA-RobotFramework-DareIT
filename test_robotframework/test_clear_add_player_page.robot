*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${SIGNINBUTTON}     xpath=//*[contains(@class, 'MuiButtonBase-root MuiButton-root')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${MAINPAGELOGO}       xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${ADDPLAYERSHORTCUT}        xpath=//*[@id="__next"]/div[1]/main/div[3]/div[2]/div/div/a/button
${ADDPLAYERTITLE}       xpath=//*[@id="__next"]/div[1]/main/div[2]/form/div[1]/div/span
${EMAILFIELD}       xpath=//input[@name="email"]
${PHONEFIELD}       xpath=//input[@name="phone"]
${AGEFIELD}       xpath=//input[@name="age"]
${LEVELFIELD}       xpath=//input[@name="level"]
${DISTRICTFIELD}       xpath=//*[@id="mui-component-select-district"]
${DISTRICTCHOOSE}       xpath=//*[text()="Masovia"]
${NAMEFIELD}       xpath=//input[@name="name"]
${WEIGHTFIELD}       xpath=//input[@name="weight"]
${LEGFIELD}       xpath=//*[@id="mui-component-select-leg"]
${LEGCHOOSE}       xpath=//*[@id="menu-leg"]/div[3]/ul/li[2]
${MAINPOSITIONFIELD}       xpath=//input[@name="mainPosition"]
${ACHIEVEMENTSFIELD}       xpath=//input[@name="achievements"]
${SURNAMEFIELD}       xpath=//input[@name="surname"]
${HEIGHTFIELD}       xpath=//input[@name="height"]
${CLUBFIELD}       xpath=//input[@name="club"]
${SECONDPOSITIONFIELD}       xpath=//input[@name="secondPosition"]
${WEBLACZYFIELD}       xpath=//input[@name="webLaczy"]
${NINETYFIELD}       xpath=//input[@name="web90"]
${FACEBOOKFIELD}       xpath=//input[@name="webFB"]
${CLEARBUTTON}       xpath=//*[@id="__next"]/div[1]/main/div[2]/form/div[3]/button[2]
${CLEAREDFIELD}

*** Test Cases ***
Clear add player page
    Open login page
    Type in email
    Type in password
    Click on the sign in button
    Assert dashboard
    Click on Add Player button
    Assert Add Player
    Type in email field
    Type in phone
    Type in age
    Type in level
    Type in district
    Type in name
    Type in weight
    Type in leg
    Type in main position
    Type in achievement
    Type in surname
    Type in height
    Type in club
    Type in second position
    Type in laczy pilka
    Type in ninety
    Type in facebook
    Click on the clear button
    Assert clear add player fields
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
    Wait Until Element Is Visible   ${MAINPAGELOGO}
    Title Should Be     Scouts panel
    Capture Page Screenshot     alert.png
Click on Add Player button
    Click Element   ${ADDPLAYERSHORTCUT}
Assert Add Player
    Wait Until Element Is Visible   ${ADDPLAYERTITLE}
    Title Should Be     Add player
    Capture Page Screenshot     alert.png
Type in email field
    Input Text    ${EMAILFIELD}      cat_lover@gmail.com
Type in phone
    Input Text    ${PHONEFIELD}      +48884404404
Type in age
    Input Text    ${AGEFIELD}      05.02.2023
Type in level
    Input Text    ${LEVELFIELD}      Professional
Type in district
    Click Element   ${DISTRICTFIELD}
    Click Element   ${DISTRICTCHOOSE}
Type in name
    Input Text    ${NAMEFIELD}      Catt
Type in weight
    Input Text    ${WEIGHTFIELD}      70
Type in leg
    Click Element    ${LEGFIELD}
    Click Element    ${LEGCHOOSE}
Type in main position
    Input Text    ${MAINPOSITIONFIELD}      Quarterback
Type in achievement
    Input Text    ${ACHIEVEMENTSFIELD}      Grammy
Type in surname
    Input Text    ${SURNAMEFIELD}      Paw
Type in height
    Input Text    ${HEIGHTFIELD}      170
Type in club
    Input Text    ${CLUBFIELD}      Real Madrid
Type in second position
    Input Text    ${SECONDPOSITIONFIELD}      Goalkeeper
Type in laczy pilka
    Input Text    ${WEBLACZYFIELD}      text
Type in ninety
    Input Text    ${NINETYFIELD}      text
Type in facebook
    Input Text    ${FACEBOOKFIELD}      cat_love.facebook.com
Click on the clear button
    Click Element   ${CLEARBUTTON}
Assert clear add player fields
    Element Text Should Be  ${NAMEFIELD}    ${CLEAREDFIELD}
    Capture Page Screenshot     alert.png
