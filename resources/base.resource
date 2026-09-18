*** Settings ***

Library    AppiumLibrary
Library    Collections

*** Variables ***
${START_BUTTON}    QAX
${EXECUTION_TARGET}    local
${BROWSERSTACK_APP}    ${EMPTY}
${BROWSERSTACK_USERNAME}    ${EMPTY}
${BROWSERSTACK_ACCESS_KEY}    ${EMPTY}
${BROWSERSTACK_BUILD}    local

*** Keywords ***

Start session
    IF    '${EXECUTION_TARGET}' == 'browserstack'
        &{BROWSERSTACK_OPTIONS}    Create Dictionary
        ...    userName=${BROWSERSTACK_USERNAME}
        ...    accessKey=${BROWSERSTACK_ACCESS_KEY}
        ...    projectName=Yodapp Robot
        ...    buildName=${BROWSERSTACK_BUILD}
        ...    sessionName=${TEST NAME}
        Open Application
        ...    https://hub.browserstack.com/wd/hub
        ...    platformName=Android
        ...    deviceName=Google Pixel 7
        ...    platformVersion=13.0
        ...    automationName=UIAutomator2
        ...    app=${BROWSERSTACK_APP}
        ...    bstack:options=${BROWSERSTACK_OPTIONS}
        ...    autoGrantPermissions=true
    ELSE
        Open Application
        ...    http://localhost:4723
        ...    platformName=Android
        ...    deviceName=Android Emulator
        ...    automationName=UIAutomator2
        ...    app=/${EXECDIR}/app/yodapp-beta.apk
        ...    udid=emulator-5554
        ...    autoGrantPermissions=true
    END


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
