*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}      https://www.google.com/
${BROWSER}  chrome
${searchText}   finnish news

*** Keywords ***
Open the browser and navigate to Google
    open browser    ${URL}  ${BROWSER}
    maximize browser window
    click button    id:L2AGLb

Close the browser
    close all browsers

Search in google
    [Arguments]    ${searchText}
    wait until element is visible   xpath://input[@class='gLFyf gsfi']
    input text     xpath://input[@class='gLFyf gsfi']     ${searchText}
    click element    xpath://div[@class='o3j99 LLD4me yr19Zb LS8OJ']
    wait until element is visible   xpath:(//input[@class='gNO89b'])[2]
    click element    xpath:(//input[@class='gNO89b'])[2]

Find YLE News and click
    wait until page contains    News | Yle Uutiset
    click element    xpath:(//h3[@class='LC20lb MBeuO DKV0Md'])[2]

Accept cookies and click on more button
    click button    xpath://button[@name='accept-all-consents']
    click element    id:navigation-menu-label

Select the news type and number
    [Arguments]    ${newsType}      ${newsNumber}
    @{newsTypes}    get webelements    xpath://div[@id='navigation-menu']/nav/div/div/ul/li
    ${count}    set variable    1
    FOR    ${element}   IN    @{newsTypes}
        ${text}     get text    ${element}
        IF    '${text}' == '${newsType}'
            click element    xpath://div[@id='navigation-menu']/nav/div/div/ul/li[${count}]
        END
        ${count} =      evaluate    ${count} + 1
        EXIT FOR LOOP IF    '${text}' == '${newsType}'
    END

    click element    xpath://ol[@aria-labelledby='most-recent']/li[${newsNumber}]