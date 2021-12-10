*** Settings ***

Library             cogmationlibrary
Library             OperatingSystem
Resource            ${EXECDIR}/Res/Android/GenericFunction.robot
Variables           ${EXECDIR}/VariableFiles/Android/Config.py

*** Keywords ***


Open And Close Store Front Application
    Log To Console  Opening And Closing StoreFront Application
    Launch Particular App  ${STORE_FRONT_PACKAGE}
    BuiltIn.sleep  2
    Verify Particular App Is Launched  ${STORE_FRONT_IDENTIFIER}
    Log To Console  Pressing Back to close the application
    Repeat Keyword  2  Press Back

Download Applications From StoreFront
    [Arguments]  ${list_app_names}
    Log To Console  Starting To Download application from StoreFront
    FOR  ${list_item}  IN  @{list_app_names}
        Repeat Keyword  5  Press Back
        Launch Particular App  ${STORE_FRONT_PACKAGE}
        Click  &{PLAYSTORE_SEARCH}
        BuiltIn.Sleep  2
        Execute Adb Shell Command  input text "${list_item}"
        Press Back
        BuiltIn.Sleep  2
        Execute Adb Shell Command  input keyevent 66
        ${status}  Wait For Exists  &{PLAYSTORE_INSTALL_BTN}
        Run Keyword If  ${status}  Run Keywords
        ...  Click  &{PLAYSTORE_INSTALL_BTN}  AND
        ...  Log To Console  Starting To Download ${list_item} App
        Run Keyword unless  ${status}  Log To console  App already installed
        BuiltIn.Sleep  2
        ${downloading}  Wait Until Gone  100000  &{PLAYSTORE_APP_DOWNLOAD_CANCEL}
        ${installing}  Wait Until Gone  100000  &{PLAYSTORE_APP_DOWNLOAD_INSTALLING}
        BuiltIn.sleep  5
    END


Uninstall Applications From StoreFront
    [Arguments]  ${list_app_names}
    Log To Console  Uninstalling Application downloaded from StoreFront
    FOR  ${list_item}  IN  @{list_app_names}
        Launch Particular App  ${SETTINGS_APP_PACKAGE}
        Verify Particular App Is Launched  ${SETTINGS_SEARCH_SETTINGS}
        # Click  ${SETTINGS_SEARCH_BAR}
        ${status}  Wait For Exists  &{SETTINGS_SEARCH_SETTINGS}
        Run keyword if  ${status}  Click  &{SETTINGS_SEARCH_SETTINGS}
        ...  ELSE  FAIL  Couldn't click on Search Settings
        BuiltIn.sleep  2
        Log To Console  Giving ${list_item} as input in Search bar
        Adb Input Text  ${list_item}
        &{app_name}  Create Dictionary  text=${list_item}
        # ${status}  Wait For Exists  &{app_name}
        ${status}  Wait For Exists  text=App info
        Run Keyword Unless  ${status}  Run Keywords
        ...  Log  App not found  AND
        ...  Log To Console  App not found
        Run Keyword If  ${status}  Run Keywords
        ...  Click  text=App info  AND
        ...  BuiltIn.Sleep  2  AND
        ...  Click  &{SETTINGS_APP_UNINSTALL_BTN}  AND
        ...  Click  &{OK_BUTTON}  AND
        ...  BuiltIn.Sleep  2  AND
        ...  Log To Console  ${list_item} App Uninstalled  AND
        ...  Repeat Keyword  4  Press Back  AND
        ...  Continue For Loop
    END

        # -----
        # Click  &{SETTINGS_APPS_NOTIFS}
        # BuiltIn.Sleep  2
        # Click  &{SETTINGS_SEE_ALL_APPS}
        # ${status}  Wait For Exists  &{SETTINGS_ALL_APPS_TEXT}
        # Run Keyword If  ${status}  Log To Console  Starting To Search For App To uninstall
        # Run Keyword unless  ${status}  FAIL  Not Present on Apps & Notifcations Screen
        # &{app_name}  Create Dictionary  text=${list_item}
        # ${status}  Wait For Exists  &{app_name}
        # Run Keyword If  ${status}  Run Keywords
        # ...  Click  &{app_name}  AND
        # ...  BuiltIn.Sleep  1  AND
        # ...  Click  &{SETTINGS_APP_UNINSTALL_BTN}  AND
        # ...  Click  &{OK_BUTTON}  AND
        # ...  BuiltIn.Sleep  2  AND
        # ...  Log To Console  ${list_item} App Uninstalled  AND
        # ...  Repeat Keyword  4  Press Back  AND
        # ...  Continue For Loop
        # Run Keyword unless  ${status}  Log To Console  Scrolling Through Menu To get the app
        # ${app_visibility}  Run Keyword And return Status  Scroll Down Through Menu To Click App  &{app_name}
        # Run Keyword If  ${app_visibility}  Run Keywords
        # ...  BuiltIn.Sleep  1  AND
        # ...  Click  &{SETTINGS_APP_UNINSTALL_BTN}  AND
        # ...  Click  &{OK_BUTTON}  AND
        # ...  BuiltIn.Sleep  2  AND
        # ...  Log To Console  ${list_item} App Uninstalled  AND
        # ...  Repeat Keyword  4  Press Back
        # Run Keyword Unless  ${app_visibility}  FAIL  App Not found

