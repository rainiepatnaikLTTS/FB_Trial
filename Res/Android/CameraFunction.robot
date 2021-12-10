*** Settings ***

Library             cogmationlibrary
Resource            ${EXECDIR}/Res/Android/GenericFunction.robot
Variables           ${EXECDIR}/VariableFiles/Android/Config.py


*** Keywords ***

Capture Image
    Launch Camera App
    # Repeat Keyword  3  Swipe Right   ### To set default mode as image capture
    # BuiltIn.Sleep  3s
    # Repeat Keyword  3  swipe_by_coordinates  30  300  435  300   ## added since swipe left cicks on capture button
    # swipe_by_coordinates  435  300  30  300
    Log To Console  Clicking on capture button
    # BuiltIn.Sleep  5s
    ${status}  Wait for exists  timeout=20000  &{CAMERA_CAPTURE_BUTTON}
    Run keyword if  ${status}  Click  &{CAMERA_CAPTURE_BUTTON}
    ...  ELSE  FAIL  Capture button not visible
    # click at coordinates  435  235  ## In new build, it doesn't click on shutter button
    # BuiltIn.Sleep  15
    Wait Until Gone  textContains=Hold
    # Log To Console  Image Is Captured
    # BuiltIn.Sleep  5
    # Press Home
    # Verify Image Is Captured   ### Commented by Suraj, picture validation part was failing

Sample Test Capture Image
    Launch Camera App
    # Repeat Keyword  3  Swipe Right   ### To set default mode as image capture
    # BuiltIn.Sleep  3s
    # Repeat Keyword  3  swipe_by_coordinates  30  300  435  300   ## added since swipe left cicks on capture button
    # swipe_by_coordinates  435  300  30  300
    Log To Console  Clicking on capture button
    # BuiltIn.Sleep  5s
    ${status}  Wait for exists  timeout=20000  &{CAMERA_CAPTURE_BUTTON}
    Run keyword if  ${status}  Click  &{CAMERA_CAPTURE_BUTTON}
    ...  ELSE  FAIL  Capture button not visible
    # click at coordinates  435  235  ## In new build, it doesn't click on shutter button
    # BuiltIn.Sleep  15
    Wait Until Gone  textContains=Hold
    Log To Console  Image Is Captured
    # BuiltIn.Sleep  5
    Press Home

Verify Image Is Captured
    Log To Console  Opening Captured Image
    Open Gallery From Camera
    Click At Coordinates  100  125
    ${options_btn}  Wait For Exists  5000  &{CAMERA_CAPTURED_FILE_OPTIONS_BTN}
    Run Keyword Unless  ${options_btn}  FAIL  Image is not Captured
    Run Keyword If  ${options_btn}  Log to console  Image is Captured


Capture Video Of Particular Length
    [Arguments]  ${seconds}
    Launch Camera App
    # BuiltIn.Sleep  3s
    # Repeat Keyword  3  Swipe Right   #To set default mode as image capture
    # Repeat Keyword  3  swipe_by_coordinates  30  300  435  300   ## added since swipe left cicks on capture button
    Log To Console  Switching to Video mode
    # Swipe Left
    # swipe_by_coordinates  435  300  30  300   ## added since swipe left cicks on capture button
    ${status}  Wait for exists  timeout=20000  &{CAMERA_VIDEO_SWITCH_MODE}
    Run keyword if  ${status}  Click  &{CAMERA_VIDEO_SWITCH_MODE}
    ...  ELSE  FAIL  Not switched to Video mode

    ${capture_btn}  Wait For Exists  10  &{CAMERA_SHUTTER_BTN}
    Run Keyword If  ${capture_btn}  Click  &{CAMERA_SHUTTER_BTN}
    Run Keyword Unless  ${capture_btn}  FAIL  Unable to capture video
    # click at coordinates  437  235  ## In new build, it doesn't click on shutter button
    ${status}  Wait For exists  5000  &{VIDEO_RECORDING_START_INDICATOR}
    Run Keyword If  ${status}  Log To Console  Video recording started successfully
    ...  ELSE  FAIL  Video recording did not start
    BuiltIn.Sleep  ${seconds}
    Click  &{CAMERA_SHUTTER_BTN}   ### commenting since DUT stops recording automatically after 30 seconds
    # click at coordinates  435  235   ### commenting since DUT stops recording automatically after 30 seconds  added by Aditya
    Log To Console  Video Is Captured
    # BuiltIn.Sleep  10s

Sample Test Capture Video Of Particular Length
    [Arguments]  ${seconds}
    Launch Camera App
    # BuiltIn.Sleep  3s
    # Repeat Keyword  3  Swipe Right   #To set default mode as image capture
    # Repeat Keyword  3  swipe_by_coordinates  30  300  435  300   ## added since swipe left cicks on capture button
    Log To Console  Switching to Video mode
    # Swipe Left
    # swipe_by_coordinates  435  300  30  300   ## added since swipe left cicks on capture button
    ${status}  Wait for exists  timeout=20000  &{CAMERA_VIDEO_SWITCH_MODE}
    Run keyword if  ${status}  Click  &{CAMERA_VIDEO_SWITCH_MODE}
    ...  ELSE  FAIL  Not switched to Video mode
    ${capture_btn}  Wait For Exists  5  &{CAMERA_SHUTTER_BTN}
    Run Keyword If  ${capture_btn}  Click  &{CAMERA_SHUTTER_BTN}
    Run Keyword Unless  ${capture_btn}  FAIL  Unable to capture video
    # click at coordinates  437  235  ## In new build, it doesn't click on shutter button
    ${status}  Wait For exists  5000  &{VIDEO_RECORDING_START_INDICATOR}
    Run Keyword If  ${status}  Log To Console  Video recording started successfully
    ...  ELSE  FAIL  Video recording did not start
    BuiltIn.Sleep  ${seconds}
    Click  &{CAMERA_SHUTTER_BTN}   ### commenting since DUT stops recording automatically after 30 seconds
    # click at coordinates  435  235   ### commenting since DUT stops recording automatically after 30 seconds  added by Adityas
    Log To Console  Video Is Captured
    # BuiltIn.Sleep  10s

Open Captured Image And Verify
    Sample Test Capture Image
    Press Home
    Launch Camera App
    # BuiltIn.sleep  3
    Log To Console  Opening Captured Image
    # Swipe By Coordinates  165  470  165  210
    Open Gallery From Camera
    Click At Coordinates  100  125
    ${options_btn}  Wait For Exists  5000  &{CAMERA_CAPTURED_FILE_OPTIONS_BTN}
    Run Keyword Unless  ${options_btn}  FAIL  Image is not Open
    Run keyword If  ${options_btn}  Log To Console  Image is open

Sample Test Open Captured Image
    Sample Test Capture Image
    Press Home
    Launch Camera App
    # BuiltIn.sleep  3
    Log To Console  Opening Captured Image
    # Swipe By Coordinates  165  470  165  210
    Open Gallery From Camera
    Click At Coordinates  100  125
    ${options_btn}  Wait For Exists  5000  &{CAMERA_CAPTURED_FILE_OPTIONS_BTN}
    Run Keyword Unless  ${options_btn}  FAIL  Image is not Open
    Run keyword If  ${options_btn}  Log To Console  Image is open

Play Captured Video And Verify
    [Arguments]  ${seconds}
    Sample Test Capture Video Of Particular Length  ${seconds}
    Press Home
    # BuiltIn.Sleep  3s
    Launch Camera App
    Log To Console  Opening Captured Video
    # Swipe By Coordinates  165  470  165  165
    # Scroll To Beginning Vertically
    Open Gallery From Camera
    Click at coordinates  100  125
    Log To console  Playing Video
    ${video_layout}  Wait For Exists  35  resourceId=com.facebook.wearable.apps.camera:id/video_playback_layout
    Run keyword If  ${video_layout}  Run Keywords
    ...  Log To Console  Video got played successfully  AND
    ...  BuiltIn.Sleep  ${seconds}  AND
    ...  Return From Keyword
    Run Keyword Unless  ${video_layout}  Run Keywords
    ...  Click At Coordinates  100  125  AND
    ...  BuiltIn.Sleep  ${seconds}
    # ${status}  Wait For Exists  5  resourceId=com.facebook.wearable.apps.camera:id/video_playback_layout
    # Run Keyword Unless  ${status}  FAIL  Video didn't get played
    # BuiltIn.Sleep  5s

Sample Test Play Captured Video
    [Arguments]  ${seconds}
    Sample Test Capture Video Of Particular Length  ${seconds}
    Press Home
    # BuiltIn.Sleep  3s
    Launch Camera App
    Log To Console  Opening Captured Video
    # Swipe By Coordinates  165  470  165  165
    # Scroll To Beginning Vertically
    Open Gallery From Camera
    Click at coordinates  100  125
    Log To console  Playing Video
    ${video_layout}  Wait For Exists  35  resourceId=com.facebook.wearable.apps.camera:id/video_playback_layout
    Run keyword If  ${video_layout}  Run Keywords
    ...  Log To Console  Video got played successfully  AND
    ...  BuiltIn.Sleep  ${seconds}  AND
    ...  Return From Keyword
    Run Keyword Unless  ${video_layout}  Run Keywords
    ...  Click At Coordinates  100  125  AND
    ...  BuiltIn.Sleep  ${seconds}

Delete Captured Video
    [Arguments]  ${seconds}
    Sample Test Play Captured Video  ${seconds}   ## has keyword to capture video inside
    # BuiltIn.sleep  2  ##
    ${options_btn}  Wait For exists  50000  &{CAMERA_CAPTURED_FILE_OPTIONS_BTN}
    run keyword unless  ${options_btn}  FAIL  Options button not found
    Builtin.sleep  5
    Log To Console  Starting the process to delete a captured video
    Click  &{CAMERA_CAPTURED_FILE_OPTIONS_BTN}
    # Log To Console  Scrolling the Edit Menu For Delete Option
    # Scroll To End Vertically
    ${status}  Wait For Exists  &{GALLERY_DELETE_BTN}
    Run Keyword If  ${status}  Click  &{GALLERY_DELETE_BTN}
    ...  ELSE  Click at coordinates  382  147   ## Delete is not getting detected
    # ...  ELSE  FAIL  Delete option not visible
    # Click  ${GALLERY_DELETE_BTN}
    BuiltIn.Sleep  2
    ${confirm_opn}  Wait For Exists  5  &{GALLERY_COMFIRM_DELETE}
    # Run Keyword Unless  ${confirm_opn}  FAIL  Delete Option was not clicked
    Run Keyword If  ${confirm_opn}  Click  &{GALLERY_COMFIRM_DELETE}
    # Run Keyword If  ${confirm_opn}  Click at coordinates    245  192
    Log To Console  Video is deleted

Delete Captured Image
    Sample Test Open Captured Image
    ${options_btn}  Wait For exists  5  &{CAMERA_CAPTURED_FILE_OPTIONS_BTN}
    # run keyword if  ${options_btn}  Click at coordinates  95  377
    run keyword unless  ${options_btn}  FAIL  Options button not found
    builtin.sleep  5
    Log To Console  Starting the process to delete a captured image
    run keyword if  ${options_btn}  Click  &{CAMERA_CAPTURED_FILE_OPTIONS_BTN}  # at coordinates  95  377
    ${edit_menu}  Wait For exists  5  text=Filters
    run keyword unless  ${edit_menu}  FAIL  Edit menu is not open
    Run keyword If  ${edit_menu}  Log To Console  Edit Menu is open
    Scroll Vertically To Object  ${GALLERY_DELETE_BTN}
    Log To Console  Scrolling the Edit Menu For Delete Option

    ${status}  Wait For Exists  &{GALLERY_DELETE_BTN}
    Run Keyword If  ${status}  Click  &{GALLERY_DELETE_BTN}
    ...  ELSE  Click at coordinates  307  293

    Log To Console  Image is deleted

Turn on Capture Button for Camera
    Launch Camera App
    BuiltIn.Sleep  3s
    Click  &{CAMERA_SETTINGS_MENU}
    BuiltIn.Sleep  2s
    Repeat Keyword  3  Swipe By Coordinates  420  286  51  286
    ${status}  Wait for exists  5  &{CAMERA_SETTINGS_MORE_OPTION}
    Run Keyword If  ${status}  Click  &{CAMERA_SETTINGS_MORE_OPTION}

    ${status}  Wait for exists  5  &{CAMERA_SETTINGS_GENERAL}
    Run Keyword If  ${status}  Click  &{CAMERA_SETTINGS_GENERAL}

    # ${status}  Wait for exists  5  &{CAMERA_SETTINGS_CAPTURE_BUTTON}
    # Run Keyword If  ${status}  Click  &{CAMERA_SETTINGS_CAPTURE_BUTTON}

    Wait For Exists  &{CAMERA_SETTINGS_CAPTURE_BUTTON}
    ${switch_obj}  Get Object  &{CAMERA_SETTINGS_CAPTURE_BUTTON}
    ${switch_info}  Get Info Of Object  ${switch_obj}
    # Log  ${switch_info}
    # Log to console  ${switch_info}[enabled]
    Run Keyword If  '${switch_info}[checked]'== 'True'  Run Keywords
    ...  Log To Console  Switch Is On  AND
    ...  Return From Keyword
    Run Keyword If  '${switch_info}[checked]'== 'False'   Run keywords
    ...  Log To Console  Switch Is Off, Switching It ON  AND
    ...  Click  &{CAMERA_SETTINGS_CAPTURE_BUTTON}

Check for Capture Button on Camera Screen
    Launch Camera App
    ${status}  Wait for exists  15  &{CAMERA_SHUTTER_BTN}
    Run Keyword If  ${status}  Log To Console  Capture Button Present
    ...  ELSE  Turn on Capture Button for Camera

Open Gallery From Camera
    ${gallery}  Wait For Exists  5000  &{CAMERA_GALLERY}
    Run Keyword If  ${gallery}  Click  &{CAMERA_GALLERY}
    ${close_btn}  Wait For Exists  5000  resourceId=com.facebook.wearable.apps.gallery:id/closeButton
    Run Keyword If  ${close_btn}  Log to console  Gallery is open
    ...  ELSE  FAIL  Gallery is not open
    BuiltIn.Sleep  3  ## Added to wait for captured media to load since unique node details not present