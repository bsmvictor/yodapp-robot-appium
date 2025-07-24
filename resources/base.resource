*** Settings ***

Library    AppiumLibrary

*** Variables ***
${START_BUTTON}    QAX

*** Keywords ***

Start session
    Open Application
    ...    http://localhost:4723   
    ...    platformName=Android    
    ...    deviceName=Android Emulator    
    ...    automationName=UIAutomator2    
    ...    app=/${EXECDIR}/app/yodapp-beta.apk    
    ...    udid=emulator-5554    
    ...    autoGrantPermissions=true


Get started
    Wait Until Page Contains    ${START_BUTTON}    5s
    Click Text                  ${START_BUTTON}

Navigate to
    [Arguments]    ${TEXT_ITEM}
    ${HAMBURGUER_BUTTON}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]

    Wait Until Element Is Visible    ${HAMBURGUER_BUTTON}   5s
    Click Element                    ${HAMBURGUER_BUTTON}

    ${MENU_ITEM}    Set Variable    xpath=//*[@resource-id="com.qaxperience.yodapp:id/navView"]//*[@text="${TEXT_ITEM}"]

    Wait Until Element Is Visible        ${MENU_ITEM}   5s
    Click Element                        ${MENU_ITEM}

Go to
    [Arguments]    ${ITEM}    ${CHECKPOINT}
    Wait Until Page Contains    ${ITEM}    5s
    Click Text                  ${ITEM}
    Wait Until Page Contains    ${CHECKPOINT}    5s


Close session
    Close Application