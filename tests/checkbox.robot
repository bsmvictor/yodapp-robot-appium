*** Settings ***

Resource    ../resources/base.resource

*** Test Cases ***

Should mark tags that use appium
    Start session
    Get started
    Navigate to                 Check e Radio
    Go to                       Checkbox     Marque as techs que usam Appium

    @{techs}    Create List    Ruby    Python    Java     Javascript    C#    Robot Framework

    FOR    ${tech}    IN    @{techs}
        Click Element               xpath=//android.widget.CheckBox[contains(@text, "${tech}")]
    END

    Sleep    3s
    Close session

