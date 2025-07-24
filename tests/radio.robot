*** Settings ***

Resource    ../resources/base.resource

*** Test Cases ***

Should mark tags that use appium
    Start session
    Get started
    Navigate to                 Check e Radio
    Go to                       Botões de radio     Escolha sua linguagem preferida
    Click Element               xpath=//android.widget.RadioButton[contains(@text, "C#")]
    Close session
