*** Settings ***

Resource    ../resources/base.resource

*** Test Cases ***

Should remove Darth Vader
    Start session
    Get started
    Navigate to                      Star Wars
    Go to                            Lista   Darth Vader

   ${POSITIONS}    Get Element Location             xpath=//android.widget.TextView[@text="Darth Vader"]/../../..//*[contains(@resource-id,"indicator")]

   ${START_X}    Set Variable    ${POSITIONS}[x]
   ${START_Y}    Set Variable    ${POSITIONS}[y]
   ${OFFSET_X}    Evaluate    ${POSITIONS}[x] - 600
   ${OFFSET_Y}    Set Variable    ${POSITIONS}[y]

    Swipe    ${START_X}    ${START_Y}    ${OFFSET_X}    ${OFFSET_Y}    1000
    Click Element    id=com.qaxperience.yodapp:id/btnRemove
    Wait Until Page Does Not Contain    Darth Vader    5s
    Close session
