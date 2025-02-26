*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem    # เพิ่มเพื่อใช้จัดการไฟล์ YAML
Resource   ./keywords/CommonKeywords.robot
Resource   ./resources/config/config.yaml
Resource   ./resources/testdata/testdata.yaml    
Suite Setup    Open Browser    ${baseurl}    chrome
Suite Teardown    Close Browser

*** Test Cases ***
As a user, I want to login success with valid credentials
    [Documentation]    ทดสอบการล็อกอินด้วยข้อมูลที่ถูกต้อง
    Input Username    ${email}
    Input Password    ${valid_password}
    Click Login Button
    Verify Login Success

*** Keywords ***
Input Username    [Arguments]    ${username}
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@id="username"]    # เปลี่ยน xpath ตามหน้าเว็บจริง
    Input Text    xpath=//input[@id="username"]    ${username}

Input Password    [Arguments]    ${password}
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@id="password"]    # เปลี่ยน xpath ตามหน้าเว็บจริง
    Input Text    xpath=//input[@id="password"]    ${password}

Click Login Button
    CommonKeywords.Wait until element is ready then click element    xpath=//button[contains(text(), "ล็อกอิน")]    # เปลี่ยน xpath ตามปุ่มจริง

Verify Login Success
    CommonKeywords.Wait until page contains element then verify text    ยินดีต้อนรับ    # เปลี่ยนข้อความตามที่หน้าเว็บแสดงหลังล็อกอิน