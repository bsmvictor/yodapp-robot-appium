*** Settings ***

Resource    ../resources/base.resource

*** Test Cases ***

Open Home Page
    Start session

    Wait Until Page Contains    Yodapp    10s
    Wait Until Page Contains    Mobile Training    10s
    Wait Until Page Contains    by Papito    10s

    Close session



