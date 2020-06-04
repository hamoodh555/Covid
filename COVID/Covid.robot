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
1 insured with Self as Insured without loading
    Local browser launch
    #Jenkins browser launch
    Proposer get details
    Sum insured 50,000
    Insured 1 member covered
    1 insured dob click
    23 year click
    Insured dob continue button
    Medical question all NO
    Premium continue button
    Click Element    id=proprserdob
    23 year click
    Proposer details    Mohan    Student    hucde1234r
    Contact details
    Sroll down
    Click Element    xpath=.//div[@id='contactdetails']//a
    Insured details with self
    Sroll down
    Click Element    xpath=.//*[@id='nexBtn1']
    Nomine details

1 insured with Self as Insured with loading
    Local browser launch
    #Jenkins browser launch
    Proposer get details
    Sum insured 25,000
    Insured 1 member covered
    1 insured dob click
    65 year click
    Insured dob continue button
    Medical questions 1,3,4,5 No
    Medical questions 2 Yes
    Medical question continue button

1 Insured with Self with Medical Question as Yes(Quote Blocked)
    Local browser launch
    #Jenkins browser launch
    Proposer get details
    Sum insured 25,000
    Insured 1 member covered
    1 insured dob click
    23 year click
    Insured dob continue button
    Medical questions 1,3,4,5 Yes
    Medical questions 2 No
    Medical question continue button
    Handle Alert
    Handle Alert

1 insured as Spouse without loading
    Local browser launch
    #Jenkins browser launch
    Proposer get details
    Sum insured 50,000
    Insured 1 member covered
    1 insured dob click
    30 year click
    Insured dob continue button
    Medical question all NO
    Premium continue button
    Click Element    id=proprserdob
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1945
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]

1 Insured as Father with Loading
    Local browser launch
    #Jenkins browser launch
    Proposer get details
    Sum insured 25,000
    Insured 1 member covered
    1 insured dob click
    49 year click
    Insured dob continue button
    Medical questions 1,3,4,5 No
    Medical questions 2 Yes
    Medical question continue button

1 Insured as Father with Loading
    Local browser launch
    #Jenkins browser launch
    Proposer get details
    Sum insured 50,000
    Insured 1 member covered
    1 insured dob click
    65 year click
    Insured dob continue button
    Medical questions 1,3,4,5 No
    Medical questions 2 Yes
    Medical question continue button

1 insured as Son without Loading
    Local browser launch
    #Jenkins browser launch
    Proposer get details
    Sum insured 25,000
    Insured 1 member covered
    1 insured dob click
    23 year click
    Insured dob continue button
    Medical question all NO
    Premium continue button
    Click Element    id=proprserdob
    23 year click
    Proposer details    Mohan    Student    hucde1234r
    Contact details
    Sroll down
    Click Element    xpath=

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

Sum insured 25,000
    Click Element    xpath=.//input[@value='25000']/parent::label
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//div[@class='suminsured floating']/a

Sum insured 50,000
    Click Element    xpath=.//input[@value='50000']/parent::label
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//div[@class='suminsured floating']/a

Insured 1 member covered
    Click Element    xpath=.//div[@class='function-section insured-covered-container']//a

1 insured dob click
    #Click Element    xpath=.//label[@for='Date of Birth']
    Click Element    xpath=.//button[@class='ui-datepicker-trigger']

23 year click
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1997
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]

65 year click
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1955
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]

30 year click
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1990
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]

49 year click
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1975
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]

Insured dob continue button
    Click Element    xpath=.//div[@class='insured-dob-container']//a[@class='btn btn-secondary continuetomedicalqa']

Medical question all NO
    Click Element    xpath=(.//label[@class='btn btn-default active toggle-off'][contains(.,'NO')])[1]
    Click Element    xpath=.//div[@id='meidicalform-section']//a

Medical question continue button
    Click Element    xpath=.//div[@id='meidicalform-section']//a

Medical questions 1,3,4,5 No
    Click Element    xpath=.//div[@id='meidicalform-section']//li[2]//label/span[contains(.,'No')]
    Click Element    xpath=.//div[@id='meidicalform-section']//li[4]//label/span[contains(.,'No')]
    Click Element    xpath=.//div[@id='meidicalform-section']//li[5]//label/span[contains(.,'No')]
    Click Element    xpath=.//div[@id='meidicalform-section']//li[6]//label/span[contains(.,'No')]

Medical questions 1,3,4,5 Yes
    Click Element    xpath=.//div[@id='meidicalform-section']//li[2]//label/span[contains(.,'Yes')]
    Click Element    xpath=.//div[@id='meidicalform-section']//li[4]//label/span[contains(.,'Yes')]
    Click Element    xpath=.//div[@id='meidicalform-section']//li[5]//label/span[contains(.,'Yes')]
    Click Element    xpath=.//div[@id='meidicalform-section']//li[6]//label/span[contains(.,'Yes')]

Medical questions 2 Yes
    Click Element    xpath=.//div[@id='meidicalform-section']//li[3]//label/span[contains(.,'Yes')]
    Click Element    xpath=.//label[@for='hbaic']
    Input Text    id=hbaicfield1    7.5

Medical questions 2 No
    Click Element    xpath=.//div[@id='meidicalform-section']//li[3]//label/span[contains(.,'No')]

Premium continue button
    Click Element    xpath=.//div[@class='premiumdetail-container']//a[@class='btn btn-secondary continuetoproposerform']

Proposer details
    [Arguments]    ${lastname}    ${occupation}    ${pan_no}
    Click Element    xpath=.//*[@for='lname']
    Input Text    id=lname    ${lastname}
    Select From List By Label    xpath=.//*[@name='insuredOccupation1']    ${occupation}
    Click Element    xpath=.//div[@id='proposerdetails']/div[7]//div/label/span[contains(.,'Female')]
    Click Element    xpath=.//*[@for='panNo']
    Input Text    id=panNo    ${pan_no}

Contact details
    Click Element    xpath=.//label[@for='address1']
    Input Text    id=address1    dkfdngdnfgxvsd
    Click Element    xpath=.//label[@for='address2']
    Input Text    id=address2    lklkjhgkjhkjhdfs
    Click Element    xpath=.//label[@for='city']
    Input Text    id=contactCity    CHENGALPATTU
    Click Element    xpath=.//label[@for='pincode']
    Input Text    id=pincode    600098

Insured details with self
    Select From List By Label    id=relationShipProposer1    Self

Insured details with spouse
    Select From List By Label    id=relationShipProposer1    Spouse

Insured details with father
    Select From List By Label    id=relationShipProposer1    Father

Insured details with mother in law
    Select From List By Label    id=relationShipProposer1    Mother In law

Insured details with son
    Select From List By Label    id=relationShipProposer1    Son

Insured details with daughter
    Select From List By Label    id=relationShipProposer1    Daughter

Insured details with father in law
    Select From List By Label    id=relationShipProposer1    Father in law

Insured details with mother
    Select From List By Label    id=relationShipProposer1    Mother

Nomine details
    Click Element    xpath=.//*[@for='NomineeName']
    Input Text    id=NomineeName    suresh
    Click Element    xpath=.//*[@for='nomineeDob']
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1990
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Select From List By Label    id=relationWithProposer    Brother
    Click Element    xpath=.//*[@for='nomineeAddress1']
    Input Text    id=nomineeAddress1    lskdfngjsdjkngjkfng
    Click Element    xpath=.//*[@for='nomineeAddress2']
    Input Text    id=nomineeAddress2    eurytehjwnfjnsdjfns
    Click Element    xpath=.//*[@for='nomineeCity']
    Input Text    id=nomineeCity    CHENGALPATTU
    Click Element    xpath=.//*[@for='nomineeCity']
    Click Element    xpath=.//*[@for='nomineePincode']
    Input Text    id=nomineePincode    600988
    Click Element    xpath=.//div[@id='insuredDetails-sec']//div//a[contains(.,'Continue')]

Sroll down
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
