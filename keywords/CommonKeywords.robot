*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Wait until page contains element then verify text  
    [Arguments]  ${expected_text}
    Wait Until Page Contains  ${expected_text}  timeout=10s
    ${actual_text}=  Get Text  xpath=//*[contains(text(), "${expected_text}")]
    Should Be Equal As Strings  ${actual_text}  ${expected_text}


Wait until element is ready then click element  
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}  timeout=10s
    Wait Until Element Is Enabled  ${locator}  timeout=5s
    Click Element  ${locator}
