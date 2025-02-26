*** Settings ***
Library  SeleniumLibrary
Resource  CommonKeywords.robot

*** Keywords ***
user login to future skill platform with &{username} and ${password}
    CommonKeywords.Wait until element is ready then click element  xpath=//button[text()='เข้าสู่ระบบ']
