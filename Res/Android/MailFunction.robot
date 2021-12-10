*** Settings ***

Library             cogmationlibrary
Library             Dialogs
Resource            ${EXECDIR}/Res/Android/GenericFunction.robot
Variables           ${EXECDIR}/VariableFiles/Android/Config.py

# Resource            /Res/Android/GenericFunction.robot

*** Keywords ***
Generic Mail Teardown
    FOR  ${index}  IN RANGE  1  6
        ${status}  Wait For Exists  timeout=1000  &{MAIL_MORE_OPTIONS_DOTS}
        Run Keyword If  ${status}  Click  &{MAIL_MORE_OPTIONS_DOTS}
        ${status}  Wait For Exists  timeout=1000  &{MAIL_DISCARD_STRING}
        Run Keyword If  ${status}  Click  &{MAIL_DISCARD_STRING}
        Press Back
    END

Launch Mail App
    Execute Adb Shell Command  am start -n ${MAIL_APP_PACKAGE}
    BuiltIn.Sleep  3s  For Page to load successfully
    ${status}  Wait For Exists  timeout=5000  &{MAIL_NEW_MAIL_CREATE_BTN}
    Run Keyword Unless  ${status}  Fail  Mail App not launched successfully. Unable to detect Compose New button on UI

Open Mail
    Launch Mail App
    ${status}  Wait For Exists  timeout=2000  &{MAIL_OPEN_MAIL_WITH_SUBJECT}
    Run Keyword If  ${status}  Click  &{MAIL_OPEN_MAIL_WITH_SUBJECT}
    ...  ELSE  Fail  Unable to detect required mail on UI
    ${status}  Wait For Exists  timeout=2000  &{MAIL_DELETE_ICON}
    Run Keyword If  ${status}  Click  &{MAIL_DELETE_ICON}
    ...  ELSE  Fail  Unable to detect delete icon on UI


Send Mail
    [Arguments]  ${destination}  ${subject}  ${attach_file}=False

    Launch Mail App

    ${status}  Wait For Exists  timeout=3000  &{MAIL_NEW_MAIL_CREATE_BTN}
    Run Keyword If  ${status}  Click  &{MAIL_NEW_MAIL_CREATE_BTN}
    ...  ELSE  Fail  Unable to detect compose mail button on UI

    ${status}  Wait For Exists  timeout=3000  &{MAIL_TO_FIELD_TEXT}
    Run Keyword If  ${status}  Set Text  ${destination}  &{MAIL_TO_FIELD_TEXT}
    ...  ELSE  Fail  Unable to detect To field on Mail UI

    ${status}  Wait For Exists  timeout=3000  &{MAIL_SUBJECT_FIELD_TEXT}
    Run Keyword If  ${status}  Set Text  ${subject}  &{MAIL_SUBJECT_FIELD_TEXT}
    ...  ELSE  Fail  Unable to detect Subject field on Mail UI

    ${status}  Wait For Exists  timeout=3000  &{MAIL_BODY_FIELD_TEXT}
    Run Keyword If  ${status}  Set Text  ${TEST_BODY}  &{MAIL_BODY_FIELD_TEXT}
    ...  ELSE  Fail  Unable to detect Subject field on Mail UI

    Run Keyword If  ${attach_file}  Attach File To Mail

    ${status}  Wait For Exists  timeout=3000  &{MAIL_SEND_MAIL_BUTTON}
    Run Keyword If  ${status}  Click  &{MAIL_SEND_MAIL_BUTTON}
    ...  ELSE  Fail  Unable to detect Send Mail Button

    ${status}  Wait For Exists  timeout=5000  &{MAIL_SENT_CONFIRMATION}
    Run Keyword Unless  ${status}  Fail  Mail Sent Successfully popup not appeared on UI

    [Teardown]  Generic Mail Teardown

Attach File To Mail
    ${status}  Wait For Exists  timeout=2000  &{MAIL_ATTACH_FILE_BUTTON}
    Run Keyword If  ${status}  Click  &{MAIL_ATTACH_FILE_BUTTON}
    ...  ELSE  Fail  Unable to detect attach button on UI
    ${status}  Wait For Exists  timeout=2000  &{MAIL_ATTACH_FILE_TEXT}
    Run Keyword If  ${status}  Click  &{MAIL_ATTACH_FILE_TEXT}
    ...  ELSE  Fail  Unable to detect attach file option on UI
    ${status}  Wait For Exists  timeout=2000  &{FILE_MNGR_MORE_OPTIONS}
    Run Keyword If  ${status}  Click  &{FILE_MNGR_MORE_OPTIONS}
    ...  ELSE  Fail  Unable to loacte More Options on UI
    ${status}  Wait For Exists  timeout=2000  &{FILE_MNGR_SHOW_INTERNAL_STORAGE}
    Run Keyword If  ${status}  Click  &{FILE_MNGR_SHOW_INTERNAL_STORAGE}
    ...  ELSE  Press Back
    ${status}  Wait For Exists  timeout=2000  &{FILE_MNGR_SHOW_ROOTS}
    Run Keyword If  ${status}  Click  &{FILE_MNGR_SHOW_ROOTS}
    ...  ELSE  Fail  Unable to loacte Navigation Drawer on UI
    ${status}  Wait For Exists  timeout=2000  textContains=GB free
    Run Keyword If  ${status}  Click  textContains=GB free
    ...  ELSE  Fail  Unable to locate internal storage option in Notification Drawer of Files App
    ${status}  Wait For Exists  timeout=3000  &{FILE_MNGR_SEARCH_ICON}
    Run Keyword If  ${status}  Click  &{FILE_MNGR_SEARCH_ICON}
    ...  ELSE  Fail  Unable to locate Search Icon on UI
    ${status}  Wait For Exists  timeout=3000  &{FILE_MNGR_SEARCH_ICON_TEXT_EDITOR_SPACE}
    Run Keyword If  ${status}  Set Text  ${IMAGE_FILE_NAME_1}  &{FILE_MNGR_SEARCH_ICON_TEXT_EDITOR_SPACE}
    ...  ELSE  Fail  Unable to detect search file editor box
    BuiltIn.Sleep  5s  For Device to search successfully in Internal Storage
    Press Enter
    BuiltIn.Sleep  5s  For Device to search successfully in Internal Storage
    ${status}  Wait For Exists  timeout=3000  &{FILE_MNGR_LIST_VIEW}
    Run Keyword If  ${status}  Click  &{FILE_MNGR_LIST_VIEW}
    ${status}  Wait For Exists  timeout=3000  &{FILE_MNGR_ATTACH_PICTURE_FILE}
    Run Keyword If  ${status}  Click  &{FILE_MNGR_ATTACH_PICTURE_FILE}
    ...  ELSE  Fail  Unable to locate required image
    BuiltIn.Sleep  5s  Wait for file to upload successfully

Send And Validate Mail Reception
    [Arguments]  ${mo_device}  ${mt_device}  ${destination_email}  ${mail_subject}=${TEST_SUBJECT}
    Set Serial  ${mo_device}
    Send Mail  destination=${destination_email}  subject=${mail_subject}
    Set Serial  ${mt_device}
    Open Mail

Validate Mail Reception
    Open Mail
