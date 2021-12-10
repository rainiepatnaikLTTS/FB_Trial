*** Settings ***

Library             cogmationlibrary
Resource            ${EXECDIR}/Res/Android/GenericFunction.robot
Resource            ${EXECDIR}/Res/Android/MessagingFunction.robot
Variables           ${EXECDIR}/VariableFiles/Android/Config.py

*** Keywords ***
Launch Chat App
    Log To Console  Launching Chats
    Repeat Keyword  6  Press Back
    Swipe Left

Create New SMS In Chat App
    Set Serial  ${TEST_DEVICE}
    Launch Chat App
    Click  &{CHATS_NEW_CONV}
    BuiltIn.Sleep  3
    Execute Adb Shell Command  am broadcast -a com.facebook.wearable.system.keyboard.REQUEST_INPUT -e android.intent.extra.TEXT ${PARTNER_DEVICE_PHONENUMBER}
    BuiltIn.Sleep  2s
    Click  &{CHATS_DIALPAD_BUTTON}
    BuiltIn.Sleep  2s
    Set Text  ${PARTNER_DEVICE_PHONENUMBER}  resourceId=com.facebook.wearable.system.launcher:id/digits
    Click  &{CHATS_SELECT_CONTACT_BUTTON}
    Log To Console  Contact selected for sending message
    BuiltIn.Sleep  3

Open Chat And Check Msg Received
    [Arguments]  ${msg_content}
    Launch Chat App
    ${status}  Wait For Exists  timeout=5000  text=${msg_content}
    Run Keyword If  ${status}  Log To Console  Msg is Received
    ...  ELSE  FAIL  Message not received



Send SMS From FB Device
    [Arguments]  ${msg_content}
    Create New SMS In Chat App
    BuiltIn.Sleep  3s
    ${status}  Wait For Exists  timeout=5000  &{CHATS_KEYBOARD}
    Run Keyword If  ${status}  Click  &{CHATS_KEYBOARD}
    BuiltIn.Sleep  5s
    # Click  &{CHATS_KEYBOARD}
    # Click At Coordinates  389  398
    # Click At Coordinates  389  398
    # BuiltIn.sleep  5s
    # Send HELLO Text message
    Execute Adb Shell Command  am broadcast -a com.facebook.wearable.system.keyboard.REQUEST_INPUT -e android.intent.extra.TEXT ${msg_content}
    BuiltIn.Sleep  5s

Send MMS With Picture Attachment And Verify Msg Sent
    [Arguments]  ${text_id_receiver}  ${msg_content}
    Repeat Keyword  5  Press Back
    Create New SMS In Chat App
    Click  &{CHATS_CAMERA_ATTACHMENT}
    BuiltIn.Sleep  2s
    Log To console  Opening Gallery
    ${gallery}  Wait For Exists  5  &{CAMERA_GALLERY}
    Run Keyword If  ${gallery}  Click  &{CAMERA_GALLERY}
    ...  ELSE  FAIL  Gallery not visible
    # ${captured_img}  Wait For Exists  5  &{CAMERA_IMAGE_CAPTURED_THUMBNAIL}
    # Run Keyword Unless  ${captured_img}  FAIL  Image is not captured
    #  Run Keyword If  ${captured_img}  Click At Coordinates  100  125
    BuiltIn.sleep  3
    Click At Coordinates  100  125
    BuiltIn.Sleep  2s
    # Click At Coordinates  375  387
    Click  &{CHATS_CONFIRMATION_BUTTON}
    Log to console  Image attached and sent

Receive MMS With Picture Attachment And Verify Msg Sent
    [Arguments]  ${text_id_receiver}  ${msg_content}
    Set Serial  ${PARTNER_DEVICE}
    Repeat Keyword  5  Press Back
    # Create New SMS In Chat App
    Send MMS  ${PARTNER_DEVICE}  ${TEST_DEVICE_PHONENUMBER}  ${MESSAGE_IMAGE_TYPE_MMS}  ${random_msg}
    Click  &{CHATS_CAMERA_ATTACHMENT}
    BuiltIn.Sleep  2s
    Log To console  Opening Gallery
    ${gallery}  Wait For Exists  5  &{CAMERA_GALLERY}
    Run Keyword If  ${gallery}  Click  &{CAMERA_GALLERY}
    ...  ELSE  FAIL  Gallery not visible
    # ${captured_img}  Wait For Exists  5  &{CAMERA_IMAGE_CAPTURED_THUMBNAIL}
    # Run Keyword Unless  ${captured_img}  FAIL  Image is not captured
    #  Run Keyword If  ${captured_img}  Click At Coordinates  100  125
    BuiltIn.sleep  3
    Click At Coordinates  100  125
    BuiltIn.Sleep  2s
    # Click At Coordinates  375  387
    Click  &{CHATS_CONFIRMATION_BUTTON}
    Log to console  Image attached and sent


Verify MT SMS on Partner Device
    [Arguments]  ${msg_content}
    Set Serial  ${PARTNER_DEVICE}
    Press Home
    Launch Messaging App
    BuiltIn.Sleep  5s
    ${status}  Wait For Exists  timeout=5000  text=${msg_content}
    Run Keyword If  ${status}  Log to console  Message Reeived
    ...  ELSE  Fail  Log to console  Message not received


Send HELLO Text message
    Click At Coordinates  240  247
    BuiltIn.Sleep  2s
    Click At Coordinates  240  180
    BuiltIn.Sleep  2s
    Click At Coordinates  146  175
    BuiltIn.Sleep  2s
    Click At Coordinates  50  105
    BuiltIn.Sleep  2s
    Click At Coordinates  330  250
    BuiltIn.Sleep  2s
    Click At Coordinates  333  180
    BuiltIn.Sleep  2s
    Click At Coordinates  330  250
    BuiltIn.Sleep  2s
    Click At Coordinates  333  180
    BuiltIn.Sleep  2s
    Click At Coordinates  430  175
    BuiltIn.Sleep  2s
    Click At Coordinates  330  105
    BuiltIn.Sleep  2s
    Click At Coordinates  402  403
    BuiltIn.Sleep  5s


Send MO SMS from FB Device and Verify
    [Arguments]  ${msg_content}
    Send SMS From FB Device  ${msg_content}
    BuiltIn.Sleep  5s
    Verify MT SMS on Partner Device  ${msg_content}










