*** Settings ***
Library    SeleniumLibrary    


Suite Setup    Log    I am in Suite Setup    
Suite Teardown    Log    I am in Suite Teardown    
Test Setup    Log    I am in Test Setup    
Test Teardown    Log    I am in Test teardown

Default Tags    smoke

*** Test Cases ***

FirstTest
    [Tags]    sanity
    Log    "Hello World"
    

FirstSelTest
    Open Browser    https://google.com/    chrome
    Input Text    name=q    Automation step by step
    Press Keys    name=q    ENTER
    Sleep    5    
    Close Browser
    Log    Test Completed
    

FirstLoginTest
    [Documentation]    This is sample login
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    5
    LoginKW
    Maximize Browser Window  
    Capture Element Screenshot   id=welcome
    Click Element    //a[@id='menu_time_viewTimeModule']
    Input Text    //input[@id='employee']    Linda Anderson
    Click Element    //input[@id='btnView']
    ${CheckMessage}=    Get Text    //div[@class='message warning']  
    Run Keyword If    '${CheckMessage}' == 'No Timesheets Found'    AddTimeSheet               
    Click Element    id=welcome    
    Click Element    link=Logout 
    Close Browser   
    Log    Test Completed
    Log    Test was run by %{username} on %{os}
    
*** Variables ***

${URL}         https://opensource-demo.orangehrmlive.com/
@{Credential}    Admin    admin123
&{Login}    username=Admin    password=admin123


*** Keywords ***

LoginKW
    Input Text    id=txtUsername    ${Login}[username]
    Input Password    id=txtPassword    ${Login}[password]
    Click Button    id=btnLogin  
    

AddTimeSheet
    Log    TimeSheet Needs to be Added
    Click Element    //input[@id='btnAddTimesheet']    
           
    
        