*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Resource.robot
Suite Setup    Open the browser and navigate to Google
Suite Teardown    Close the browser

*** Test Cases ***
Finnish News Test
    Search in google    ${searchText}
    Find YLE News and click
    Accept cookies and click on more button
    Select the news type and number    Economy     6