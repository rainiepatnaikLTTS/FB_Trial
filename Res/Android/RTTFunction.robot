*** Settings ***

Library             cogmationlibrary
Resource            ${EXECDIR}/Res/Android/GenericFunction.robot
Resource            ${EXECDIR}/Res/Android/PhoneFunction.robot

Variables           ${EXECDIR}/VariableFiles/Android/Config.py

*** Keywords ***
Enable RTT In MOS Device
    Set Serial  ${TEST_DEVICE}
    Log To Console  Enabling RTT in MOS Device
    Open MOS Settings
    scroll_vertically_to_object  &{SETTINGS_ACCESSIBILITY}
    Click  &{SETTINGS_ACCESSIBILITY}
    scroll_vertically_to_object  &{RTT_OPTION}
    Click  &{RTT_OPTION}
    # Wait For Exists  timeout=5000  &{RTT_ENABLE_SWITCH}
    # ${switch_obj}  Get Object  &{RTT_ENABLE_SWITCH}
    # ${switch_info}  Get Info Of Object  ${switch_obj}
    # # Log  ${switch_info}
    # # Log to console  ${switch_info}[enabled]
    # Run Keyword If  '${switch_info}[checked]'== 'True'  Run Keywords
    # ...  Log To Console  RTT is enabled  AND
    # ...  Return From Keyword
    # Run Keyword If  '${switch_info}[checked]'== 'False'   Run keywords
    # ...  Log To Console  Clicking on switch to enable RTT  AND
    # ...  Click  &{RTT_ENABLE_SWITCH}
    ${status}  Wait For Exists  &{RTT_ALWAYS_SHOW}
    Run Keyword If  ${status}  Click  &{RTT_ALWAYS_SHOW}

Enable RTT As Particular Option In Partner Device
    [Arguments]  &{option}
    Set Serial  ${PARTNER_DEVICE}
    Press Home
    Log To console  Enabling RTT in partner device
    Execute Adb Shell Command  am start com.google.android.dialer/com.google.android.dialer.extensions.GoogleDialtactsActivity
    Click  &{PHONE_MORE_OPTIONS}
    Wait For Exists  timeout=5000  text=Settings
    Click  text=Settings
    Wait For Exists  timeout=5000  text=Accessibility
    Click  text=Accessibility
    ${status}  Wait For Exists  timeout=5000  text=Allow messaging within a voice call
    Run Keyword If  ${status}  Run Keywords
    ...  Log To Console  Need to check RTT switch status  AND
    ...  Get RTT Switch Info And Enable It  AND
    ...  Return From Keyword

    Wait For Exists  textContains=RTT
    Click  textContains=RTT
    ${status}  Wait For Exists  &{option}
    Run Keyword If  ${status}  Click  &{option}
    # ...  ELSE  FAIL  RTT Options not visible   ## commented since few devices don't have these options


Disable RTT As Particular Option In Partner Device
    [Arguments]  &{option}
    Set Serial  ${PARTNER_DEVICE}
    Press Home
    Log To console  Disabling RTT in partner device
    Execute Adb Shell Command  am start com.google.android.dialer/com.google.android.dialer.extensions.GoogleDialtactsActivity
    Click  &{PHONE_MORE_OPTIONS}
    Wait For Exists  timeout=5000  text=Settings
    Click  text=Settings
    Wait For Exists  timeout=5000  text=Accessibility
    Click  text=Accessibility
    ${status}  Wait For Exists  timeout=5000  text=Allow messaging within a voice call
    Run Keyword If  ${status}  Run Keywords
    ...  Log To Console  Need to check RTT switch status  AND
    ...  Get RTT Switch Info And Disable It  AND
    ...  Return From Keyword

    Wait For Exists  textContains=RTT
    Click  textContains=RTT
    ${status}  Wait For Exists  &{option}
    Run Keyword If  ${status}  Click  &{option}
    # ...  ELSE  FAIL  RTT Options not visible   ## commented since few devices don't have these options

Get RTT Switch Info And Enable It
    ${obj_info_dict}  get the relative object info  obj_a=&{rtt_selector}  obj_b=&{switch_selector}  position=right
    Run Keyword If  '${obj_info_dict}[checked]'== 'True'  Run Keywords
    ...  Log To Console  RTT is enabled  AND
    ...  Return From Keyword
    Run Keyword If  '${obj_info_dict}[checked]'== 'False'   Run keywords
    ...  Log To Console  Clicking on switch to enable RTT  AND
    ...  Click  &{rtt_selector}  AND
    ...  Return From Keyword

Get RTT Switch Info And Disable It
    ${obj_info_dict}  get the relative object info  obj_a=&{rtt_selector}  obj_b=&{switch_selector}  position=right
    Run Keyword If  '${obj_info_dict}[checked]'== 'False'  Run Keywords
    ...  Log To Console  RTT is Disabled  AND
    ...  Return From Keyword
    Run Keyword If  '${obj_info_dict}[checked]'== 'True'   Run keywords
    ...  Log To Console  Clicking on switch to Disable RTT  AND
    ...  Click  &{rtt_selector}  AND
    ...  Return From Keyword


Disable RTT In MOS Device
    Set Serial  ${TEST_DEVICE}
    Log To Console  Disabling RTT in MOS Device
    Open MOS Settings
    scroll_vertically_to_object  &{SETTINGS_ACCESSIBILITY}
    Click  &{SETTINGS_ACCESSIBILITY}
    scroll_vertically_to_object  &{RTT_OPTION}
    Click  &{RTT_OPTION}
    # Wait For Exists  &{RTT_ENABLE_SWITCH}
    # ${switch_obj}  Get Object  &{RTT_ENABLE_SWITCH}
    # ${switch_info}  Get Info Of Object  ${switch_obj}
    # Run Keyword If  '${switch_info}[checked]'== 'False'  Log To Console  RTT is disabled
    # Run Keyword If  '${switch_info}[checked]'== 'True'   Run keywords
    # ...  Log To Console  Clicking on switch to disable RTT  AND
    # ...  Click  &{RTT_ENABLE_SWITCH}
    ${status}  Wait For Exists  &{RTT_NEVER_SHOW}
    Run Keyword If  ${status}  Click  &{RTT_NEVER_SHOW}

Make Audio Call And Upgrade To RTT
    [Arguments]  ${random_msg}
    Set Serial  ${TEST_DEVICE}
    Launch Call History
    Click  &{PHONE_DIALER_ACTION_BUTTON}
    BuiltIn.Sleep  2s
    Execute Adb Shell Command  am broadcast -a com.facebook.wearable.system.keyboard.REQUEST_INPUT -e android.intent.extra.TEXT ${PARTNER_DEVICE_PHONENUMBER}
    BuiltIn.Sleep  2s
    ${status}  Wait For Exists  timeout=5000  textContains=Keypad
    Run Keyword If  ${status}  Click  textContains=Keypad
    ...  ELSE  Click  &{CHATS_DIALPAD_BUTTON}
    BuiltIn.Sleep  2s
    Set Text  ${PARTNER_DEVICE_PHONENUMBER}  &{PHONE_ENTER_NUMBER_DIGIT_AREA}
    BuiltIn.Sleep  2s
    Log To Console  Making call to given phone number
    Wait For Exists  timeout=15000  &{PHONE_DIAL_NUMBER_ICON}
    ${status}  Run Keyword And Return Status  Click  &{PHONE_DIAL_NUMBER_ICON}
    Run Keyword Unless  ${status}  Fail  Call not initiated successfully. Unable to locate End Call button on UI.
    ${status}  Wait For Exists  timeout=15000  &{VOICE_CALL_OPTION}
    Run Keyword If  ${status}  Click  &{VOICE_CALL_OPTION}
    BuiltIn.Sleep  5s
    Run Keyword and Ignore Error  Verify Particular Call State  mCallState=2   Connected/Active  ##11th Oct rain
    ${status}  Wait For Exists  timeout=3000  &{PHONE_END_CALL_ICON}
    Run Keyword Unless  ${status}  Fail  Call not initiated successfully. Unable to locate End Call button on UI.

    Set Serial  ${PARTNER_DEVICE}
    Press Home
    ${status}  Wait For Exists  timeout=10000  &{PHONE_NOTIFICATION_FLANGE_ANSWER}
    Verify Particular Call State  mCallState=1  Ringing
    Run Keyword If  ${status}  Click  &{PHONE_NOTIFICATION_FLANGE_ANSWER}
    Log To Console  Received call on partner device
    BuiltIn.Sleep  2
    Verify Particular Call State  mCallState=2  Connected/Active
    Set Serial  ${TEST_DEVICE}
    Verify RTT Call Is Placed In DUT  ${random_msg}
    End RTT Call In Test Device

Make RTT Call From DUT
    [Arguments]  ${random_msg}
    Set Serial  ${TEST_DEVICE}
    Launch Call History
    Click  &{PHONE_DIALER_ACTION_BUTTON}
    BuiltIn.Sleep  2s
    Execute Adb Shell Command  am broadcast -a com.facebook.wearable.system.keyboard.REQUEST_INPUT -e android.intent.extra.TEXT ${PARTNER_DEVICE_PHONENUMBER}
    BuiltIn.Sleep  2s
    ${status}  Wait For Exists  timeout=5000  textContains=Keypad
    Run Keyword If  ${status}  Click  textContains=Keypad
    ...  ELSE  Click  &{CHATS_DIALPAD_BUTTON}
    BuiltIn.Sleep  2s
    Set Text  ${PARTNER_DEVICE_PHONENUMBER}  &{PHONE_ENTER_NUMBER_DIGIT_AREA}
    BuiltIn.Sleep  2s
    Wait For Exists  timeout=15000  &{PHONE_DIAL_NUMBER_ICON}
    ${status}  Run Keyword And Return Status  Click  &{PHONE_DIAL_NUMBER_ICON}
    Run Keyword Unless  ${status}  Fail  Call not initiated successfully. Unable to locate End Call button on UI.
    ${status}  Wait For Exists  timeout=15000  &{RTT_CALL_OPTION}
    Run Keyword If  ${status}  Click  &{RTT_CALL_OPTION}
    BuiltIn.Sleep  5s
    Run Keyword and Ignore Error  Verify Particular Call State  mCallState=2   Connected/Active  ##11th Oct rain
    ${status}  Wait For Exists  timeout=3000  &{PHONE_END_CALL_ICON}
    Run Keyword Unless  ${status}  Fail  Call not initiated successfully. Unable to locate End Call button on UI.
    Set Serial  ${PARTNER_DEVICE}
    # Press Home
    Click  &{PHONE_NOTIFICATION_FLANGE_ANSWER}
    BuiltIn.Sleep  2
    Press Home
    Open Notification
    BuiltIn.Sleep  3s
    Click  &{PHONE_ONGOING_CALL}
    BuiltIn.Sleep  2
    Verify Particular Call State  mCallState=2  Connected/Active
    Set Serial  ${TEST_DEVICE}
    Verify RTT Call Is Placed In DUT  ${random_msg}
    End RTT Call In Test Device


Verify RTT Call Is Placed In DUT
    [Arguments]  ${random_msg}
    ${status}  Wait For Exists  timeout=15000  &{RTT_MIDDLE_BUTTON}
    Run Keyword If  ${status}  Click  &{RTT_MIDDLE_BUTTON}
    ${status}  Wait For Exists  timeout=5000  &{RTT_USE_BTN}
    Run Keyword If  ${status}  Click  &{RTT_USE_BTN}
    ...  ELSE  BuiltIn.Sleep  5s
    ${status}  Wait For Exists  timeout=5000  &{KEYBOARD_OPTION}
    Run Keyword If  ${status}  Click  &{KEYBOARD_OPTION}
    BuiltIn.Sleep  5
    # ${status}  Wait For Exists  timeout=5000  &{KEYBOARD_OPTION}   ### repeated this, since it is not able to click on Keyboard the first time
    # Run Keyword If  ${status}  Click  &{KEYBOARD_OPTION}
    # BuiltIn.Sleep  3
    Execute Adb Shell Command  am broadcast -a com.facebook.wearable.system.keyboard.REQUEST_INPUT -e android.intent.extra.TEXT ${random_msg}
    Log To Console  Verifying RTT call is placed

    Set Serial  ${PARTNER_DEVICE}
    Press Home
    Open Notification
    BuiltIn.Sleep  3s
    Click  &{PHONE_ONGOING_CALL}
    BuiltIn.Sleep  2
    ${status}  Wait For Exists  timeout=5000  text=${random_msg}
    Run Keyword If  ${status}  Log To Console  RTT Call successful
    ...  ELSE  FAIL  RTT Call not successful

Receive RTT Call On DUT
    [Arguments]  ${random_msg}
    Log To Console  Making RTT call from partner device
    Set Serial  ${PARTNER_DEVICE}
    Execute Adb Shell Command  am start com.google.android.dialer/com.google.android.dialer.extensions.GoogleDialtactsActivity
    ${status}  Wait For Exists  timeout=5000  description=key pad
    Run Keyword If  ${status}  Click  description=key pad
    BuiltIn.Sleep  5s
    Click  &{PHONE_ENTER_NUMBER_DIGIT_AREA_1}
    Set Text  ${TEST_DEVICE_PHONENUMBER}  &{PHONE_ENTER_NUMBER_DIGIT_AREA_1}
    BuiltIn.Sleep  2s
    ${status}  Wait For Exists  timeout=5000  text=Add wait
        Run Keyword If  ${status}  Press Back
    ${status}  Wait For Exists  timeout=5000  &{PARTNER_DEVICE_START_RTT_CALL_BTN}
    Run Keyword If  ${status}  Click  &{PARTNER_DEVICE_START_RTT_CALL_BTN}
    # ...  ELSE  FAIL  Call Not established
    ${status}  Wait For Exists  timeout=5000  &{PARTNER_DEVICE_NORMAL_AUDIO_CALL_BTN}
    Run Keyword If  ${status}  Click  &{PARTNER_DEVICE_NORMAL_AUDIO_CALL_BTN}
    Verify Particular Call State  mCallState=2  Connected/Active
    Log To Console  Receiving RTT Call on test device
    Set Serial  ${TEST_DEVICE}
    Run Keyword and Ignore Error  Verify Particular Call State  mCallState=1   Ringing
    ${status}  Wait For Exists  timeout=5000  &{CHATS_VOICE_CALL_ANSWER_BUTTON}
    Run Keyword If  ${status}  Click  &{CHATS_VOICE_CALL_ANSWER_BUTTON}
    Verify RTT Call Is Placed In DUT  ${random_msg}
    End RTT Call In Test Device

End RTT Call In Test Device
    Set Serial  ${TEST_DEVICE}
    Log To Console  Ending RTT call
    ${status}  Wait For Exists  timeout=5000  &{RTT_BACK_BTN}
    Run Keyword If  ${status}  Click  &{RTT_BACK_BTN}
    ${status}  Wait For Exists  timeout=5000  &{PHONE_END_CALL_ICON}
    Run Keyword If  ${status}  Click  &{PHONE_END_CALL_ICON}
    ...  ELSE  FAIL  Call not ended


Receive Voice Call And Upgrade To RTT
    [Arguments]  ${random_msg}
    Log To Console  Making voice call from partner device
    Set Serial  ${PARTNER_DEVICE}
    Execute Adb Shell Command  am start com.google.android.dialer/com.google.android.dialer.extensions.GoogleDialtactsActivity
    ${status}  Wait For Exists  timeout=5000  description=key pad
    Run Keyword If  ${status}  Click  description=key pad
    BuiltIn.Sleep  5s
    Click  &{PHONE_ENTER_NUMBER_DIGIT_AREA_1}
    Set Text  ${TEST_DEVICE_PHONENUMBER}  &{PHONE_ENTER_NUMBER_DIGIT_AREA_1}
    BuiltIn.Sleep  2s
    ${status}  Wait For Exists  timeout=5000  text=Add wait
    Run Keyword If  ${status}  Press Back
    ${status}  Wait For Exists  timeout=5000  &{PARTNER_DEVICE_NORMAL_AUDIO_CALL_BTN}
    Run Keyword If  ${status}  Click  &{PARTNER_DEVICE_NORMAL_AUDIO_CALL_BTN}
    # ...  ELSE  FAIL  Call Not established
    Verify Particular Call State  mCallState=2  Connected/Active
    Log To Console  Receiving Audio Call on test device
    # BuiltIn.Sleep  10                                              #Added by Aditya oct 28, sleep is needed since UI is not getting loaded
    Answering RTT Call in DUT                                      #Added by Aditya oct 28, sleep is needed since UI is not getting loaded
    Set Serial  ${PARTNER_DEVICE}
    # Press Home                                                                  ###### Added by Aditya 14 Oct##
    # Open Notification                                                           ##### Added by Aditya 14 Oct #####
    # ${status}  Wait For Exists  timeout=5000  &{PHONE_ONGOING_CALL}             ##### Added by Aditya 14 Oct #####
    # Run Keyword If  ${status}  Click  &{PHONE_ONGOING_CALL}                     ##### Added by Aditya 14 Oct #####

    ${status}  Wait For Exists  timeout=5000  &{RTT_OPTION_ON_PIXEL}
    Run Keyword If  ${status}  Click  &{RTT_OPTION_ON_PIXEL}
    Run Keyword Unless  ${status}  Run Keywords
    ...  Swipe by coordinates  1270  2242  105  2242  AND    ## To get RTT option while in call
    ...  Click  &{RTT_OPTION_ON_PIXEL}
    # ...  ELSE  FAIL  RTT Option not visible during call in partner device
    Wait For Exists  timeout=5000  &{PARTNER_DEVICE_RTT_INPUT_TEXT}
    Set Text  ${random_msg}  &{PARTNER_DEVICE_RTT_INPUT_TEXT}
    Log To Console  Sending RTT to DUT
    Click  &{PARTNER_DEVICE_RTT_TEXT_SUBMIT}

    Set Serial  ${TEST_DEVICE}
    Click  &{RTT_MIDDLE_BUTTON}
    ${status}  Wait For Exists  timeout=5000  &{RTT_USE_BTN}
    Run Keyword If  ${status}  Click  &{RTT_USE_BTN}
    ...  ELSE  BuiltIn.Sleep  5s
    Log To Console  Verifying whether RTT Is Received in DUT
    ${status}  Wait For Exists  timeout=5000  text=${random_msg}
    Run Keyword If  ${status}  Log To Console  RTT Call successful
    ...  ELSE  FAIL  RTT Call not successful

    Log To Console  Ending RTT call
    ${status}  Wait For Exists  timeout=5000  &{RTT_BACK_BTN}
    Run Keyword If  ${status}  Click  &{RTT_BACK_BTN}
    ${status}  Wait For Exists  timeout=5000  &{PHONE_END_CALL_ICON}
    Run Keyword If  ${status}  Click  &{PHONE_END_CALL_ICON}
    ...  ELSE  FAIL  Call not ended


Answering RTT Call in DUT
    Set Serial  ${TEST_DEVICE}
    ${status}  Wait For Exists  timeout=5000  &{CHATS_VOICE_CALL_ANSWER_BUTTON}
    Run Keyword If  ${status}  Click  &{CHATS_VOICE_CALL_ANSWER_BUTTON}
    ...  ELSE  FAIL  Answer button not visible
    Log To Console  Upgrading to RTT


Enable Send Immediately Feature In RTT
    Set Serial  ${TEST_DEVICE}
    Log To Console  Enabling Send immediately feature for RTT in MOS Device

    Open MOS Settings
    scroll_vertically_to_object  &{SETTINGS_ACCESSIBILITY}
    Click  &{SETTINGS_ACCESSIBILITY}
    scroll_vertically_to_object  &{RTT_OPTION}
    Click  &{RTT_OPTION}
    scroll_vertically_to_object  &{SEND_IMMEDIATELY_SWITCH}
    Wait For Exists  timeout=5000  &{SEND_IMMEDIATELY_SWITCH}
    ${switch_obj}  Get Object  &{SEND_IMMEDIATELY_SWITCH}
    ${switch_info}  Get Info Of Object  ${switch_obj}
    # Log  ${switch_info}
    # Log to console  ${switch_info}[enabled]
    Run Keyword If  '${switch_info}[checked]'== 'True'  Run Keywords
    ...  Log To Console  Send immediately is enabled  AND
    ...  Return From Keyword
    Run Keyword If  '${switch_info}[checked]'== 'False'   Run keywords
    ...  Log To Console  Clicking on switch to enable Send immediately feature  AND
    ...  Click  &{SEND_IMMEDIATELY_SWITCH}

Disable Send Immediately Feature In RTT
    Set Serial  ${TEST_DEVICE}
    Log To Console  Disabling  Send immediately feature in MOS Device
    Open MOS Settings
    scroll_vertically_to_object  &{SETTINGS_ACCESSIBILITY}
    Click  &{SETTINGS_ACCESSIBILITY}
    scroll_vertically_to_object  &{RTT_OPTION}
    Click  &{RTT_OPTION}
    Wait For Exists  &{SEND_IMMEDIATELY_SWITCH}
    ${switch_obj}  Get Object  &{SEND_IMMEDIATELY_SWITCH}
    ${switch_info}  Get Info Of Object  ${switch_obj}
    Run Keyword If  '${switch_info}[checked]'== 'False'  Log To Console  Send immediately feature is disabled
    Run Keyword If  '${switch_info}[checked]'== 'True'   Run keywords
    ...  Log To Console  Clicking on switch to disable Send immediately feature  AND
    ...  Click  &{SEND_IMMEDIATELY_SWITCH}