*** Settings ***

Library             cogmationlibrary
Library             OperatingSystem
Resource            ${EXECDIR}/Res/Android/GenericFunction.robot
Variables           ${EXECDIR}/VariableFiles/Android/Config.py

*** Keywords ***

Verify All SubOptions In Settings
    Click Particular Option And Verify SubOptions  ${SETTINGS_APPS_NOTIFS_LIST}  identifier_type=text  &{SETTINGS_APPS_NOTIFS}
    Press Back
    Click Particular Option And Verify SubOptions  ${SETTINGS_CONNECTIVITY_LIST}  identifier_type=text  &{NETWORK_AND_INTERNET_DICT}
    Press Back
    # Click Particular Option And Verify SubOptions  ${SETTINGS_DO_NOT_DISTURB_LIST}  identifier_type=text  &{DO_NOT_DISTURB_TEXT}
    # Press Back
     Click Particular Option And Verify SubOptions  ${SETTINGS_BATTERY_LIST}  identifier_type=text  &{SETTINGS_BATTERY}
    # Scroll To Beginning Vertically
    Press Back
    # Click Particular Option And Verify SubOptions  ${SETTINGS_DEVICE_LIST}  identifier_type=text  &{SETTINGS_DEVICE}
    # Verify SubOptions In Device
    # Press Back
    Click Particular Option And Verify SubOptions  ${SETTINGS_DISPLAY_LIST}  identifier_type=text  &{SETTINGS_DISPLAY}
    Press Back
    Click Particular Option And Verify SubOptions  ${SETTINGS_SOUND_LIST}  identifier_type=text  &{SETTINGS_SOUND}
    Press Back
    Click Particular Option And Verify SubOptions  ${SETTINGS_PRIVACY_LIST}  identifier_type=text  &{SETTINGS_PRIVACY}
    Press Back
    Click Particular Option And Verify SubOptions  ${SETTINGS_ACCESSIBILITY_LIST}  identifier_type=text  &{SETTINGS_ACCESSIBILITY}
    Press Back
    Click Particular Option And Verify SubOptions  ${SETTINGS_SYSTEM_LIST}  identifier_type=text  &{SETTINGS_SYSTEM}
    # Verify SubOptions In General
    Press Back
    # Click Particular Option And Verify SubOptions  ${SETTINGS_CAMERA_LIST}  identifier_type=text  &{SETTINGS_CAMERA}
    # Press Back

Verify SubOptions In Device
    Click Particular Option And Verify SubOptions  ${SETTINGS_DISPLAY_LIST}  identifier_type=text  &{SETTINGS_DISPLAY}
    Press Back
    Click Particular Option And Verify SubOptions  ${SETTINGS_SOUND_LIST}  identifier_type=text  &{SETTINGS_SOUND}
    Press Back
    # Click Particular Option And Verify SubOptions  ${SETTINGS_BATTERY_LIST}  identifier_type=text  &{SETTINGS_BATTERY}
    # Scroll To Beginning Vertically
    # Press Back


Verify SubOptions In General
    Scroll To Beginning Vertically
    Click Particular Option And Verify SubOptions  ${SETTINGS_ABOUT_LIST}  identifier_type=text  &{SETTINGS_ABOUT}
    Press Back
    scroll_vertically_to_object  &{SETTINGS_SYSTEM_UPDATE}
    Click Particular Option And Verify SubOptions  ${SETTINGS_SYSTEM_UPDATE_LIST}  identifier_type=text  &{SETTINGS_SYSTEM_UPDATE}
    Press Back
    scroll_vertically_to_object  &{SETTINGS_LANGUAGE_INPUT}
    Click Particular Option And Verify SubOptions  ${SETTINGS_LANGUAGE_INPUT_LIST}  identifier_type=text  &{SETTINGS_LANGUAGE_INPUT}
    Press Back
    Click Particular Option And Verify SubOptions  ${SETTINGS_ORIENTATION_LIST}  identifier_type=text  &{SETTINGS_ORIENTATION}
    Click  &{SETTINGS_ORIENTATION_WRIST}
    Verify List Item SubOptions  ${SETTINGS_ORIENTATION_WRIST_LIST}  identifier_type=text
    Press Back
    Press Back
    Click Particular Option And Verify SubOptions  ${SETTINGS_BACKGROUND_APP_REFRESH_LIST}  identifier_type=text  &{SETTINGS_BACKGROUND_APP_REFRESH}
    Press Back
    Click Particular Option And Verify SubOptions  ${SETTINGS_WEBSITE_DATA_LIST}  identifier_type=text  &{SETTINGS_WEBSITE_DATA}
    Press Back
    Click Particular Option And Verify SubOptions  ${SETTINGS_DICTATION_LIST}  identifier_type=text  &{SETTINGS_DICTATION}
    Press Back
    Click Particular Option And Verify SubOptions  ${SETTINGS_SCREENSHOTS_LIST}  identifier_type=text  &{SETTINGS_SCREENSHOTS}
    Press Back
    Click Particular Option And Verify SubOptions  ${SETTINGS_USAGE_LIST}  identifier_type=text  &{SETTINGS_USAGE}
    Press Back
    Click Particular Option And Verify SubOptions  ${SETTINGS_RESET_LIST}  identifier_type=text  &{SETTINGS_RESET}
    Press Back
    Click Particular Option And Verify SubOptions  ${SETTINGS_STORAGE_SYNC_LIST}  identifier_type=text  &{SETTINGS_STORAGE_SYNC}
    Press Back
    Click Particular Option And Verify SubOptions  ${SETTINGS_CLOUD_BACKUPS_LIST}  identifier_type=text  &{SETTINGS_CLOUD_BACKUPS}
    Press Back
    Click Particular Option And Verify SubOptions  ${SETTINGS_SAFETY_LIST}  identifier_type=text  &{SETTINGS_SAFETY}
    Press Back


Click Particular Option And Verify SubOptions
    [Arguments]  ${list}  ${identifier_type}  &{option}
    ${status}  Wait For Exists  &{option}
    Run Keyword If  ${status}  Click  &{option}

    Run Keyword Unless  ${status}  Run Keywords
    ...  scroll_vertically_to_object  &{option}  AND
    ...  BuiltIn.Sleep  1  AND
    ...  Click  &{option}

    Verify List Item SubOptions  ${list}  ${identifier_type}

Verify List Item SubOptions
    [Arguments]  ${list}  ${identifier_type}
    Scroll To Beginning Vertically
    FOR  ${list_item}  IN  @{list}
        ${option}  Create Dictionary  ${identifier_type}=${list_item}
        ${status}  Wait For Exists  &{option}
        Run Keyword If  ${status}  Run keywords
        ...  Log To Console  ${list_item} Option Visible  AND
        ...  Continue For Loop
        Run Keyword Unless  ${status}  Swipe By coordinates  308  370  308  220
        ${status1}  Wait For Exists  &{option}
        Run Keyword If  ${status1}  Run keywords
        ...  Log To Console  ${list_item} Option Visible  AND
        ...  Continue For Loop
        Run Keyword Unless  ${status1}  Swipe By coordinates  308  370  308  220
        ${status2}  Wait For Exists  &{option}
        Run Keyword If  ${status2}  Run keywords
        ...  Log To Console  ${list_item} Option Visible  AND
        ...  Continue For Loop
        Run Keyword Unless  ${status2}  FAIL  ${list_item} Option Not Visible
    END

Navigate Through All Apps In Menu And SubMenu Options
    Log to console  Opening Menu
    Press Home
    ${status}  Wait For Exists  5  textContains=Activity                                            ###Added by Aditya oct 27
    BuiltIn.sleep  3
    Run Keyword If  ${status}  Log to console  Menu launched Successfully
    Run Keyword Unless  ${status}  Press Home
    ${status}  Wait For Exists  5  textContains=Activity                                                #added by Aditya oct 27
    BuiltIn.sleep  3
    Run Keyword Unless  ${status}  FAIL  Menu not launched

    Log To Console  Starting traversing of Settings app
    ${status}  Wait For Exists  text=Settings
    Run Keyword If  ${status}  Click  description=Settings
    Run Keyword Unless  ${status}  Scroll Down Through Menu To Click App  description=Settings
    ${settings_option}  Wait For Exists  text=Notifications
    Run Keyword Unless  ${settings_option}  Scroll Up Through Menu To Click App  description=Settings
    Verify All SubOptions In Settings
    Repeat Keyword  4  Press Back  ### 4 times since sometimes it get stuck in settings options

    # Swipe Right                                         #### code changes for v9 release
    Press Home
    Log To Console  Verifying if user is back to menu Launcher
    Scroll To Beginning Vertically
    BuiltIn.sleep  3
    ${status}  Wait For Exists  5  textContains=App
    Run Keyword If  ${status}  Log to console  Menu launched Successfully

    FOR  ${key}  IN  @{MENU_APPS_DICT_RES_ID.keys()}
        Log To Console  Navigating Through Other Menu Option ${key}
        ${app}  Create Dictionary  description=${key}
        ${status}  Wait For Exists  &{app}
        Run Keyword If  ${status}  Click  &{app}
        Run Keyword Unless  ${status}  Scroll Down Through Menu To Click App  &{app}
        BuiltIn.Sleep  5
        ${value}  Get From Dictionary  ${MENU_APPS_DICT_RES_ID}  ${key}
        ${submenu_id}  Create Dictionary  resourceId=${value}
        ${status}  Wait For Exists  timeout=5000  &{submenu_id}
        Run Keyword If  ${status}  Run Keywords
        ...  Log to console  App Launched Successfully  AND
        ...  Press Back  AND
        ...  Continue For Loop
        Run Keyword unless  ${status}  FAIL  ${key} App Not Launched or Sub menu option not visible
    END
