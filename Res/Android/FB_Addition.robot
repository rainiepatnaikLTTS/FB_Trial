*** Settings ***

Library             cogmationlibrary
Resource            ${EXECDIR}/Res/Android/GenericFunction.robot
Resource            ${EXECDIR}/Res/Android/SettingsFunction.robot
Resource            ${EXECDIR}/Res/Android/WiFiFunction.robot
Resource            ${EXECDIR}/Res/Android/StoreFrontFunction.robot
Resource            ${EXECDIR}/Res/Android/PIMFunction.robot
Resource            ${EXECDIR}/Res/Android/PhoneFunction.robot
Resource            ${EXECDIR}/Res/Android/MusicPlayerFunction.robot
Resource            ${EXECDIR}/Res/Android/MessagingFunction.robot
Resource            ${EXECDIR}/Res/Android/SMSOverIPFunction.robot
Resource            ${EXECDIR}/Res/Android/MenuNavigationFunction.robot
Resource            ${EXECDIR}/Res/Android/MailFunction.robot
Resource            ${EXECDIR}/Res/Android/ContactsFunction.robot
Resource            ${EXECDIR}/Res/Android/CameraFunction.robot
Resource            ${EXECDIR}/Res/Android/BrowserFunction.robot
Variables           ${EXECDIR}/VariableFiles/Android/Config.py

*** Keywords ***
Launch Chats
    Execute Adb Shell Command  input keyevent KEYCODE_HOME
    BuiltIn.Sleep  3s  For Page to load successfully
    Press Back
    Execute Adb Shell Command  input touchscreen swipe 420 200 40 200
    BuiltIn.Sleep  2s  For Page to load successfully
    ${status}  Wait For Exists  timeout=5000  &{CHATS_NEW_CONV}
    Run Keyword Unless  ${status}  Fail  Phone App not launched successfully.

Launch FB Msger on Partner Device
    Press Back
    Repeat Keyword  2  Press Home
    ${status}  Wait For Exists  timeout=5000  &{FB_MSGR_APP}
    Run Keyword Unless  ${status}  Fail  Messenger App not launched successfully.
    Click  &{FB_MSGR_APP}
    Repeat Keyword  4  Press Back
    Repeat Keyword  2  Press Home
    ${status}  Wait For Exists  timeout=5000  &{FB_MSGR_APP}
    Run Keyword Unless  ${status}  Fail  Messenger App not launched successfully.
    Click  &{FB_MSGR_APP}

Launch Notification screen on DUT
    Execute Adb Shell Command  input keyevent KEYCODE_HOME
    BuiltIn.Sleep  3s  For Page to load successfully
    Press Back
    Execute Adb Shell Command  input touchscreen swipe 40 200 420 200
    BuiltIn.Sleep  2s  For Page to load successfully
    ${status}  Wait For Exists  timeout=5000  &{CHATS_NOTIFICATION_VIEW}
    Run Keyword Unless  ${status}  Fail  Phone App not launched successfully.

MO FB SMS
    Launch Chats
    Click  &{PHONE_DIALER_ACTION_BUTTON}
    Click  &{CHATS_NEW_CONV}
    # Swipe Up
    # ${status}  Wait For Exists  timeout=5000  &{CHAT_ENTER_NUMBER}
    # Run Keyword If  ${status}  Execute Adb Shell Command  input text 123456
    # ...  ELSE  Fail  Unable to Open Dialer Keypad
    # BuiltIn.Sleep  3s
    # Click  &{CHAT_ENTER_NUMBER}
    # BuiltIn.Sleep  5s
    # Click  &{CHATS_ENTER_NUMBER_DIGIT_AREA}
    # Set Text  ${PARTNER_DEVICE_PHONENUMBER}  &{PHONE_ENTER_NUMBER_DIGIT_AREA}
    # BuiltIn.Sleep  2s
    # Click  &{CHATS_SELECT_CONTACT_BUTTON}
    Click  &{CHATS_CONTACT_USER1}
    BuiltIn.Sleep  2s
    Click  &{CHATS_KEYBOARD}


MT FB SMS
    Set Serial  ${PARTNER_DEVICE}
    Close Opened Apps
    Launch FB Msger on Partner Device
    BuiltIn.Sleep  5s
    Click  &{CHATS_NEW_MESSAGE}
    BuiltIn.Sleep  2s
    ${status}  Wait For Exists  timeout=5000  &{CHAT_USER}
    Run Keyword Unless  ${status}  Fail  Messenger App not launched successfully.
    Click  &{CHAT_USER}
    BuiltIn.Sleep  5s
    Set Text  ${HELLO_MESSAGE}  &{CHATS_FB_MSGER_EDIT_TEXT}
    Click  &{FB_MSGER_SEND_BUTTON}
    BuiltIn.Sleep  2s
    Set Serial  ${TEST_DEVICE}
    Launch Notification screen on DUT
    ${status}  Wait For Exists  timeout=5000  &{CHATS_NOTIFICATION_VERIFIER}
    Run Keyword Unless  ${status}  Fail  Test Failed
    Click  &{NOTIFCATION_CLEAR_ALL_BUTTON}
    Press Home


MT FB SMS with Image Attachment
    Set Serial  ${PARTNER_DEVICE}
    Close Opened Apps
    Launch FB Msger on Partner Device
    BuiltIn.Sleep  5s
    Click  &{CHATS_NEW_MESSAGE}
    BuiltIn.Sleep  2s
    ${status}  Wait For Exists  timeout=5000  &{CHAT_USER}
    Run Keyword Unless  ${status}  Fail  Messenger App not launched successfully.
    Click  &{CHAT_USER}
    BuiltIn.Sleep  5s
    Click  &{CHATS_CHOOSE_PHOTO}
    BuiltIn.Sleep  2s
    # Click  &{CHATS_IMAGE_SCREEN}
    # Click  &{CHATS_IMAGE_FR_ATTACHMENT}
    Click At Coordinates  183  2168
    BuiltIn.Sleep  2s
    Click  &{CHATS_SEND_IMAGE}
    BuiltIn.Sleep  2s
    Set Serial  ${TEST_DEVICE}
    Launch Chats
    Scroll Vertically to Object  &{CHATS_CONTACT_USER_01}
    Click  &{CHATS_CONTACT_USER_01}
    BuiltIn.Sleep  5s
    ${status}  Wait For Exists  timeout=5000  &{CHATS_ATTACHMENT}
    Run Keyword Unless  ${status}  Fail  Test Failed
    Press Back
    Press Home


MO FB SMS with Image Attachment
    Launch Chats
    Scroll Vertically to Object  &{CHATS_CONTACT_USER_01}
    Click  &{CHATS_CONTACT_USER_01}
    BuiltIn.Sleep  2s
    Click  &{CHATS_CAMERA_ATTACHMENT}
    BuiltIn.Sleep  2s
    Click  &{CAMERA_SHUTTER_BTN}
    BuiltIn.Sleep  2s
    Click  &{CHATS_CONFIRMATION_BUTTON}
    BuiltIn.Sleep  2s
    Set Serial  ${PARTNER_DEVICE}
    Close Opened Apps
    Launch FB Msger on Partner Device
    # Click  &{CHATS_RECENT_THREAD}
    BuiltIn.Sleep  3s
    Click At Coordinates  142  1010
    ${status}  Wait For Exists  timeout=5000  &{CHATS_PHOTO_MSG}
    Run Keyword Unless  ${status}  Fail  Test Failed
    Press Home


MO FB SMS with Audio Message
    Launch Chats
    Scroll Vertically to Object  &{CHATS_CONTACT_USER_01}
    Click  &{CHATS_CONTACT_USER_01}
    BuiltIn.Sleep  2s
    Click  &{CHATS_RECORD_BUTTON}
    BuiltIn.Sleep  10s
    Click  &{CHATS_STOP_SEND_BUTTON}
    BuiltIn.Sleep  2s
    Set Serial  ${PARTNER_DEVICE}
    Close Opened Apps
    Launch FB Msger on Partner Device
    # Click  &{CHATS_RECENT_THREAD}
    Click At Coordinates  142  1010
    ${status}  Wait For Exists  timeout=5000  &{CHATS_RECEIVE_VOICE_MSG}
    Run Keyword Unless  ${status}  Fail  Test Failed
    Press Home


MT FB SMS with Audio Message
    Set Serial  ${PARTNER_DEVICE}
    Close Opened Apps
    Launch FB Msger on Partner Device
    BuiltIn.Sleep  5s
    Click  &{CHATS_NEW_MESSAGE}
    BuiltIn.Sleep  2s
    ${status}  Wait For Exists  timeout=5000  &{CHAT_USER}
    Run Keyword Unless  ${status}  Fail  Messenger App not launched successfully.
    Click  &{CHAT_USER}
    BuiltIn.Sleep  5s
    Click  &{CHATS_RECORD_BUTTON_PARTNER}
    BuiltIn.Sleep  10s
    # Click  &{CHATS_IMAGE_SCREEN}
    # Click  &{CHATS_IMAGE_FR_ATTACHMENT}
    Click At Coordinates  1344  2829
    BuiltIn.Sleep  2s
    Set Serial  ${TEST_DEVICE}
    Launch Chats
    Scroll Vertically to Object  &{CHATS_CONTACT_USER_01}
    Click  &{CHATS_CONTACT_USER_01}
    BuiltIn.Sleep  2s
    ${status}  Wait For Exists  timeout=5000  &{CHATS_VOICE_MSG_PLAY_OR_PAUSE_BUTTON}
    Run Keyword Unless  ${status}  Fail  Test Failed
    Press Back
    Press Home


MO FB SMS with Video Message
    Launch Chats
    Scroll Vertically to Object  &{CHATS_CONTACT_USER_01}
    Click  &{CHATS_CONTACT_USER_01}
    BuiltIn.Sleep  2s
    Click  &{CHATS_CAMERA_ATTACHMENT}
    BuiltIn.Sleep  10s
    # Swipe Left
    Repeat Keyword  3  Swipe Right   #To set default mode as image capture
    Log To Console  Switching to Video mode
    Swipe Left
    Click  &{CAMERA_SHUTTER_BTN}
    BuiltIn.Sleep  7s
    Click  &{CAMERA_SHUTTER_BTN}
    BuiltIn.Sleep  5s
    # Click  &{CHATS_CONFIRMATION_BUTTON}
    Click At Coordinates  380  380
    BuiltIn.Sleep  10s
    Set Serial  ${PARTNER_DEVICE}
    Close Opened Apps
    Launch FB Msger on Partner Device
    # Click  &{CHATS_RECENT_THREAD}
    BuiltIn.Sleep  10s
    Click At Coordinates  142  1010
    ${status}  Wait For Exists  timeout=5000  &{CHATS_VIDEO_MSG}
    Run Keyword Unless  ${status}  Fail  Test Failed
    Press Home


MT FB SMS with Video Message
    Set Serial  ${PARTNER_DEVICE}
    Launch FB Msger on Partner Device
    BuiltIn.Sleep  5s
    Click  &{CHATS_NEW_MESSAGE}
    BuiltIn.Sleep  2s
    ${status}  Wait For Exists  timeout=5000  &{CHAT_USER}
    Run Keyword Unless  ${status}  Fail  Messenger App not launched successfully.
    Click  &{CHAT_USER}
    BuiltIn.Sleep  5s
    Click  &{CHATS_TAKE_PHOTO}
    BuiltIn.Sleep  2s
    Click  &{CHATS_VIDEO_SWITCH}
    BuiltIn.Sleep  2s
    Click  &{CHATS_VIDEO_CAPTURE}
    BuiltIn.Sleep  5s
    Click  &{FB_MSGER_SEND_BUTTON}
    BuiltIn.Sleep  2s
    Set Serial  ${TEST_DEVICE}
    Launch Chats
    Scroll Vertically to Object  &{CHATS_CONTACT_USER_01}
    Click  &{CHATS_CONTACT_USER_01}
    BuiltIn.Sleep  5s
    ${status}  Wait For Exists  timeout=5000  &{CHATS_ATTACHMENT}
    Run Keyword Unless  ${status}  Fail  Test Failed
    Press Back
    Press Home


Read MT FB SMS
    Set Serial  ${PARTNER_DEVICE}
    Close Opened Apps
    Launch FB Msger on Partner Device
    BuiltIn.Sleep  5s
    Click  &{CHATS_NEW_MESSAGE}
    BuiltIn.Sleep  2s
    ${status}  Wait For Exists  timeout=5000  &{CHAT_USER}
    Run Keyword Unless  ${status}  Fail  Messenger App not launched successfully.
    Click  &{CHAT_USER}
    BuiltIn.Sleep  5s
    Set Text  ${HELLO_MESSAGE}  &{CHATS_FB_MSGER_EDIT_TEXT}
    Click  &{FB_MSGER_SEND_BUTTON}
    BuiltIn.Sleep  2s
    Set Serial  ${TEST_DEVICE}
    Launch Chats
    Scroll Vertically to Object  &{CHATS_CONTACT_USER_01}
    Click  &{CHATS_CONTACT_USER_01}
    BuiltIn.Sleep  5s
    ${status}  Wait For Exists  timeout=5000  &{HELLO_TEXT_VERIFY}
    Run Keyword Unless  ${status}  Fail  Test Failed
    Press Back
    Press Home


FB Calling from DUT to Partner Device
    MO Calling from FB Chats
    BuiltIn.Sleep  10s
    Set Serial  ${PARTNER_DEVICE}
    Recieve FB MT Call
    BuiltIn.Sleep  5s
    Terminate FB MT Call
    Close Opened Apps

FB Calling from Partner Device to DUT
    MT Calling from Partner Device
    BuiltIn.Sleep  10s
    Set Serial  ${TEST_DEVICE}
    BuiltIn.Sleep  5s
    Receive FB MO Call
    Set Serial  ${PARTNER_DEVICE}
    BuiltIn.Sleep  5s
    Terminate FB MT Call
    Close Opened Apps

MO Calling from FB Chats
    Launch Chats
    Scroll Vertically to Object  &{CHATS_CONTACT_USER_01}
    Click  &{CHATS_CONTACT_USER_01}
    BuiltIn.Sleep  2s
    Click  &{CHATS_PHONE_ATTACHMENT}
    BuiltIn.Sleep  2s
    Click  &{CHATS_VOICE_CALL_BUTTON}
    ${status}  Wait For Exists  timeout=5000  &{CHATS_CALL_END_BUTTON}
    Run Keyword Unless  ${status}  Fail  Calling Screen not successfully displayed.


MT Calling from Partner Device
    Set Serial  ${PARTNER_DEVICE}
    Close Opened Apps
    Launch FB Msger on Partner Device
    BuiltIn.Sleep  5s
    Click  &{CHATS_NEW_MESSAGE}
    BuiltIn.Sleep  2s
    ${status}  Wait For Exists  timeout=5000  &{CHAT_USER}
    Run Keyword Unless  ${status}  Fail  Messenger App not launched successfully.
    Click  &{CHAT_USER}
    BuiltIn.Sleep  5s
    Click  &{CHATS_PIXEL_VOICE_CALL_BUTTON}
    ${status}  Wait For Exists  timeout=5000  &{PHONE_END_CALL_ICON_1}
    Run Keyword Unless  ${status}  Fail  Calling Screen not successfully displayed.

# Delete MT FB SMS
Recieve FB MT Call
    # Execute Adb Command  -s ${PARTNER_DEVICE} shell input keyevent 5
    Click At Coordinates  1063  467
    BuiltIn.Sleep  5s
    ${status}  Wait For Exists  timeout=5000  &{PHONE_END_CALL_ICON_1}
    Run Keyword Unless  ${status}  Fail  Calling Screen not successfully displayed.

Receive FB MO Call
    Click  &{CHATS_VOICE_CALL_ANSWER_BUTTON}
    BuiltIn.Sleep  5s
    # ${status}  Wait For Exists  timeout=5000  &{CHATS_CALL_END_BUTTON}
    # Run Keyword Unless  ${status}  Fail  Calling Screen not successfully displayed.


FB Video Calling from DUT to Partner Device
    MO Video Calling from FB Chats
    BuiltIn.Sleep  10s
    Set Serial  ${PARTNER_DEVICE}
    Recieve FB MT Call
    BuiltIn.Sleep  5s
    Terminate FB MT Call
    Close Opened Apps

FB Video Calling from Partner Device to DUT
    MT Video Calling from Partner Device
    BuiltIn.Sleep  10s
    Set Serial  ${TEST_DEVICE}
    BuiltIn.Sleep  5s
    Receive FB MO Call
    Set Serial  ${PARTNER_DEVICE}
    BuiltIn.Sleep  5s
    Terminate FB MT Call
    Close Opened Apps


MO Video Calling from FB Chats
    Launch Chats
    Scroll Vertically to Object  &{CHATS_CONTACT_USER_01}
    Click  &{CHATS_CONTACT_USER_01}
    BuiltIn.Sleep  2s
    Click  &{CHATS_PHONE_ATTACHMENT}
    BuiltIn.Sleep  2s
    Click  &{CHATS_VIDEO_CALL_BUTTON}
    ${status}  Wait For Exists  timeout=5000  &{CHATS_CALL_END_BUTTON}
    Run Keyword Unless  ${status}  Fail  Calling Screen not successfully displayed.

MT Video Calling from Partner Device
    Set Serial  ${PARTNER_DEVICE}
    Close Opened Apps
    Launch FB Msger on Partner Device
    BuiltIn.Sleep  5s
    Click  &{CHATS_NEW_MESSAGE}
    BuiltIn.Sleep  2s
    ${status}  Wait For Exists  timeout=5000  &{CHAT_USER}
    Run Keyword Unless  ${status}  Fail  Messenger App not launched successfully.
    Click  &{CHAT_USER}
    BuiltIn.Sleep  5s
    Click  &{CHATS_VIDEO_CHAT_BUTTON}
    ${status}  Wait For Exists  timeout=5000  &{PHONE_END_CALL_ICON_1}
    Run Keyword Unless  ${status}  Fail  Calling Screen not successfully displayed.

FB Call From Partner Device
    Set Serial  ${PARTNER_DEVICE}
    Close Opened Apps
    Launch FB Msger on Partner Device
    BuiltIn.Sleep  5s
    Click  &{CHATS_NEW_MESSAGE}
    BuiltIn.Sleep  2s
    ${status}  Wait For Exists  timeout=5000  &{CHAT_USER}
    Run Keyword Unless  ${status}  Fail  Messenger App not launched successfully.
    Click  &{CHAT_USER}
    BuiltIn.Sleep  5s
    Click  &{CHATS_PIXEL_VOICE_CALL_BUTTON}
    BuiltIn.Sleep  5s
    ${status}  Wait For Exists  timeout=5000  &{PHONE_END_CALL_ICON_1}
    Run Keyword Unless  ${status}  Fail  Calling Screen not successfully displayed.

Notification Screen Options
    BuiltIn.Sleep  2s
    ${status}  Wait For Exists  timeout=3000  &{CHATS_NOTIFICATION_VIEW}
    Run Keyword If  ${status}  Clear Notifications
    ...  ELSE  Press Back


Clear Notifications
    Click  &{NOTIFCATION_CLEAR_ALL_BUTTON}
    BuiltIn.Sleep  2s

Terminate FB MT Call
    BuiltIn.Sleep  2s
    CLick At Coordinates  700  500
    Click  &{PHONE_END_CALL_ICON_1}
    BuiltIn.Sleep  2s
    Click  &{CHATS_NOT_NOW_BUTTON}


FB Video Call with MT Call Interruption Notification
    Set Serial  ${PARTNER_DEVICE}
    BuiltIn.Sleep  3s
    Press Home
    # Close All Apps
    Launch FB Msger on Partner Device
    # Click  &{CHATS_NEW_MESSAGE}
    BuiltIn.Sleep  2s
    # ${status}  Wait For Exists  timeout=5000  &{CHAT_USER}
    # Run Keyword Unless  ${status}  Fail  Messenger App not launched successfully.
    # Click  &{CHAT_USER}
    # Click At Coordinates  324  1155
    Click At Coordinates  419  971
    BuiltIn.Sleep  5s
    ${status}  Wait For Exists  timeout=3000  &{CHATS_VIDEO_CHAT_BUTTON}
    Run Keyword If  ${status}  Click  &{CHATS_VIDEO_CHAT_BUTTON}
    ...  ELSE  FAIL  Video Call Not initiated
    BuiltIn.Sleep  3s
    Check Permission for Mesenger
    BuiltIn.Sleep  2s
    ${status}  Wait For Exists  timeout=5000  &{PHONE_END_CALL_ICON_1}
    Run Keyword Unless  ${status}  Fail  Call not initiated successfully. Unable to loacte End Call button on UI.
    BuiltIn.Sleep  5s
    Execute Adb Command  -s ${TEST_DEVICE} shell input keyevent 5
    BuiltIn.Sleep  2s
    Set Serial  ${TEST_DEVICE}
    # BuiltIn.Sleep  3s
    # Click  &{PHONE_ACCEPT_BTN_1}
    BuiltIn.Sleep  10s
    MT Call Interruption for FB Messenger
    Terminate Phone Call
    Press Home
    # Set Serial  ${TEST_DEVICE}


MT Call Interruption for FB Messenger
    Set Serial  ${PARTNER_DEVICE}

    Execute Adb Command  -s ${PARTNER_DEVICE} shell am start -a android.intent.action.CALL -d tel:${TEST_DEVICE_PHONENUMBER}
    ${status}  Wait For Exists  timeout=3000  &{PHONE_END_CALL_ICON_1}
    Run Keyword If  ${status}  Log To Console  Call initiated from partner device
    Run Keyword Unless  ${status}  FAIL  Call Not initiated
    BuiltIn.Sleep  1s
    Set Serial  ${TEST_DEVICE}
    ${status}  Wait For Exists  timeout=30000  &{PHONE_ACCEPT_BTN_1}
    Run Keyword If  ${status}  Log To Console  Call interruption successful
    Run Keyword Unless  ${status}  FAIL  No interruption


Check Permission for Mesenger
    ${status}  Wait for exists  5  &{CHATS_PERMISSION_FOR_VIDEO_CALL}
    Run Keyword If  ${status}  Click  &{CHATS_PERMISSION_FOR_VIDEO_CALL}
    ...  ELSE  BuiltIn.Sleep  1s
    ${status}  Wait for exists  5  &{CHATS_VIDEO_PERMISSION}
    Run Keyword If  ${status}  Click  &{CHATS_VIDEO_PERMISSION}
    ...  ELSE  BuiltIn.Sleep  1s
    ${status}  Wait for exists  5  &{CHATS_AUDIO_PERMISSION}
    Run Keyword If  ${status}  Click  &{CHATS_AUDIO_PERMISSION}
    ...  ELSE  BuiltIn.Sleep  1s