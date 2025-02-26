*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem    # เพิ่มเพื่อใช้จัดการไฟล์ YAML
Resource   ./keywords/CommonKeywords.robot
Suite Setup    Open Browser    ${baseurl}    chrome
Suite Teardown    Close Browser

*** Variables ***
${baseurl}       https://futureskill.co/
${email}   padcenter@prachakij.com
${valid_password}     123456

*** Test Cases ***
As a user, I want to login success with valid credentials
    [Documentation]    ทดสอบการล็อกอินด้วยข้อมูลที่ถูกต้อง
    Setup With Initial Login Button    # <- เพิ่มขั้นตอนนี้
    Input Username    ${email}
    Input Password    ${valid_password}
    Click Login Button
    Verify Login Success

*** Keywords ***
Setup With Initial Login Button
    Log To Console    ปุ่มเมนูมองเห็นแล้ว
    CommonKeywords.Wait until element is ready then click element    xpath=//button[@id="react-burger-menu-btn"]
    Log To Console    กดปุ่มเมนูเรียบร้อย
    CommonKeywords.Wait until element is ready then click element    xpath=//button[contains(@class, "w-fit") and contains(text(), "เข้าสู่ระบบ")]   # ปุ่มหน้าแรก
    # อาจต้องรอให้หน้า login โหลด
    Wait Until Page Contains    เข้าสู่ระบบ    timeout=10s    # ปรับข้อความตามหน้า login

Input Username    [Arguments]    ${username}
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@name="email"]
    Input Text    xpath=//input[@name="email"]    ${username}

Input Password    [Arguments]    ${password}
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@name="password"]
    Input Text    xpath=//input[@name="password"]    ${password}

Click Login Button
    CommonKeywords.Wait until element is ready then click element    xpath=//button[contains(text(), "เข้าสู่ระบบ")]    # ปุ่มในหน้า login

Verify Login Success
    CommonKeywords.Wait until page contains element then verify text    สวัสดี คุณ Test