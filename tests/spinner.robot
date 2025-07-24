*** Settings ***

Resource    ../resources/base.resource

*** Test Cases ***

Should select Jedi

    Start session
    Get started
    Navigate to                      Formulários
    Go to                            Cadastro   Crie sua conta.
    Select Level                     Jedi
    Close session

Should select Padawan

    Start session
    Get started
    Navigate to                      Formulários
    Go to                            Cadastro   Crie sua conta.
    Select Level                     Padawan
    Close session

Should select Sith

    Start session
    Get started
    Navigate to                      Formulários
    Go to                            Cadastro   Crie sua conta.
    Select Level                     Sith
    Close session

Should select Outros

    Start session
    Get started
    Navigate to                      Formulários
    Go to                            Cadastro   Crie sua conta.
    Select Level                     Outros
    Close session

*** Keywords ***

Select Level
    [Arguments]    ${LEVEL}

    Click Element                    id=com.qaxperience.yodapp:id/spinnerJob
    Wait Until Element Is Visible    class=android.widget.ListView
    Click Text                       ${LEVEL}