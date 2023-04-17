*** Settings ***
Library  SeleniumLibrary
Library   Dialogs

*** Variables ***
${sayfayı aç}   https://useinsider.com/
${cooke_kapatma}       (//*[@id="wt-cli-accept-all-btn"])
${daha_fazla_ekranı}    (//*[@id="mega-menu-1"])[6]
${kariyer_ekranı}    /html/body/nav/div[2]/div/ul[1]/li[6]/div/div[1]/div[3]/div/a


*** Keywords ***
Browsere gir
    Open Browser   ${sayfayı aç}    chrome

*** Test Cases ***

İnsider Sayfası Qa İnceleme Ekranları.
    [Documentation]   İnsider Sayfasına giriş.
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-notifications
    Create WebDriver    Chrome    chrome_options=${chrome_options}
    Go To    https://useinsider.com/
    Maximize Browser Window
    Page should contain element   ${cooke_kapatma}
    sleep  2s
    Click element   ${cooke_kapatma}
    Unselect Frame
    Sleep    2
    Click Element    ${daha_fazla_ekranı}
    Sleep    2
    Unselect Frame
    Go To    https://useinsider.com/careers/
    Sleep    2
    Execute JavaScript    window.scrollTo(0,2500)
    Execute JavaScript    window.scrollBy(0,2500)
    Sleep    5
    Wait Until Element Is Visible    //*[@id="career-find-our-calling"]/div/div/a
    Click Element    //*[@id="career-find-our-calling"]/div/div/a
    Sleep    4
    Execute JavaScript    window.scrollTo(2500,2500)
    Execute JavaScript    window.scrollBy(2500,2500)
    Sleep    2
    Click Element    //*[@id="career-find-our-calling"]/div/div/div[2]/div[12]/div[2]/a
    Unselect Frame
    Sleep    2
    Click Element   //*[@id="page-head"]/div/div/div[1]/div/div/a
    Unselect Frame
    Sleep    2
    Click Element    //*[@id="top-filter-form"]/div[1]/span/span[1]/span
    Sleep    2
    Click Element    //li[text()="Istanbul, Turkey"]
    Execute JavaScript    window.scrollTo(0,600)
    Execute JavaScript    window.scrollBy(0,600)
    Sleep    2
    Click Element    //*[@id="jobs-list"]/div[1]/div/a














