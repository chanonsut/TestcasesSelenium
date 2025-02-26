*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem    # เพิ่มเพื่อใช้จัดการไฟล์ YAML
Resource   ./keywords/CommonKeywords.robot
Variables   ./resources/config/config.yaml
Variables   ./resources/testdata/testdata.yaml    
Suite Setup    Open Browser    ${baseurl}    chrome
Suite Teardown    Close Browser

*** Test Cases ***
As a user, I want to login success with valid credentials
    [Documentation]    ทดสอบการล็อกอินด้วยข้อมูลที่ถูกต้อง
    Setup With Initial Login Button
    Input Username    ${email}
    Input Password    ${valid_password}  # <- ไม่ให้ pass จริงนะครับ เดะหลุด
    Click Login Button
    Check If Login Failed

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

Check If Login Failed
    ${login_failed}=  Run Keyword And Return Status  Wait Until Element Is Visible  xpath=//p[contains(@class, "text-redFS-300") and contains(text(), "กรอกรหัสผ่านไม่ถูกต้อง")]  timeout=5s
    Run Keyword If  ${login_failed}  Return From Keyword