*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${baseurl}        http://10.100.20.34:9190/web/guest/covidquote
${browser}        chrome
${prospername}    Logi
${mobilenumber}    9000080901
${email_id}       QCTEAM1@XERAGO.MAIL
${Lastname}       Mohan
${pan no}         AAAPZ1234C

*** Test Cases ***
Testcase1
    #Local browser launch
    Jenkins browser launch
    Proposer get details
    Insured 1 member covered
    1 insured dob details
    Medical question NO
    Premium continue button
    Proposer details    Mohan    Student    hucde1234r

*** Keywords ***
Jenkins browser launch
    Set Selenium Speed    1s
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    no-sandbox
    Create WebDriver    Chrome    chrome_options=${chrome_options}
    Go To    ${baseurl}
    Maximize Browser Window
    Set Browser Implicit Wait    15s

Local browser launch
    Set Selenium Speed    1s
    Open Browser    ${baseurl}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    15s

Proposer get details
    Click Element    xpath=.//*[@for='Proposername']
    Input Text    id=Proposername    ${prospername}
    Click Element    xpath=.//*[@for='propmobileNumber']
    Input Text    id=propmobileNumber    ${mobilenumber}
    Click Element    xpath=.//*[@for='propEmailId']
    Input Text    id=propEmailId    ${email_id}
    Click Element    xpath=.//input[@value='25000']/parent::label
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//div[@class='suminsured floating']/a

Insured 1 member covered
    Click Element    xpath=.//div[@class='function-section insured-covered-container']//a

1 insured dob details
    Click Element    xpath=.//label[@for='Date of Birth']
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Click Element    xpath=.//div[@class='insured-dob-container']//a[@class='btn btn-secondary continuetomedicalqa']

Medical question NO
    Click Element    xpath=.//label[@class='btn btn-default active toggle-off'][contains(.,'Off')]
    Click Element    xpath=.//div[@id='meidicalform-section']//a

Premium continue button
    Click Element    xpath=.//div[@class='premiumdetail-container']//a[@class='btn btn-secondary continuetoproposerform']

Proposer details
    [Arguments]    ${lastname}    ${occupation}    ${pan_no}
    Click Element    id=proprserdob
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Click Element    xpath=.//*[@for='lname']
    Input Text    id=lname    ${lastname}
    Select From List By Label    xpath=.//*[@name='insuredOccupation1']    ${occupation}
    Click Element    xpath=.//div[@id='proposerdetails']/div[7]//div/label/span[contains(.,'Female')]
    Click Element    xpath=.//*[@for='panNo']
    Input Text    id='panNo'    ${pan_no}

Sroll down
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
