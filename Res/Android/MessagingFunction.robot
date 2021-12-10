*** Settings ***

Library             cogmationlibrary
Resource            ${EXECDIR}/Res/Android/GenericFunction.robot
Variables           ${EXECDIR}/VariableFiles/Android/Config.py

*** Keywords ***
Messaging Suite Setup
    Execute ADB Command  push ${EXECDIR}\\ExternalFiles\\Android\\Test_Data\\Images\\${IMAGE_FILE_NAME_1} /storage/self/primary/${IMAGE_FILE_NAME_1}
    Execute ADB Command  push ${EXECDIR}\\ExternalFiles\\Android\\Test_Data\\Videos\\${VIDEO_FILE_NAME_1} /storage/self/primary/${VIDEO_FILE_NAME_1}

Messaging Suite Teardown
    Execute ADB Shell Command  rm /storage/self/primary/${IMAGE_FILE_NAME_1}
    Execute ADB Shell Command  rm /storage/self/primary/${VIDEO_FILE_NAME_1}

Launch Messaging App
    Execute Adb Shell Command  am start -n ${MESSAGE_APP_PACKAGE}
    ${status}  Wait For Exists  timeout=5000  &{MESSAGE_NEW_MESSAGE_CREATE_BTN}
    Run Keyword Unless  ${status}  Fail  Message App not launched successfully. Unable to detect new message button on UI

Send SMS
    [Arguments]  ${mo_device_serial}  ${mt_device_number}  ${msg_content}
    Set Serial  ${mo_device_serial}
    Launch Messaging App
    ${status}  Wait For Exists  timeout=5000  &{MESSAGE_NEW_MESSAGE_CREATE_BTN}
    Run Keyword If  ${status}  Click  &{MESSAGE_NEW_MESSAGE_CREATE_BTN}
    ...  ELSE  Fail  Unable to detect new message button on UI
    ${status}  Wait For Exists  timeout=2000  &{MESSAGE_RECIPIENT_EDITOR_TEXT_BOX}
    Run Keyword If  ${status}  Set Text  ${mt_device_number}  &{MESSAGE_RECIPIENT_EDITOR_TEXT_BOX}
    ...  ELSE  Fail  Unable to detect recipient editor box
    Press Enter
    ${status}  Wait For Exists  timeout=2000  &{MESSAGE_MESSAGE_CONTENT_TEXT_BOX}
    Run Keyword If  ${status}  Set Text  ${msg_content}  &{MESSAGE_MESSAGE_CONTENT_TEXT_BOX}
    ...  ELSE  Fail  Unable to detect message content editor box

    ${status}  Wait For Exists  timeout=2000  &{MESSAGE_SEND_MESSAGE_BUTTON}
    Run Keyword If  ${status}  Click  &{MESSAGE_SEND_MESSAGE_BUTTON}
    ...  ELSE  Fail  Unable to click on send message button on UI

    # ${status}  Wait For Exists  timeout=1000  &{MESSAGE_SEND_MESSAGE_CONFIRM_TEXT}
    # Run Keyword Unless  ${status}  Fail  Message Sending confirmation not seen on UI

    [Teardown]  Repeat Keyword  8  Press Back

Send MMS
    [Arguments]  ${mo_device_serial}  ${mt_device_number}  ${attachment_type}  ${msg_content}
    # Set Serial  ${mo_device_serial}
    Launch Messaging App
    ${status}  Wait For Exists  timeout=5000  &{MESSAGE_NEW_MESSAGE_CREATE_BTN}
    Run Keyword If  ${status}  Click  &{MESSAGE_NEW_MESSAGE_CREATE_BTN}
    ...  ELSE  Fail  Unable to detect new message button on UI
    ${status}  Wait For Exists  timeout=2000  &{MESSAGE_RECIPIENT_EDITOR_TEXT_BOX}
    Run Keyword If  ${status}  Set Text  ${mt_device_number}  &{MESSAGE_RECIPIENT_EDITOR_TEXT_BOX}
    ...  ELSE  Fail  Unable to detect recipient editor box
    Press Enter
    # ${status}  Wait For Exists  timeout=2000  &{MESSAGE_MESSAGE_CONTENT_TEXT_BOX}
    # Run Keyword If  ${status}  Set Text  ${msg_content}  &{MESSAGE_MESSAGE_CONTENT_TEXT_BOX}
    # ...  ELSE  Fail  Unable to detect message content editor box
    ${status}  Wait For Exists  timeout=5000  &{MESSAGE_ATTACH_ICON}
    Run Keyword If  ${status}  Click  &{MESSAGE_ATTACH_ICON}
    Run Keyword Unless  ${status}  Run Keywords
    ...  Click  &{MESSAGE_EXPAND_ATTACH_BTNS}  AND
    ...  Click  &{MESSAGE_ATTACH_ICON}
    Scroll Vertically To Object  &{MESSAGE_ATTACH_FILE_TEXT}
    Click  &{MESSAGE_ATTACH_FILE_TEXT}
    Run Keyword If  '${attachment_type}' == '${MESSAGE_IMAGE_TYPE_MMS}[text]'  Attach Picture To MMS
    ...  ELSE IF  '${attachment_type}' == '${MESSAGE_VIDEO_TYPE_MMS}[text]'  Attach Video To MMS
    ...  ELSE IF  '${attachment_type}' == '${MESSAGE_AUDIO_TYPE_MMS}[text]'  Attach Audio To MMS
    ...  ELSE  Fail  Invalid Attachement Type Passed as Argument

    BuiltIn.Sleep  2s  For Page to refresh successfully

    ${status}  Wait For Exists  timeout=2000  &{MESSAGE_MESSAGE_CONTENT_TEXT_BOX}
    Run Keyword If  ${status}  Set Text  ${msg_content}  &{MESSAGE_MESSAGE_CONTENT_TEXT_BOX}
    ...  ELSE  Fail  Unable to detect message content editor box

    ${status}  Wait For Exists  timeout=2000  &{MESSAGE_SEND_MMS_MESSAGE_BUTTON}
    Run Keyword If  ${status}  Click  &{MESSAGE_SEND_MMS_MESSAGE_BUTTON}
    ...  ELSE  Fail  Unable to click on send MMS message button on UI

    # ${status}  Wait For Exists  timeout=30000  &{MESSAGE_SEND_MESSAGE_CONFIRM_TEXT}
    # Run Keyword Unless  ${status}  Fail  Message Sending confirmation not seen on UI

    [Teardown]  Repeat Keyword  4  Press Back

Attach Picture To MMS
    # ${status}  Wait For Exists  timeout=2000  &{MESSAGE_IMAGE_TYPE_MMS}
    # Run Keyword If  ${status}  Click  &{MESSAGE_IMAGE_TYPE_MMS}
    # ...  ELSE  Fail  Unable to loacte "Pictures" icon on UI
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

    ${status}  Wait For Exists  timeout=2000  &{FILE_MNGR_SEARCH_ICON}
    Run Keyword If  ${status}  Click  &{FILE_MNGR_SEARCH_ICON}
    ...  ELSE  Fail  Unable to locate Search Icon on UI
    ${status}  Wait For Exists  timeout=2000  &{FILE_MNGR_SEARCH_ICON_TEXT_EDITOR_SPACE}
    Run Keyword If  ${status}  Set Text  ${IMAGE_FILE_NAME_1}  &{FILE_MNGR_SEARCH_ICON_TEXT_EDITOR_SPACE}
    ...  ELSE  Fail  Unable to detect search file editor box
    BuiltIn.Sleep  5s  For Device to search successfully in Internal Storage
    # Press Back
    Press Enter
    BuiltIn.Sleep  5s  For Device to search successfully in Internal Storage
    ${status}  Wait For Exists  timeout=2000  &{FILE_MNGR_LIST_VIEW}
    Run Keyword If  ${status}  Click  &{FILE_MNGR_LIST_VIEW}
    ${status}  Wait For Exists  timeout=2000  &{FILE_MNGR_ATTACH_PICTURE_FILE}
    Run Keyword If  ${status}  Click  &{FILE_MNGR_ATTACH_PICTURE_FILE}
    ...  ELSE  Fail  Unable to locate required image
    ${status}  Wait For Exists  timeout=5000  &{MESSAGE_SEND_MMS_MESSAGE_BUTTON}
    Run Keyword Unless  ${status}  Fail  Unable to attach required file

Attach Video To MMS
    # ${status}  Wait For Exists  timeout=2000  &{MESSAGE_VIDEO_TYPE_MMS}
    # Run Keyword If  ${status}  Click  &{MESSAGE_VIDEO_TYPE_MMS}
    # ...  ELSE  Fail  Unable to loacte "Videos" icon on UI
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
    ${status}  Wait For Exists  timeout=2000  &{FILE_MNGR_SEARCH_ICON}
    Run Keyword If  ${status}  Click  &{FILE_MNGR_SEARCH_ICON}
    ...  ELSE  Fail  Unable to locate Search Icon on UI
    ${status}  Wait For Exists  timeout=2000  &{FILE_MNGR_SEARCH_ICON_TEXT_EDITOR_SPACE}
    Run Keyword If  ${status}  Set Text  ${VIDEO_FILE_NAME_1}  &{FILE_MNGR_SEARCH_ICON_TEXT_EDITOR_SPACE}
    ...  ELSE  Fail  Unable to detect search file editor box
    BuiltIn.Sleep  5s  For Device to search successfully in Internal Storage
    # Press Back
    Press Enter
    BuiltIn.Sleep  5s  For Device to search successfully in Internal Storage
    ${status}  Wait For Exists  timeout=2000  &{FILE_MNGR_LIST_VIEW}
    Run Keyword If  ${status}  Click  &{FILE_MNGR_LIST_VIEW}
    ${status}  Wait For Exists  timeout=2000  &{FILE_MNGR_ATTACH_VIDEO_FILE}
    Run Keyword If  ${status}  Click  &{FILE_MNGR_ATTACH_VIDEO_FILE}
    ...  ELSE  Fail  Unable to locate required video
    ${status}  Wait For Exists  timeout=5000  &{MESSAGE_SEND_MMS_MESSAGE_BUTTON}
    Run Keyword Unless  ${status}  Fail  Unable to attach required file

Attach Audio To MMS
    # ${status}  Wait For Exists  timeout=2000  &{MESSAGE_AUDIO_TYPE_MMS}
    # Run Keyword If  ${status}  Click  &{MESSAGE_VIDEO_TYPE_MMS}
    # ...  ELSE  Fail  Unable to loacte "Audio" icon on UI

    # ${status}  Wait For Exists  timeout=2000  &{MESSAGE_ATTACH_SYSTEM_AUDIO}
    # Run Keyword If  ${status}  Click  &{MESSAGE_ATTACH_SYSTEM_AUDIO}
    # ...  ELSE  Fail  Unable to loacte "System Audio" option on UI

    # ${status}  Wait For Exists  timeout=2000  &{MESSAGE_ATTACH_ANY_SYSTEM_AUDIO}
    # Run Keyword If  ${status}  Click  &{MESSAGE_ATTACH_ANY_SYSTEM_AUDIO}
    # ...  ELSE  Fail  Unable to loacte any checkbox option on UI

    # ${status}  Wait For Exists  timeout=2000  &{OK_BUTTON}
    # Run Keyword If  ${status}  Click  &{OK_BUTTON}
    # ...  ELSE  Fail  Unable to loacte OK button on UI

    # ${status}  Wait For Exists  timeout=5000  &{MESSAGE_SEND_MMS_MESSAGE_BUTTON}
    # Run Keyword Unless  ${status}  Fail  Unable to attach required file

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
    ${status}  Wait For Exists  timeout=2000  &{FILE_MNGR_SEARCH_ICON}
    Run Keyword If  ${status}  Click  &{FILE_MNGR_SEARCH_ICON}
    ...  ELSE  Fail  Unable to locate Search Icon on UI
    ${status}  Wait For Exists  timeout=2000  &{FILE_MNGR_SEARCH_ICON_TEXT_EDITOR_SPACE}
    Run Keyword If  ${status}  Set Text  ${AUDIO_FILE_NAME_1}  &{FILE_MNGR_SEARCH_ICON_TEXT_EDITOR_SPACE}
    ...  ELSE  Fail  Unable to detect search file editor box
    BuiltIn.Sleep  5s  For Device to search successfully in Internal Storage
    # Press Back
    Press Enter
    BuiltIn.Sleep  5s  For Device to search successfully in Internal Storage
    ${status}  Wait For Exists  timeout=2000  &{FILE_MNGR_LIST_VIEW}
    Run Keyword If  ${status}  Click  &{FILE_MNGR_LIST_VIEW}
    ${status}  Wait For Exists  timeout=2000  &{FILE_MNGR_ATTACH_AUDIO_FILE}
    Run Keyword If  ${status}  Click  &{FILE_MNGR_ATTACH_AUDIO_FILE}
    ...  ELSE  Fail  Unable to locate required Audio
    ${status}  Wait For Exists  timeout=5000  &{MESSAGE_SEND_MMS_MESSAGE_BUTTON}
    Run Keyword Unless  ${status}  Fail  Unable to attach required file

######--------_Rainie Added_-----------

Send SMS To Test Device And Open The SMS Received
    Send SMS  ${PARTNER_DEVICE}  ${TEST_DEVICE_PHONENUMBER}  ${MESSAGE_CONTENT_1}
    BuiltIn.Sleep  10
    Set Serial  ${TEST_DEVICE}
    Launch Messaging App
    Log to console  Opening received SMS from Inbox
    # ${phn_num}  Create Dictionary  text=${PARTNER_DEVICE_PHONENUMBER}
    ${status}  Wait For Exists  timeout=2000  textContains=${MESSAGE_CONTENT_1}
    Run Keyword If  ${status}  Click  textContains=${MESSAGE_CONTENT_1}
    ...  ELSE  Fail  Message not received
    Repeat Keyword  4  Press Back

Send MMS To Test Device And Open The MMS Received
    Send MMS  mo_device_serial=${PARTNER_DEVICE}  mt_device_number=${TEST_DEVICE_PHONENUMBER}  attachment_type=${MESSAGE_IMAGE_TYPE_MMS}[text]  msg_content=${MESSAGE_CONTENT_1}
    BuiltIn.Sleep  10
    Set Serial  ${TEST_DEVICE}
    Launch Messaging App
    ${status}  Wait For Exists  timeout=2000  textContains=${MESSAGE_CONTENT_1}
    Run Keyword If  ${status}  Click  textContains=${MESSAGE_CONTENT_1}
    ...  ELSE  Fail  Message not received
    Repeat Keyword  4  Press Back

Delete Recent SMS
    Log to Console  Deleting Recently Sent/Received Message
    Launch Messaging App
    ${status}  Wait For Exists  timeout=2000  &{MESSAGE_FIRST_MESSAGE}
    Run Keyword If  ${status}  Click  &{MESSAGE_FIRST_MESSAGE}
    ...  ELSE  Log To Console  No Message Available to delete
    Click  &{MESSAGE_MORE_OPTIONS}
    ${status}  Wait For Exists  timeout=2000  &{MESSAGE_DELETE_STRING_OPTION}
    Run Keyword If  ${status}  Click  &{MESSAGE_DELETE_STRING_OPTION}
    ...  ELSE  Log To Console  No Delete Option Available
    ${status2}  Wait For Exists  timeout=2000  &{MESSAGE_DELETE_STRING_OPTION}
    Run Keyword If  ${status2}  Click  &{MESSAGE_DELETE_STRING_OPTION}
    Repeat Keyword  3  Press Back

Delete All Message Thread
    Launch Messaging App
    FOR  ${index}  IN RANGE  999
        ${status}  Wait For Exists  timeout=2000  &{MESSAGE_FIRST_MESSAGE}
        Run Keyword If  ${status}  Run Keywords
        ...  Log To console  Deleting Message From Inbox  AND
        ...  Delete Recent SMS
        Run Keyword Unless  ${status}  Return From Keyword
    END
    [Teardown]  Repeat Keyword  4  Press Back

Receive SMS And Delete It
    Send SMS  ${PARTNER_DEVICE}  ${TEST_DEVICE_PHONENUMBER}  ${MESSAGE_CONTENT_1}
    BuiltIn.Sleep  10
    Set Serial  ${TEST_DEVICE}
    Launch Messaging App
    ${status}  Wait For Exists  timeout=2000  textContains=${MESSAGE_CONTENT_1}
    Run Keyword If  ${status}  Click  textContains=${MESSAGE_CONTENT_1}
    ...  ELSE  Fail  Message not received
    # Click  &{MESSAGE_DELETE_OPTION}
    # BuiltIn.Sleep  1s  For Page to refresh successfully
    # Click  &{MESSAGE_CONFIRM_DELETE_OPTION}
    # Press Back
    # ${phn_num}  Create Dictionary  text=${PARTNER_DEVICE_PHONENUMBER}
    # ${status}  Wait For Exists  timeout=2000  &{phn_num}
    # Run Keyword If  ${status}  Fail  Message not deleted
    Click  &{MESSAGE_MORE_OPTIONS}
    ${status}  Wait For Exists  timeout=2000  &{MESSAGE_DELETE_STRING_OPTION}
    Run Keyword If  ${status}  Click  &{MESSAGE_DELETE_STRING_OPTION}
    ...  ELSE  FAIL  No Delete Option Available
    ${status2}  Wait For Exists  timeout=2000  &{MESSAGE_DELETE_STRING_OPTION}
    Run Keyword If  ${status2}  Click  &{MESSAGE_DELETE_STRING_OPTION}

Receive MMS And Delete It
    Send MMS  mo_device_serial=${PARTNER_DEVICE}  mt_device_number=${TEST_DEVICE_PHONENUMBER}  attachment_type=${MESSAGE_IMAGE_TYPE_MMS}[text]  msg_content=${MESSAGE_CONTENT_1}
    BuiltIn.Sleep  10
    Set Serial  ${TEST_DEVICE}
    Launch Messaging App
    ${status}  Wait For Exists  timeout=2000  textContains=${MESSAGE_CONTENT_1}
    Run Keyword If  ${status}  Click  textContains=${MESSAGE_CONTENT_1}
    ...  ELSE  Fail  Message not received
    # Click  &{MESSAGE_DELETE_OPTION}
    # BuiltIn.Sleep  1s  For Page to refresh successfully
    # Click  &{MESSAGE_CONFIRM_DELETE_OPTION}
    # Press Back
    # ${phn_num}  Create Dictionary  text=${PARTNER_DEVICE_PHONENUMBER}
    # ${status}  Wait For Exists  timeout=2000  &{phn_num}
    # Run Keyword If  ${status}  Fail  Message not deleted
    Click  &{MESSAGE_MORE_OPTIONS}
    ${status}  Wait For Exists  timeout=2000  &{MESSAGE_DELETE_STRING_OPTION}
    Run Keyword If  ${status}  Click  &{MESSAGE_DELETE_STRING_OPTION}
    ...  ELSE  FAIL  No Delete Option Available
    ${status2}  Wait For Exists  timeout=2000  &{MESSAGE_DELETE_STRING_OPTION}
    Run Keyword If  ${status2}  Click  &{MESSAGE_DELETE_STRING_OPTION}

Forward SMS From Test Device And Delete Current Thread
    [Arguments]  ${mo_device_serial}  ${mt_device_number}  ${msg_content}
    Log To Console  Forwarding the same SMS after sending it once
    Send SMS  ${TEST_DEVICE}  ${PARTNER_DEVICE_PHONENUMBER}  ${msg_content}
    BuiltIn.Sleep  10
    Launch Messaging App
    ${status}  Wait For Exists  timeout=2000  &{MESSAGE_FIRST_MESSAGE}
    Run Keyword If  ${status}  Click  &{MESSAGE_FIRST_MESSAGE}
    Long Click  &{MESSAGE_SENT_SMS}
    ${status}  Wait For Exists  timeout=2000  &{MESSAGE_MORE_OPTIONS}
    Run Keyword If  ${status}  Click  &{MESSAGE_MORE_OPTIONS}
    ...  ELSE  FAIL  More options Not visible
    ${status}  Wait For Exists  timeout=2000  &{MESSAGE_FORWARD_OPTION}
    Run Keyword If  ${status}  Click  &{MESSAGE_FORWARD_OPTION}
    ...  ELSE  FAIL  Forward option Not visible
    ${status}  Wait For Exists  timeout=5000  &{MESSAGE_FORWARD_ALERT}
    Run Keyword If  ${status}  Click  &{MESSAGE_FORWARD_CHOOSE_NUMBER}
    BuiltIn.Sleep  3
    Click  &{MESSAGE_SEND_MESSAGE_BUTTON}
    BuiltIn.Sleep  2
    Repeat Keyword  4  Press Back
    Delete Recent SMS


Launch Messaging App on Pixel
    Execute Adb Shell Command  am start -n ${MESSAGE_APP_PACKAGE_1}
    ${status}  Wait For Exists  timeout=5000  &{MESSAGE_NEW_MESSAGE_CREATE_BTN}
    Run Keyword Unless  ${status}  Fail  Message App not launched successfully. Unable to detect new message button on UI


MT SMS Interruption
    Set Serial  ${PARTNER_DEVICE}
    Launch Messaging App on Pixel
    Send SMS  ${PARTNER_DEVICE}  ${TEST_DEVICE_PHONENUMBER}  ${MSG_ALPHA_CHAR}

Play Music and Interrupt with MT SMS
    Open Music Player Play Device Music and Play Next
    MT SMS Interruption
    Set Serial  ${TEST_DEVICE}
    Press Home


Open Camera App and Interrupt with MT SMS
    Launch Camera App
    MT SMS Interruption
    Set Serial  ${TEST_DEVICE}
    Press Home

Video Recording Interruption with MT SMS
    Capture Video Of Particular Length  30
    MT SMS Interruption
    Set Serial  ${TEST_DEVICE}
    Press Home

