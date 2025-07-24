*** Settings ***

Library    AppiumLibrary

*** Test Cases ***

Open Home Page

    Open Application
    ...    http://localhost:4723   
    ...    platformName=Android    
    ...    deviceName=Android Emulator    
    ...    automationName=UIAutomator2    
    ...    app=/${EXECDIR}/app/yodapp-beta.apk    
    ...    udid=emulator-5554    
    ...    autoGrantPermissions=true

    Wait Until Page Contains    Yodapp    10s
    Wait Until Page Contains    Mobile Training    10s
    Wait Until Page Contains    by Papito    10s

    Close Application    




