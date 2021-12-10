*** Settings ***

Library             cogmationlibrary
Resource            ${EXECDIR}/Res/Android/GenericFunction.robot
Resource            ${EXECDIR}/Res/Android/SettingsFunction.robot
Resource            ${EXECDIR}/Res/Android/MusicPlayerFunction.robot
Resource            ${EXECDIR}/Res/Android/CameraFunction.robot

Variables           ${EXECDIR}/VariableFiles/Android/Config.py

*** Keywords ***

Launch Call History
    # Execute Adb Shell Command  input keyevent KEYCODE_HOME
    # BuiltIn.Sleep  3s  For Page to load successfully
    Press Home
    Repeat Keyword  4  Press Back
    Log To Console  Swiping Left to get into Call history of MOS device
    # Execute Adb Shell Command  input touchscreen swipe 420 200 40 200
    Swipe Left
    BuiltIn.Sleep  2s  For Page to load successfully
    # Execute Adb Shell Command  input touchscreen swipe 420 200 40 200
    Swipe Left
    ${status}  Wait For Exists  timeout=5000  &{RECENT_CALLS_NAME}
    Run Keyword If  ${status}  Log To console  Call History is visible
    Run Keyword Unless  ${status}  Fail  Call History is not visible

Initiate Phone Call From Call History
    Launch Call History
    Log To Console  Clicking on last number in History to make call
    ${status}  Wait For Exists  timeout=15000  &{PHONE_CALL_HISTORY_DIAL_ICON}
    Run Keyword If  ${status}  Click  &{PHONE_CALL_HISTORY_DIAL_ICON}
    ...  ELSE  Fail  Unable to locate Dial Icon In Call History
    # BuiltIn.Sleep  5s
    # Pop-up window dismissal
    ${status}  Wait For Exists  timeout=2000  &{VOICE_CALL_OPTION}
    Run Keyword If  ${status}  Click  &{VOICE_CALL_OPTION}
    ${status}  Wait For Exists  timeout=15000  &{PHONE_END_CALL_ICON}
    Verify Particular Call State  mCallState=2   Connected/Active

Establish Call Connectivity From Call History
    Set Serial  ${TEST_DEVICE}
    Initiate Phone Call From Call History
    ##############################################################
    Set Serial  ${PARTNER_DEVICE}
    Verify Particular Call State  mCallState=1  Ringing
    Answer Phone Call
    BuiltIn.Sleep  10s
    Terminate Phone Call
    ##############################################################
    [Teardown]  Handle Teardown For Call Connectivity

Handle Teardown For Call Connectivity
    Terminate Phone Call
    Repeat Keyword  3  Press Back
    Set Serial  ${TEST_DEVICE}
    Repeat Keyword  4  Press Back

Terminate Phone Call
    Execute Adb Command  shell input keyevent KEYCODE_ENDCALL
    Log To console  Terminated Call
    BuiltIn.Sleep  1
    Verify Particular Call State  mCallState=0  Idle/Not connected
    Press Back

Answer Phone Call

    # BuiltIn.Sleep  1
    # ${status}  Wait For exists  timeout=20  &{CHATS_VOICE_CALL_ANSWER_BUTTON}
    # # Run Keyword If  ${status}  Click  &{CHATS_VOICE_CALL_ANSWER_BUTTON}
    # # ...  ELSE  FAIL  Answer button not present
    Execute Adb Command  shell input keyevent KEYCODE_CALL
    Verify Particular Call State  mCallState=2  Connected/Active
    Log To console  Answered Call
    Press Back

Initiating MO Call from Dialer
    Set Serial  ${TEST_DEVICE}
    Launch Call History
    Click  &{PHONE_DIALER_ACTION_BUTTON}
    BuiltIn.Sleep  3s
    Open Dialpad and Call Partner Device

    Set Serial  ${PARTNER_DEVICE}
    Wait For Exists  timeout=10  &{PHONE_NOTIFICATION_FLANGE_ANSWER}
    Verify Particular Call State  mCallState=1  Ringing
    Answer Phone Call
    Terminate Phone Call

Sample Test Initiating MO Call from Dialer
    Set Serial  ${TEST_DEVICE}
    Launch Call History
    Click  &{PHONE_DIALER_ACTION_BUTTON}
    BuiltIn.Sleep  3s
    Open Dialpad and Call Partner Device

    Set Serial  ${PARTNER_DEVICE}
    Verify Particular Call State  mCallState=1  Ringing
    Answer Phone Call
    Terminate Phone Call

Open Dialpad and Call Partner Device
   ${status}  Wait For exists  timeout=5000  &{PHONE_KEYPAD_ICON}
    Run Keyword If  ${status}  Click  &{PHONE_KEYPAD_ICON}
    ...  ELSE  FAIL  Unable to open Phone Dialpad
    Set Text  ${PARTNER_DEVICE_PHONENUMBER}  &{PHONE_ENTER_NUMBER_DIGIT_AREA}
    ${status}  Wait For exists  timeout=5000  &{PHONE_DIAL_NUMBER_ICON}
    Run Keyword If  ${status}  Click  &{PHONE_DIAL_NUMBER_ICON}
    Run Keyword Unless  ${status}  Fail  Call not initiated successfully. Unable to locate Call button on UI.
    ${status}  Wait For Exists  timeout=2000  &{VOICE_CALL_OPTION}
    Run Keyword If  ${status}  Click  &{VOICE_CALL_OPTION}
    Verify Particular Call State  mCallState=2   Connected/Active

MT Call Receiving on Test Device Dialer
    MT Call Interruption
    Set Serial  ${TEST_DEVICE}
    Execute Adb Command  shell input keyevent KEYCODE_CALL
    ${status}  Wait For exists  timeout=20  &{CHATS_VOICE_CALL_ANSWER_BUTTON}
    Run Keyword If  ${status}  Click  &{CHATS_VOICE_CALL_ANSWER_BUTTON}
    Verify Particular Call State  mCallState=2  Connected/Active
    Log To console  Answered Call

MT Call Interruption
    Set Serial  ${PARTNER_DEVICE}
    Log To Console  Initiating MT Call process
    Execute Adb Command  -s ${PARTNER_DEVICE} shell am start -a android.intent.action.CALL -d tel:${TEST_DEVICE_PHONENUMBER}
    ${status}  Wait For Exists  timeout=3000  &{PHONE_END_CALL_ICON_1}
    Run Keyword If  ${status}  Log To Console  Call initiated successfully
    Run Keyword Unless  ${status}  FAIL  Call Not initiated
    # Verify Particular Call State  mCallState=1   Ringing

Play Music and Interrupt with MT Call
    Set Serial  ${TEST_DEVICE}
    Press Home
    Sample Test Open Music Player Play Device Music and Play Next
    BuiltIn.Sleep  2s
    MT Call Interruption

    Log To Console  Closing Music Player
    Execute Adb Command  -s ${TEST_DEVICE} shell am force-stop ${MUSIC_PLAYER_PACKAGE}
    BuiltIn.Sleep  2s
    Press Back
    Press Home

Open Camera App and Interrupt with MT Call
    Set Serial  ${TEST_DEVICE}
    Press Home
    Launch Camera App
    BuiltIn.Sleep  2s
    MT Call Interruption
    Verify MT Call on DUT
    Terminate Phone Call
    Log To Console  Closing Camera App
    Execute Adb Command  -s ${TEST_DEVICE} shell am force-stop ${CAMERA_APP_PACKAGE}
    Press Back


Video Recording Interruption with MT Call
    Set Serial  ${TEST_DEVICE}
    Launch Camera App
    BuiltIn.Sleep  3s
    # Repeat Keyword  3  Swipe Right   #To set default mode as image capture
    # Repeat Keyword  3  swipe_by_coordinates  30  300  435  300   ## added since swipe left cicks on capture button
    Log To Console  Switching to Video mode
    # Swipe Left
    swipe_by_coordinates  435  300  30  300   ## added since swipe left cicks on capture button
    # ${status}  Wait For Exists  10  &{CAMERA_VIDEO_SWITCH_MODE}
    # Run keyword if  ${status}  Click  &{CAMERA_VIDEO_SWITCH_MODE}
    ${capture_btn}  Wait For Exists  10  &{CAMERA_SHUTTER_BTN}
    Run Keyword If  ${capture_btn}  Click  &{CAMERA_SHUTTER_BTN}
    Run Keyword Unless  ${capture_btn}  FAIL  Unable to capture video
    # click at coordinates  437  235  ## In new build, it doesn't click on shutter button
    ${status}  Wait For exists  5  ${VIDEO_RECORDING_START_INDICATOR}
    Run Keyword If  ${status}  Log To Console  Video recording started successfully
    ...  ELSE  FAIL  Video recording did not start
    MT Call Interruption
    Verify MT Call on DUT
    Terminate Phone Call
    Log To Console  Closing Camera App
    Execute Adb Command  -s ${TEST_DEVICE} shell am force-stop ${CAMERA_APP_PACKAGE}
    Press Back
    Press Home

Accept MT Call on DUT and Terminate the Call
    # Set Serial  ${TEST_DEVICE}
    # Verify Particular Call State  mCallState=1   Ringing
    ${status}  Wait For exists  10  &{PHONE_ACCEPT_BTN_1}
    Run Keyword If  ${status}  Click  &{PHONE_ACCEPT_BTN_1}
    ...  ELSE  Fail  Unable to receive call
    Verify Particular Call State  mCallState=2   Connected/Active
    # Pop-up window dismissal
    Log To Console  Terminating Call from DUT
    ${status}  Wait For exists  5  ${PHONE_END_CALL_ICON}
    Run Keyword If  ${status}  Click  &{PHONE_END_CALL_ICON}
    # Run Keyword Unless  ${status}  Fail  Call not terminated successfully
    BuiltIn.Sleep  1
    Verify Particular Call State  mCallState=0   Idle/Not connected
    Press Back

Terminate Phone Call on Partner Device
    Set Serial  ${PARTNER_DEVICE}
    Execute Adb Command  shell input keyevent KEYCODE_ENDCALL
    Log To console  Terminated Call
    BuiltIn.Sleep  1
    Verify Particular Call State  mCallState=0  Idle/Not connected
    Press Back

Verify MT Call on DUT
    Set Serial  ${TEST_DEVICE}
    ${status}  Wait For exists  timeout=17  &{CHATS_VOICE_CALL_ANSWER_BUTTON}
    Run Keyword If  ${status}  Log to Console  MT Call is successfully
    ${status}  Wait For exists  timeout=3  textContains=Incoming
    Run Keyword If  ${status}  Log to Console  MT Call is successfully
    ...  ELSE  Verify Particular Call State  mCallState=1  Ringing