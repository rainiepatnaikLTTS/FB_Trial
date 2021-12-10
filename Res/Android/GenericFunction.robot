*** Settings ***

Library             cogmationlibrary
Library             OperatingSystem
Library             DateTime
Library             String
Variables           ${EXECDIR}/VariableFiles/Android/Config.py

*** Keywords ***
Suite Setup Keyword
    Set Serial  ${TEST_DEVICE}
    install  ${TEST_DEVICE}
    install  ${PARTNER_DEVICE}
    ${BUILD_NUMBER}  adb_get_build_number
    Set Suite Variable  ${BUILD_NUMBER}
    Execute Adb Command  -s ${TEST_DEVICE} shell rm -rf /storage/emulated/0/DCIM
    Execute Adb Command  -s ${TEST_DEVICE} shell rm -rf /sdcard/DCIM
    ${date} =  Get Current Date
    Set Suite Variable  ${date}
    Log To Console  Suite Setup Current Date : ${date}
    Set Global Variable  ${CRASH_COUNT}       0
    Set Global Variable  ${Suite_Total_Iteration_Count}       0
    Set Global Variable  ${Suite_Total_Pass_Count}       0
    Set Global Variable  ${Suite_CRASH_COUNT}      0

    # Enable Location services In Camera
    # Check for Capture Button on Camera Screen

Suite Teardown Keyword
    Set Serial  ${TEST_DEVICE}
    ${date2} =  Get Current Date
    Log To Console  Suite Teardown  Date : ${date2}
    ${STORAGE_CONSUMED}  adb_get_storage_consumed
    Set Global Variable  ${STORAGE_CONSUMED}
    ${BATTERY_PERCENTAGE}  adb_get_battery_percent
    Set Global Variable  ${BATTERY_PERCENTAGE}

Test Setup Keyword
    Set Serial  ${TEST_DEVICE}
    Execute Adb Command  -s ${TEST_DEVICE} logcat -c
    # ${charging_icon}  Wait For Exists  5  &{CHARGING_ICON}
    # Run Keyword If  ${charging_icon}  Swipe Right
    ${anr_dialog}  Wait For Exists  5  textContains=responding
    Run Keyword If  ${anr_dialog}  Click  textContains=Close
    # Repeat Keyword  4  Press Back
    ${date} =  Get Current Date
    Set Test Variable  ${date}
    Log To Console  Test Setup Current Date : ${date}

    ### ----------added for getting unique text files for RCA ---------###
    # ${converted_date}  Get Current Date  exclude_millis=True
    # ${converted_date}  Replace String  ${converted_date}  :  _
    # Set Test Variable  ${converted_date}
    ###----------------------------------------------------------------###

    Set Global Variable  ${Total_Iteration_Count}  0
    Set Global Variable  ${Total_Pass_Count}  0
    Set Global Variable  ${Feature Status}  'Pass'
    ${STORAGE_CONSUMED}  adb_get_storage_consumed
    Set Global Variable  ${STORAGE_CONSUMED}
    ${BATTERY_PERCENTAGE}  adb_get_battery_percent
    Set Global Variable  ${BATTERY_PERCENTAGE}
    Execute Adb Command  -s ${TEST_DEVICE} shell rm -rf /storage/emulated/0/DCIM
    Execute Adb Command  -s ${TEST_DEVICE} shell rm -rf /sdcard/DCIM
    Repeat Keyword  4  Press Back


Test Setup Partner Device
    set serial  ${PARTNER_DEVICE}
    Turn On Screen
    swipe by coordinates  500  1900  500  400
    Repeat keyword  2  Press Back
    set serial  ${TEST_DEVICE}

Test Pass Teardown
    ###  added on 23rd sept  ###
    Set Serial  ${TEST_DEVICE}
    ${logcat_path}  ${radio_logs_path}  Capture Device Logs  ${TEST_DEVICE}
    ${LOGCAT}  ${RADIOLOGS}=  Set Variable  ${logcat_path}  ${radio_logs_path}
    Set Test Variable  \${LOGCAT}
    Set Test Variable  \${RADIOLOGS}
    Log  ${logcat_path}
    ${fatal_exception}  ${fatal_signal}  ${anr}  Get Count From Logcat  ${LOG_FLAG}  ${logcat_path}
    ${CRASH_COUNT}  Evaluate  ${CRASH_COUNT}+${fatal_exception}+${fatal_signal}+${anr}
    Log  Crash=${fatal_exception}+${fatal_signal}
    Log  ANR=${anr}
    Set Test Variable  \${CRASH_COUNT}

Test Fail Teardown
    Set Serial  ${TEST_DEVICE}
    ${logcat_path}  ${radio_logs_path}  Capture Device Logs  ${TEST_DEVICE}
    ${LOGCAT}  ${RADIOLOGS}=  Set Variable  ${logcat_path}  ${radio_logs_path}
    Set Test Variable  \${LOGCAT}
    Set Test Variable  \${RADIOLOGS}
    Log  ${logcat_path}
    ${fatal_exception}  ${fatal_signal}  ${anr}  Get Count From Logcat  ${LOG_FLAG}  ${logcat_path}  ### changes made for testing crash due to fatal signal
    ${CRASH_COUNT}  Evaluate  ${CRASH_COUNT}+${fatal_exception}+${fatal_signal}+${anr}
    Log  Crash=${fatal_exception}+${fatal_signal}
    Log  ANR=${anr}
    Set Test Variable  \${CRASH_COUNT}

    ${FAIL_SCREENSHOT}  Screenshot Path  Fail_${TEST_DEVICE}
    Set Test Variable  \${FAIL_SCREENSHOT}

Test Fail Teardown Telephony
    Test Fail Teardown
    ###--------------------Added to get screenshots for test & partner device on fail scenarios------------------####
    Set Serial  ${PARTNER_DEVICE}
    ${FAIL_SCREENSHOT}  Screenshot Path  Fail_${PARTNER_DEVICE}

    Set Serial  ${TEST_DEVICE}
    ####--------------------------------------------------------------------------------------------------------####

Iteration Setup
    Turn On Screen
    # ${charging_icon}  Wait For Exists  5  &{CHARGING_ICON}
    # Run Keyword If  ${charging_icon}  Swipe Right
    ${anr_dialog}  Wait For Exists  5  textContains=responding
    Run Keyword If  ${anr_dialog}  Click  textContains=Close
    ${anr_dialog}  Wait For Exists  5  textContains=stopping
    Run Keyword If  ${anr_dialog}  Click  textContains=Close
    Execute Adb Command  -s ${TEST_DEVICE} root
    Execute Adb Command  -s ${TEST_DEVICE} remount
    Execute Adb Command  -s ${TEST_DEVICE} shell cmd thermalservice override-status 0
    Execute Adb Command  -s ${TEST_DEVICE} shell settings put global charging_aod_overlay_disabled 1
    Execute Adb Command  -s ${TEST_DEVICE} shell dumpsys battery set ac 0
    Execute Adb Command  -s ${TEST_DEVICE} shell dumpsys battery set usb 0
    Execute Adb Command  -s ${TEST_DEVICE} shell dumpsys battery set status 4
    Repeat Keyword  4  Press Back

Iteration Sucessfull Keyword
    [Arguments]  ${D1}  ${ITERATION_COUNTER}
    # Append To File  ${log_file_path}  \nPASS
    ${LOGCAT1}  set_to_dictionary  ${D1}  Iteration No:${ITERATION_COUNTER}  PASS
    Log To Console  Iteration Completed Successfuly
    ###  added on 23rd sept  ###
    Set Serial  ${TEST_DEVICE}
    ${logcat_path}  ${radio_logs_path}  Capture Device Logs  ${TEST_DEVICE}
    ${LOGCAT}  ${RADIOLOGS}=  Set Variable  ${logcat_path}  ${radio_logs_path}
    Set Test Variable  \${LOGCAT}
    Set Test Variable  \${RADIOLOGS}
    Log  ${logcat_path}
    ${fatal_exception}  ${fatal_signal}  ${anr}  Get Count From Logcat  ${LOG_FLAG}  ${logcat_path}  ### changes made for testing crash due to fatal signal
    ${CRASH_COUNT}  Evaluate  ${CRASH_COUNT}+${fatal_exception}+${fatal_signal}+${anr}
    Log  Crash=${fatal_exception}+${fatal_signal}
    Log  ANR=${anr}
    Set Test Variable  \${CRASH_COUNT}

Iteration Unsucessfull Keyword
    [Arguments]  ${D1}  ${ITERATION_COUNTER}
    # Append To File  ${log_file_path}  \nFAIL
    ${LOGCAT1}  set_to_dictionary  ${D1}  Iteration No:${ITERATION_COUNTER}  FAIL
    Set Global Variable  ${Feature Status}  'Fail'
    Set Serial  ${TEST_DEVICE}
    ${logcat_path}  ${radio_logs_path}  Capture Device Logs  ${TEST_DEVICE}
    ${LOGCAT}  ${RADIOLOGS}=  Set Variable  ${logcat_path}  ${radio_logs_path}
    Set Test Variable  \${LOGCAT}
    Set Test Variable  \${RADIOLOGS}
    # ${FAIL_SCREENSHOT}  Screenshot Path  Fail
    # Set Test Variable  \${FAIL_SCREENSHOT}
    Log  ${logcat_path}
    ${fatal_exception}  ${fatal_signal}  ${anr}  Get Count From Logcat  ${LOG_FLAG}  ${logcat_path}  ### changes made for testing crash due to fatal signal
    ${CRASH_COUNT}  Evaluate  ${CRASH_COUNT}+${fatal_exception}+${fatal_signal}+${anr}
    Log  Crash=${fatal_exception}+${fatal_signal}
    Log  ANR=${anr}
    Set Test Variable  \${CRASH_COUNT}
    Log To Console  Iteration Terminated Unsuccessfully

    ${FAIL_SCREENSHOT}  Screenshot Path  Fail_${TEST_DEVICE}
    Set Test Variable  \${FAIL_SCREENSHOT}

Iteration Unsucessfull Keyword Telephony
    [Arguments]  ${D1}  ${ITERATION_COUNTER}
    Iteration Unsucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
    ###--------------------Added to get screenshots for test & partner device on fail scenarios------------------####

    Set Serial  ${PARTNER_DEVICE}
    ${FAIL_SCREENSHOT}  Screenshot Path  Fail_${PARTNER_DEVICE}
    Set Serial  ${TEST_DEVICE}
    ####--------------------------------------------------------------------------------------------------------####

Stability Test Status
    # Stability Test Status
    [Arguments]  ${D1}
    #${file_content_string}  Get File  ${iteration_file}
    #@{match_list}  Get Regexp Matches  ${file_content_string}  PASS
    #${pass_count}  Get Length  ${match_list}
    #Append To File  ${iteration_file}  \nPass_Count::${pass_count}
    ${Keys}  get_dictionary_keys  ${D1}
    Log To Console  ${Keys}
    ${Total_Iteration_Count}  get_length  ${Keys}
    ${Values}  get_dictionary_values  ${D1}
    Log To Console  ${Values}
    ${Total_Pass_Count}  Count Values In List  ${Values}  PASS
    #${Total_Iteration_Count}  Evaluate  ${total_iter}+${Total_Iteration_Count}
    Set Global Variable  ${Total_Iteration_Count}  ${Total_Iteration_Count}
    Log To Console  Total Iteration Count:${Total_Iteration_Count}
    Log  Total Iteration Count:${Total_Iteration_Count}
    #${Total_Pass_Count}  Evaluate  ${pass_count}+${Total_Pass_Count}
    Set Global Variable  ${Total_Pass_Count}  ${Total_Pass_Count}
    Log To Console  Total Pass Count:${Total_Pass_Count}
    Log  Total Pass Count:${Total_Pass_Count}
    Log  ${D1}

Feature Stability Test Status
    [Arguments]  ${total_iters}  ${passiterations}  ${expected_percent}
    Log  ${total_iters} ${Total_Pass_Count} ${expected_percent}
    Log to console  ${total_iters} ${Total_Pass_Count} ${expected_percent}
    ${current_status}  Evaluate  ${Total_Pass_Count}/${total_iters}*100
    ${expected_percent}  Convert To Integer  ${expected_percent}
    ${current_status}  Convert To Integer  ${current_status}
    Run Keyword If  ${current_status} < ${expected_percent}  FAIL  ${Total_Pass_Count} iterations out of ${total_iters} iterations are PASS. Expected ${expected_percent}% of iterations to be successful but only ${current_status}% of iterations are successfull
    ...  ELSE  Log  ${current_status}% of iterations are successfull which is more than expected percent i.e. ${expected_percent}%

Launch Playstore App
    Execute Adb Shell Command  am start -n ${PLAYSTORE_APP_PACKAGE}
    BuiltIn.Sleep  3s  For Page to load successfully
    ${status}  Wait For Exists  timeout=3000  &{PLAYSTORE_APP_PAGE_DICT}
    Run Keyword Unless  ${status}  Fail  Unable to launch Settings App

Launch Camera App
    Execute Adb Shell Command  am start -n ${CAMERA_APP_PACKAGE}
    # BuiltIn.Sleep  10s  For Page to load successfully
    # ${status1}  Wait For exists  timeout=20  &{CAMERA_SETTINGS_MENU}
    ${status}  Wait For exists  timeout=20000  text=Photo
    Run Keyword If  ${status}  Log to console  Camera launched successfully
        ...  ELSE  FAIL  Camera not launched

Enable Location services In Camera
    # Scroll To Beginning Vertically
    Launch Camera App
    ${status1}  Wait For exists  textContains=Enable Location
    ${status2}  Wait For exists  textContains=location
    Run Keyword If  ${status1} or ${status2}  Run Keywords
    ...  Log To console  Enabling Location Services  AND
    ...  Scroll To End Vertically  AND
    ...  Click At Coordinates  350  350  ## added to enable location as no locators for the tick button is present
    Log To Console  Location services is handled in camera
    Repeat Keyword  2  Press Back


Launch App From Random List
    [Arguments]  ${random_app_name}
    Log  Launching: ${random_app_name}
    Run Keyword If  '${random_app_name}'=='Contacts'  Launch Contacts App
    Run Keyword If  '${random_app_name}'=='Messaging'  Launch Messaging App
    Run Keyword If  '${random_app_name}'=='Telephony'  Launch Phone App
    Run Keyword If  '${random_app_name}'=='Browser'  Launch Browser App
    Run Keyword If  '${random_app_name}'=='Playstore'  Launch Playstore App
    Run Keyword If  '${random_app_name}'=='Camera'  Launch Camera App

Launch Particular App
    [Arguments]  ${app_package_activity}
    Log To console  Launching Particular App
    Execute Adb Shell Command  am start -n ${app_package_activity}
    BuiltIn.Sleep  10s  For Page to load successfully

Verify Particular App Is Launched
    [Arguments]  &{app_identifier}
    ${status}  Wait For Exists  5  &{app_identifier}
    Run Keyword If  ${status}  Log To Console  App Is Launched
    ...  ELSE  FAIL  App is not launched

Close Particular App
    [Arguments]  ${app_package}
    Log To console  Closing Particular App
    Execute Adb Shell Command  am force-stop ${app_package}
    BuiltIn.Sleep  3s

Scroll Down Through Menu To Click App
    [Arguments]  &{app_name}
    BuiltIn.Sleep  1
    FOR  ${index}  IN RANGE  1  50
        Swipe By coordinates  245  460  245  245
        BuiltIn.Sleep  1
        ${status}  Wait For Exists  &{app_name}
        Run Keyword If  ${status}  Run Keywords
        ...  Click  &{app_name}  AND
        ...  BuiltIn.Sleep  2  AND
        ...  Return From Keyword
        Run Keyword Unless  ${status}  Continue For Loop
    END
    Scroll Up Through Menu To Click App  &{app_name}

Scroll Up Through Menu To Click App
    [Arguments]  &{app_name}
    BuiltIn.Sleep  1
    FOR  ${index}  IN RANGE  1  50
        Swipe By coordinates  245  245  245  460
        BuiltIn.Sleep  1
        ${status}  Wait For Exists  &{app_name}
        Run Keyword If  ${status}  Run Keywords
        ...  Click  &{app_name}  AND
        ...  BuiltIn.Sleep  2  AND
        ...  Return From Keyword
        Run Keyword Unless  ${status}  Continue For Loop
    END

Close Browser App
    Log To Console  Closing Browser App
    Close All Apps

# Test Setup Keyword For StoreFront
#     [Arguments]  ${app_name_list}
#     Test Setup Keyword
#     Uninstall Applications From StoreFront  ${app_name_list}

Keyword For Fetching All Data For Dashboard
    ${Suite_Total_Iteration_Count} =  Evaluate  ${Suite_Total_Iteration_Count} + ${Total_Iteration_Count}
    Set Global Variable  ${Suite_Total_Iteration_Count}
    ${Suite_Total_Pass_Count} =  Evaluate  ${Suite_Total_Pass_Count} + ${Total_Pass_Count}
    Set Global Variable  ${Suite_Total_Pass_Count}
    Set Serial  ${TEST_DEVICE}
    ${logcat_path}  ${radio_logs_path}  Capture Device Logs  ${TEST_DEVICE}
    Log  ${logcat_path}
    ${fatal_exception}  ${fatal_signal}  ${anr}  Get Count From Logcat  ${LOG_FLAG}  ${logcat_path}  ### changes made for testing crash due to fatal signal
    ${CRASH_COUNT}  Evaluate  ${CRASH_COUNT}+${fatal_exception}+${fatal_signal}+${anr}
    Log  Crash=${fatal_exception}+${fatal_signal}
    Log  ANR=${anr}
    Set Test Variable  \${CRASH_COUNT}
    ${Suite_CRASH_COUNT} =  Evaluate  ${Suite_CRASH_COUNT} + ${CRASH_COUNT}
    # Set Global Variable  ${Suite_CRASH_COUNT}


Verify Particular Call State
    ##  For mCallState=0 , call_status is Idle/Not connected
    ##  For mCallState=1 , call_status is incoming call
    ##  For mCallState=2 , call_status is Connected/Active
    [Arguments]  ${expected_mCallState}  ${call_status}
    Turn On Screen
    BuiltIn.Sleep  1
   ${result}  Execute Adb Shell Command  "dumpsys telephony.registry | grep -E 'mCallState'"
   Log  ${result}
   ${result}  Convert To String  ${result}
   ${result}  Get Regexp Matches  ${result}  mCallState=.
   Log To console  Verifying mCallState of device
   Run Keyword If  ${result}==['${expected_mCallState}']  Log To Console  Call status is ${call_status}
   Run Keyword If  ${result}!=['${expected_mCallState}']  FAIL  ${result}
   Turn On Screen