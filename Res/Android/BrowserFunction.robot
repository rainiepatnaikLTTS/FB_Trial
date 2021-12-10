*** Settings ***

Library             cogmationlibrary
Library             Dialogs
Resource            ${EXECDIR}/Res/Android/GenericFunction.robot
Variables           ${EXECDIR}/VariableFiles/Android/Config.py

# Resource            /Res/Android/GenericFunction.robot

*** Keywords ***
Close All Browser Tabs
    ${status}  Wait For Exists  timeout=2000  &{BROWSER_TAB_SWITCHER}
    Run Keyword If  ${status}  Click  &{BROWSER_TAB_SWITCHER}
    ...  ELSE  Fail  Unable to locate Tab Switcher Option in top right corner

    ${status}  Wait For Exists  timeout=2000  &{BROWSER_MORE_OPTIONS_DOTS}
    Run Keyword If  ${status}  Click  &{BROWSER_MORE_OPTIONS_DOTS}
    ...  ELSE  Fail  Unable to locate More Option in top right corner

    ${status}  Wait For Exists  timeout=2000  &{BROWSER_CLOSE_ALL_TABS}
    Run Keyword If  ${status}  Click  &{BROWSER_CLOSE_ALL_TABS}
    ...  ELSE  Fail  Unable to locate Close All Tab Option

Launch Browser App
    Execute Adb Shell Command  am start -n ${BROWSER_APP_PACKAGE}
    BuiltIn.Sleep  3s  For Page to load successfully
    ${status_1}  Wait For Exists  timeout=2000  &{BROWSER_HOME_BUTTON}
    ${status_2}  Wait For Exists  timeout=2000  &{BROWSER_NEW_TAB_STRING}
    Run Keyword If  ${status_1} or ${status_2}  Log  Browser App launched successfully
    ...  ELSE  Fail  Browser App not launched successfully. Unable to detect Home button on UI

Launch New Tab
    ${status}  Wait For Exists  timeout=2000  &{BROWSER_MORE_OPTIONS_DOTS}
    Run Keyword If  ${status}  Click  &{BROWSER_MORE_OPTIONS_DOTS}
    ...  ELSE  Fail  Unable to locate More Option in top right corner
    ${status}  Wait For Exists  timeout=2000  &{BROWSER_NEW_TAB_MENU_OPTION}
    Run Keyword If  ${status}  Click  &{BROWSER_NEW_TAB_MENU_OPTION}
    ...  ELSE  Fail  Unable to locate New Tab option under More options
    ${status}  Wait For Exists  timeout=2000  &{BROWSER_HOME_BUTTON}
    Run Keyword If  ${status}  Click  &{BROWSER_HOME_BUTTON}
    ...  ELSE  Fail  Unable to locate Home button on UI

Launch Webpage
    [Arguments]  ${url}  ${locator}  ${element}
    Launch Browser App
    Launch New Tab
    BuiltIn.Sleep  5s  For Page to Load Completely
    # ${status}  Wait For Exists  timeout=5000  &{BROWSER_SEARCH_INPUT_TEXT}
    # Run Keyword If  ${status}  Click  &{BROWSER_SEARCH_INPUT_TEXT}
    # ...  ELSE  Fail  Unable to locate Search Input Bar
    BuiltIn.Sleep  5s  For Page animation to complete successfully
    ${status}  Wait For Exists  timeout=2000  &{BROWSER_SEARCH_INPUT_URL_BAR}
    Run Keyword If  ${status}  Set Text  ${url}  &{BROWSER_SEARCH_INPUT_URL_BAR}
    ...  ELSE  Fail  Unable to enter webpage URL
    Press Enter
    ${status}  Wait For Exists  timeout=10000  ${locator}=${element}
    Run Keyword Unless  ${status}  Fail  Unable to locate required identifier for webpage

Launch Multiple Webpages
    [Arguments]  ${url_list}  ${locator_list}  ${element_list}
    ${list_length}  Get Length  ${url_list}
    FOR  ${counter}  IN RANGE  0  ${list_length}
        ${sample_url}  Get From List  ${url_list}  ${counter}
        ${sample_locator}  Get From List  ${locator_list}  ${counter}
        ${sample_element}  Get From List  ${element_list}  ${counter}
        Log  Launching ${sample_url}
        Launch Webpage  url=${sample_url}  locator=${sample_locator}  element=${sample_element}
    END

Navigate Through Links
    Launch Webpage  url=${WEBPAGE_URL_2}  locator=text  element=${BROWSER_WEBPAGE_2_IDENTIFIER}
    ${status}  Wait For Exists  timeout=10000  &{BROWSER_WEBPAGE_2_LOCATOR_1}
    Run Keyword If  ${status}  Click  &{BROWSER_WEBPAGE_2_LOCATOR_1}
    ...  ELSE  Fail  Unable to locate Mail Icon
    ${status}  Wait For Exists  timeout=10000  &{BROWSER_WEBPAGE_2_LOCATOR_2}
    Run Keyword Unless  ${status}  Fail  Unable to navigate to any screen

Launch Browser And Load Home
    Launch Browser App
    Launch New Tab
    BuiltIn.Sleep  5s  For Page to Load Completely