*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Wait until page contains element then verify text  [Arguments]  ${expected_text}
    Wait Until Page Contains Element  xpath=//*[contains(text(), "${expected_text}")]
    Element Text Should Be  xpath=//*[contains(text(), "${expected_text}")]  ${expected_text}

Wait until element is ready then click element  [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    Click Element  ${locator}