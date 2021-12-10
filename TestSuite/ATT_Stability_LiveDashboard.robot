*** Settings ***
# Documentation       ATT Stability Scripts
Library             cogmationlibrary
Library             OperatingSystem
Library             String
Library             Collections
Resource            ${EXECDIR}/Res/Android/GenericFunction.robot
Resource            ${EXECDIR}/Res/Android/WatchFunction.robot
Resource            ${EXECDIR}/Res/Android/SettingsFunction.robot
Resource            ${EXECDIR}/Res/Android/WiFiFunction.robot
Resource            ${EXECDIR}/Res/Android/PIMFunction.robot
Resource            ${EXECDIR}/Res/Android/PhoneFunction.robot
Resource            ${EXECDIR}/Res/Android/RTTFunction.robot
Resource            ${EXECDIR}/Res/Android/MusicPlayerFunction.robot
Resource            ${EXECDIR}/Res/Android/MenuNavigationFunction.robot
Resource            ${EXECDIR}/Res/Android/ContactsFunction.robot
Resource            ${EXECDIR}/Res/Android/CameraFunction.robot
Resource            ${EXECDIR}/Res/Android/SMSOverIPFunction.robot
Resource            ${EXECDIR}/Res/Android/FB_Addition.robot
Variables           ${EXECDIR}/VariableFiles/Android/Config.py

Suite Setup         Suite Setup Keyword
*** Test Cases ***

WiFi_Turn WiFi Radio On And Off
    [Documentation]  Wi-Fi 5.1.9
    [Setup]  Test Setup Keyword
    Log To Console  Event 1 : Turn the WiFi radio off and on (20)
    Log  Event 1 : Turn the WiFi radio off and on (20)
    # Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/WiFi_001_${TEST_DEVICE}_${converted_date}.txt
    # Create File  ${log_path}
    ${D1}  Create Dictionary

    FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_20}+1
        Iteration Setup
        Log To Console  \nIteration No.: ${ITERATION_COUNTER}
        # Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
        ${status}  Run Keyword And Return Status  Turn WiFi Radio On And Off
        Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        ...  ELSE  Iteration Unsucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
    END
    Stability Test Status  ${D1}
    ##########Append in all test case to get cumulative Total Iteation count and Total pass count
    Keyword For Fetching All Data For Dashboard
    ##########
    [Teardown]  Run Keywords
    ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown  AND
    ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
    ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${WIFI_ITERATIONS_SUCCESSFULL}  AND
    ...  BuiltIn.Sleep  3s  AND
    ...  Repeat Keyword  5  Press Back  AND
    ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown

WiFi_Connect And Disconnect to a WiFi network
    [Setup]  Run Keywords
    ...  Test Setup Keyword  AND
    ...  Connect To Particular WiFi  ${WIFI_NETWORK_AVAILABLE}  ${WIFI_NETWORK_AVAILABLE_PASSWORD}

    Log To Console  Event 2 : Connect/Disconnect to a WiFi network (20)
    Log  Event 2 : Connect/Disconnect to a WiFi network (20)
    #Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/WiFi_002.txt
    #Create File  ${log_path}
    ${D1}  Create Dictionary

    FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_20}+1
        Iteration Setup
        Log To Console  \nIteration No.: ${ITERATION_COUNTER}
        #Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
        ${status}  Run Keyword And Return Status  Connect And Disconnect To WiFi Network
        Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        ...  ELSE  Iteration Unsucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
    END
    Stability Test Status  ${D1}
##########Append in all test case to get cumulative Total Iteation count and Total pass count
    Keyword For Fetching All Data For Dashboard
    ##########
    [Teardown]  Run Keywords
    ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown  AND
    ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
    ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${WIFI_ITERATIONS_SUCCESSFULL}  AND
    ...  Switch On WiFi Radio Button  AND
    ...  Disconnect From Particular WiFi  ${WIFI_NETWORK_AVAILABLE}  AND
    ...  Repeat Keyword  5  Press Back

PIM_Set an alarm
    [Documentation]  PIM 5.1.5
    [Setup]  Test Setup Keyword
    Log To Console  EVENT 2 : Set an alarm (1)
    Log  EVENT 2 : Set an alarm (1)
    #Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/PIM_002_${TEST_DEVICE}_${converted_date}.txt
    #Create File  ${log_path}
    ${D1}  Create Dictionary
    FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_01}+1
        Iteration Setup
        Log To Console  \nIteration No.: ${ITERATION_COUNTER}
        #Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
        ${status}  Run Keyword And Return Status  Set an Alarm
        Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        ...  ELSE  Iteration Unsucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
    END
    Stability Test Status  ${D1}
    BuiltIn.sleep  3s
##########Append in all test case to get cumulative Total Iteation count and Total pass count
    Keyword For Fetching All Data For Dashboard
    ##########
    [Teardown]  Run Keywords
    ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown  AND
    ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
    ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${PIM_ITERATIONS_SUCCESSFULL}  AND
    ...  BuiltIn.Sleep  3s  AND
    ...  Repeat Keyword  3  Press Back  AND
    ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown

PIM_Delete an Alarm
    [Documentation]  PIM 5.1.5
    [Setup]  Test Setup Keyword
    Log To Console  EVENT 4 : Delete an alarm (1)
    Log  EVENT 4 : Delete an alarm (1)
    #Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/PIM_004_${TEST_DEVICE}_${converted_date}.txt
    #Create File  ${log_path}
    ${D1}  Create Dictionary
    FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_01}+1
        Iteration Setup
        Log To Console  \nIteration No.: ${ITERATION_COUNTER}
        #Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
        ${status}  Run Keyword And Return Status  Delete an Alarm
        Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        ...  ELSE  Iteration Unsucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
    END
    Stability Test Status  ${D1}
    BuiltIn.sleep  3s
#########Append in all test case to get cumulative Total Iteation count and Total pass count
    Keyword For Fetching All Data For Dashboard
     ##########
    [Teardown]  Run Keywords
    ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown  AND
    ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
    ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${PIM_ITERATIONS_SUCCESSFULL}  AND
    ...  BuiltIn.Sleep  3s  AND
    ...  Repeat Keyword  3  Press Back  AND
    ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown

MultiMedia_Record A 30s Video
    [Documentation]  Multi-Media 5.1.6
     [Setup]  Test Setup Keyword
    Log To Console  Event 1 : Record A 30s Video (1)
    Log  Event 1 : Record A 30s Video (1)
    #Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/MultiMediaStability_001_${TEST_DEVICE}_${converted_date}.txt
    #Create File  ${log_path}
     ${D1}  Create Dictionary
    FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_01}+1
        Iteration Setup
        Log To Console  \nIteration No.: ${ITERATION_COUNTER}
        #Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
        ${status}  Run Keyword And Return Status  Capture Video Of Particular Length  30
        Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        ...  ELSE  Iteration Unsucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
    END
    Stability Test Status  ${D1}
    ##########Append in all test case to get cumulative Total Iteation count and Total pass count
    Keyword For Fetching All Data For Dashboard
    ##########
    [Teardown]  Run Keywords
    ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown  AND
    ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
    ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${MULTIMEDIA_ITERATIONS_SUCCESSFULL}  AND
    ...  BuiltIn.Sleep  3s  AND
    ...  Repeat Keyword  3  Press Back  AND
    ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown

MultiMedia_Play back a 30s video
    [Documentation]  Multi-Media 5.1.6
     [Setup]  Test Setup Keyword
    Log To Console  Event 2 : Play back a 30s video (1)
    Log  Event 2 : Play back a 30s video (1)
    #Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/MultiMediaStability_002_${TEST_DEVICE}_${converted_date}.txt
    #Create File  ${log_path}
    ${D1}  Create Dictionary
    FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_01}+1
        Iteration Setup
        Log To Console  \nIteration No.: ${ITERATION_COUNTER}
        #Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
        ${status}  Run Keyword And Return Status  Play Captured Video And Verify  30
        Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        ...  ELSE  Iteration Unsucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
    END
    Stability Test Status  ${D1}
    ##########Append in all test case to get cumulative Total Iteation count and Total pass count
    Keyword For Fetching All Data For Dashboard
    ##########
    [Teardown]  Run Keywords
    ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown  AND
    ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
    ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${MULTIMEDIA_ITERATIONS_SUCCESSFULL}  AND
    ...  BuiltIn.Sleep  3s  AND
    # ...  Press Home  AND
    ...  Repeat Keyword  3  Press Back  AND
    ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown

MultiMedia_Delete A Video
    [Documentation]  Multi-Media 5.1.6
     [Setup]  Test Setup Keyword
    Log To Console  Event 3 : Delete a video (1)
    Log  Event 3 : Delete a video (1)
    #Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/MultiMediaStability_003_${TEST_DEVICE}_${converted_date}.txt
    #Create File  ${log_path}
    ${D1}  Create Dictionary
    FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_01}+1
        Iteration Setup
        Log To Console  \nIteration No.: ${ITERATION_COUNTER}
        #Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
        ${status}  Run Keyword And Return Status  Delete Captured Video  30
        Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        ...  ELSE  Iteration Unsucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
    END
    Stability Test Status  ${D1}
    ##########Append in all test case to get cumulative Total Iteation count and Total pass count
    Keyword For Fetching All Data For Dashboard
    ##########
    [Teardown]  Run Keywords
    ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown  AND
    ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
    ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${MULTIMEDIA_ITERATIONS_SUCCESSFULL}  AND
    ...  BuiltIn.Sleep  3s  AND
    ...  Repeat Keyword  3  Press Back  AND
    ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown

MultiMedia_Take A Picture
    [Documentation]  Multi-Media 5.1.6
     [Setup]  Test Setup Keyword
    Log To Console  Event 4 : Take A Picture (20)
    Log  Event 4 : Take A Picture (20)
    #Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/MultiMediaStability_004_${TEST_DEVICE}_${converted_date}.txt
    #Create File  ${log_path}
    ${D1}  Create Dictionary
    FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_20}+1
        Iteration Setup
        Log To Console  \nIteration No.: ${ITERATION_COUNTER}
        #Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
        ${status}  Run Keyword And Return Status  Capture Image
        Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        ...  ELSE  Iteration Unsucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
    END
    Stability Test Status  ${D1}
    ##########Append in all test case to get cumulative Total Iteation count and Total pass count
    Keyword For Fetching All Data For Dashboard
    ##########
    [Teardown]  Run Keywords
    ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown  AND
    ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
    ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${MULTIMEDIA_ITERATIONS_SUCCESSFULL}  AND
    ...  BuiltIn.Sleep  3s  AND
    ...  Repeat Keyword  3  Press Back  AND
    ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown

MultiMedia_Open A Picture
    [Documentation]  Multi-Media 5.1.6
     [Setup]  Test Setup Keyword
    Log To Console  Event 5 : Open A Picture (20)
    Log  Event 5 : Open A Picture (20)

    #Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/MultiMediaStability_005_${TEST_DEVICE}_${converted_date}.txt
    #Create File  ${log_path}
    ${D1}  Create Dictionary
    FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_20}+1
        Iteration Setup
        Log To Console  \nIteration No.: ${ITERATION_COUNTER}
        #Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
        ${status}  Run Keyword And Return Status  Open Captured Image And Verify
        Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        ...  ELSE  Iteration Unsucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        # Repeat Keyword  3  Press Back
    END
    Stability Test Status  ${D1}
    ##########Append in all test case to get cumulative Total Iteation count and Total pass count
    Keyword For Fetching All Data For Dashboard
#     ##########
    [Teardown]  Run Keywords
    ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown  AND
    ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
    ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${MULTIMEDIA_ITERATIONS_SUCCESSFULL}  AND
    ...  BuiltIn.Sleep  3s  AND
    ...  Repeat Keyword  3  Press Back  AND
    ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown

MultiMedia_Delete A Picture
    [Documentation]  Multi-Media 5.1.6
     [Setup]  Test Setup Keyword
    Log To Console  Event 6 : Delete A Picture (20)
    Log  Event 6 : Delete A Picture (20)
    #Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/MultiMediaStability_006_${TEST_DEVICE}_${converted_date}.txt
    #Create File  ${log_path}
    ${D1}  Create Dictionary
    FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_20}+1
        Iteration Setup
        Log To Console  \nIteration No.: ${ITERATION_COUNTER}
        #Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
        ${status}  Run Keyword And Return Status  Delete Captured Image
        Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        ...  ELSE  Iteration Unsucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
    END
    Stability Test Status  ${D1}
    ##########Append in all test case to get cumulative Total Iteation count and Total pass count
    Keyword For Fetching All Data For Dashboard
    ##########
    [Teardown]  Run Keywords
    ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown  AND
    ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
    ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${MULTIMEDIA_ITERATIONS_SUCCESSFULL}  AND
    ...  BuiltIn.Sleep  3s  AND
    ...  Repeat Keyword  3  Press Back  AND
    ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown

MultiMedia_Opening and Closing music player
    [Documentation]  Multi-Media 5.1.6
    [Setup]  Test Setup Keyword
    Log To Console  Event 8 : Opening and Closing music player (20)
    Log  Event 8 : Opening and Closing music player (20)
    #Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/MultiMediaStability_008_${TEST_DEVICE}_${converted_date}.txt
    #Create File  ${log_path}
    ${D1}  Create Dictionary
    FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_20}+1
        Iteration Setup
        # Music Player Iteration Setup
        Log To Console  \nIteration No.: ${ITERATION_COUNTER}
        #Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
        ${status}  Run Keyword And Return Status  Open And Close Music Player
        Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        ...  ELSE  Iteration Unsucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        # Repeat Keyword  3  Press Back
    END
    Stability Test Status  ${D1}
    ##########Append in all test case to get cumulative Total Iteation count and Total pass count
    Keyword For Fetching All Data For Dashboard
#     ##########
    [Teardown]  Run Keywords
    ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown  AND
    ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
    ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${MULTIMEDIA_ITERATIONS_SUCCESSFULL}  AND
    ...  BuiltIn.Sleep  3s  AND
    ...  Repeat Keyword  3  Press Back  AND
    ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown


MultiMedia_Open Music Player and play a music file
    [Documentation]  Multi-Media 5.1.6
    [Setup]  Test Setup Keyword
    Log To Console  Event 9 : Open Music Player and play a music file (50)
    Log  Event 9 : Open Music Player and play a music file (50)

    #Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/MultiMediaStability_009_${TEST_DEVICE}_${converted_date}.txt
    #Create File  ${log_path}
    ${D1}  Create Dictionary
    FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_50}+1
        Iteration Setup
        Music Player Iteration Setup
        Log To Console  \nIteration No.: ${ITERATION_COUNTER}
        #Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
        ${status}  Run Keyword And Return Status  Open Music Player Play Device Music and Play Next
        Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        ...  ELSE  Iteration Unsucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        # Repeat Keyword  3  Press Back
    END
    Stability Test Status  ${D1}
    ##########Append in all test case to get cumulative Total Iteation count and Total pass count
    Keyword For Fetching All Data For Dashboard
    ##########
    [Teardown]  Run Keywords
    ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown  AND
    ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
    ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${MULTIMEDIA_ITERATIONS_SUCCESSFULL}  AND
    ...  BuiltIn.Sleep  3s  AND
    ...  Repeat Keyword  3  Press Back  AND
    ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown

MultiMedia_Close the music player
    [Documentation]  Multi-Media 5.1.6
    [Setup]  Test Setup Keyword
    Log To Console  Event 10 : Close the music player (1)
    Log  Event 10 : Close the music player (1)

    #Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/MultiMediaStability_010_${TEST_DEVICE}_${converted_date}.txt
    #Create File  ${log_path}
    ${D1}  Create Dictionary
    FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_01}+1
        Iteration Setup
        Log To Console  \nIteration No.: ${ITERATION_COUNTER}
        #Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
        ${status}  Run Keyword And Return Status  Close Music Player
        Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        ...  ELSE  Iteration Unsucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
    END
    Stability Test Status  ${D1}
    ##########Append in all test case to get cumulative Total Iteation count and Total pass count
    Keyword For Fetching All Data For Dashboard
    ##########
    [Teardown]  Run Keywords
    ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown  AND
    ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
    ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${MULTIMEDIA_ITERATIONS_SUCCESSFULL}  AND
    ...  BuiltIn.Sleep  3s  AND
    ...  Repeat Keyword  3  Press Back  AND
    ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown

# MultiMedia_Open and set a theme
#     [Documentation]  Multi-Media 5.1.6
#     [Setup]  Test Setup Keyword
#     Log To Console  Event 11 : Open and set a theme (10)
#     Log  Event 11 : Open and set a theme (10)
#     #Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/MultiMediaStability_011_${TEST_DEVICE}_${converted_date}.txt
#     #Create File  ${log_path}
#     ${D1}  Create Dictionary
#     FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_10}+1
#         Iteration Setup
#         Log To Console  \nIteration No.: ${ITERATION_COUNTER}
#         #Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
#         ${status}  Run Keyword And Return Status  Change Watch Theme And Set Back To Default
#         Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
#         ...  ELSE  Iteration Unsucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
#     END
#     Stability Test Status  ${D1}
#     ##########Append in all test case to get cumulative Total Iteation count and Total pass count
#     Keyword For Fetching All Data For Dashboard
#     ##########
#     [Teardown]  Run Keywords
#     ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown  AND
#     ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
#     ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${MULTIMEDIA_ITERATIONS_SUCCESSFULL}  AND
#     ...  BuiltIn.Sleep  3s  AND
#     ...  Repeat Keyword  3  Press Back  AND
#     ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown

Menu_Navigation_Starting From The Device Main screen
    [Documentation]  Menu Nav 5.1.8
    [Setup]  Test Setup Keyword
    Log To Console  Event 1 : Starting from the device main screen (1)
    Log  Event 1 : Starting from the device main screen (1)

    #Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/MenuNavigation_001_${TEST_DEVICE}_${converted_date}.txt
    #Create File  ${log_path}
    ${D1}  Create Dictionary
    FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_01}+1
        Iteration Setup
        Log To Console  \nIteration No.: ${ITERATION_COUNTER}
        #Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
        ${status}  Run Keyword And Return Status  Navigate Through All Apps In Menu And SubMenu Options
        Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        ...  ELSE  Iteration Unsucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
    END
    Stability Test Status  ${D1}
    ##########Append in all test case to get cumulative Total Iteation count and Total pass count
    Keyword For Fetching All Data For Dashboard
    ##########
    [Teardown]  Run Keywords
    ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown  AND
    ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
    ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${MENUNAV_ITERATIONS_SUCCESSFULL}  AND
    ...  BuiltIn.Sleep  3s  AND
    ...  Repeat Keyword  3  Press Back  AND
    ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown

Telephony_Make A Voice Call From The Call History List
   [Documentation]  Telephony 5.1.10
   [Setup]  Run Keywords
   ...  Test Setup Keyword  AND
   ...  Test Setup Partner Device  AND
   ...  Execute adb shell command  am start -a android.intent.action.DIAL -d tel:${PARTNER_DEVICE_PHONENUMBER}  AND
   ...  Run Keyword and return Status  Click  &{PHONE_DIAL_NUMBER_ICON}  AND
   ...  Terminate Phone Call   ### added so that partner device number is available in history
   Log To Console  Event 2: Make a voice call from the call history list (50)
   Log  Event 2: Make a voice call from the call history list (50)
   # Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/Telephony_002_${TEST_DEVICE}_${converted_date}.txt
   # Create File  ${log_path}
   ${D1}  Create Dictionary
   FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_100}+1     ##temporarily made 5 change to 50 when needed
       Iteration Setup
       Log To Console  \nIteration No.: ${ITERATION_COUNTER}
       # Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
       ${status}  Run Keyword And Return Status  Establish Call Connectivity From Call History
       Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
       ...  ELSE  Iteration Unsucessfull Keyword Telephony  ${D1}  ${ITERATION_COUNTER}
       Terminate Phone Call                                              #### added by Aditya  14 oct
   END
   Stability Test Status  ${D1}   ##temporarily made 5 change to 50 when needed
    #########Append in all test case to get cumulative Total Iteation count and Total pass count
  Keyword For Fetching All Data For Dashboard
    #########
   [Teardown]  Run Keywords
   ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown Telephony  AND
   ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
   ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${EXPECTED_ITERATIONS_SUCCESSFULL}  AND
   ...  Repeat Keyword  3  Press Back  AND
   ...  BuiltIn.Sleep  10  AND
   ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown

Telephony_Receive A Call
   [Documentation]  Telephony 5.1.10
   [Setup]  Run Keywords
    ...  Test Setup Keyword  AND
    ...  Test Setup Partner Device
   Log To Console  Event 3: Receive a call (50)
   Log  Event 3: Receive a call (50)
   #Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/Telephony_003_${TEST_DEVICE}_${converted_date}.txt
   #Create File  ${log_path}
   ${D1}  Create Dictionary
   FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_100}+1     ##temporarily made 5 change to 50 when needed
      Iteration Setup
      Log To Console  \nIteration No.: ${ITERATION_COUNTER}
      #Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
       ${status}  Run Keyword And Return Status  MT Call Receiving on Test Device Dialer
       Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
       ...  ELSE  Iteration Unsucessfull Keyword Telephony  ${D1}  ${ITERATION_COUNTER}
       Terminate Phone Call                                              #### added by Aditya  14 oct
   END
   Stability Test Status  ${D1}   ##temporarily made 5 change to 50 when needed
    #########Append in all test case to get cumulative Total Iteation count and Total pass count
  Keyword For Fetching All Data For Dashboard
    ########
   [Teardown]  Run Keywords
   ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown Telephony  AND
   ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
   ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${EXPECTED_ITERATIONS_SUCCESSFULL}  AND
   ...  Repeat Keyword  3  Press Back  AND
   ...  BuiltIn.Sleep  10  AND
   ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown

RTT_Make An Audio Call From Dialer And Upgrade To RTT
    [Documentation]  RTT 5.1.15
    [Setup]  Run Keywords
    ...  Test Setup Keyword  AND
    ...  Test Setup Partner Device  AND
    ...  Enable RTT As Particular Option In Partner Device  &{PARTNER_DEVICE_RTT_NOT_VISIBLE}  AND
    ...  Enable RTT In MOS Device
    Log To Console  Event 1 : Make A Call And Upgrade To RTT (25)
    Log  Event 1 : Make A Call And Upgrade To RTT (25)
    #Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/RTT_001_${TEST_DEVICE}_${converted_date}.txt
    #Create File  ${log_path}
    ${D1}  Create Dictionary
    ${random_msg}  Generate Random String  length=30
    FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_25}+1
      Iteration Setup
        Log To Console  \nIteration No.: ${ITERATION_COUNTER}
        #Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
        ${status}  Run Keyword And Return Status  Make Audio Call And Upgrade To RTT  ${random_msg}
        Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        ...  ELSE  Iteration Unsucessfull Keyword Telephony  ${D1}  ${ITERATION_COUNTER}
        Terminate Phone Call                                              #### added by Aditya  14 oct
    END
    Stability Test Status  ${D1}
    ##########Append in all test case to get cumulative Total Iteation count and Total pass count
    Keyword For Fetching All Data For Dashboard
    ##########
    [Teardown]  Run Keywords
    ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown Telephony  AND
    ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
    ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${MENUNAV_ITERATIONS_SUCCESSFULL}  AND
    ...  Disable RTT In MOS Device  AND
    ...  Repeat Keyword  3  Press Back  AND
    ...  Disable RTT As Particular Option In Partner Device  &{PARTNER_DEVICE_RTT_NOT_VISIBLE}  AND
    ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown

RTT_Make An RTT Call From Dialer
    [Documentation]  RTT 5.1.15
    [Setup]  Run Keywords
    ...  Test Setup Keyword  AND
    ...  Test Setup Partner Device  AND
    ...  Enable RTT As Particular Option In Partner Device  &{PARTNER_DEVICE_RTT_NOT_VISIBLE}  AND
    ...  Enable RTT In MOS Device
    Log To Console  Event 1 : Make An RTT Call From Dialer (25)
    Log  Event 1 : Make An RTT Call From Dialer (25)
    #Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/RTT_002_${TEST_DEVICE}_${converted_date}.txt
    #Create File  ${log_path}
    ${D1}  Create Dictionary
    ${random_msg}  Generate Random String  length=30
    FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_25}+1
      Iteration Setup
        Log To Console  \nIteration No.: ${ITERATION_COUNTER}
        #Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
        ${status}  Run Keyword And Return Status  Make RTT Call From DUT  ${random_msg}
        Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        ...  ELSE  Iteration Unsucessfull Keyword Telephony  ${D1}  ${ITERATION_COUNTER}
        Terminate Phone Call                                              #### added by Aditya  14 oct
    END
    Stability Test Status  ${D1}
    ##########Append in all test case to get cumulative Total Iteation count and Total pass count
    Keyword For Fetching All Data For Dashboard
    ##########
    [Teardown]  Run Keywords
    ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown Telephony  AND
    ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
    ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${MENUNAV_ITERATIONS_SUCCESSFULL}  AND
    ...  Disable RTT In MOS Device  AND
    ...  Repeat Keyword  3  Press Back  AND
    ...  Disable RTT As Particular Option In Partner Device  &{PARTNER_DEVICE_RTT_NOT_VISIBLE}  AND
    ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown

RTT_Receive RTT Call
    [Documentation]  RTT 5.1.15
    [Setup]  Run Keywords
    ...  Test Setup Keyword  AND
    ...  Test Setup Partner Device  AND
    ...  Enable RTT As Particular Option In Partner Device  &{PARTNER_DEVICE_RTT_ALWAYS_VISIBLE}  AND
    ...  Enable RTT In MOS Device
    Log To Console  Event 1 : Receive RTT Call (25)
    Log  Event 1 : Receive RTT Call (25)
    #Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/RTT_003_${TEST_DEVICE}_${converted_date}.txt
    #Create File  ${log_path}
    ${D1}  Create Dictionary
    ${random_msg}  Generate Random String  length=30
    FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_25}+1
      Iteration Setup
        Log To Console  \nIteration No.: ${ITERATION_COUNTER}
        #Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
        ${status}  Run Keyword And Return Status  Receive RTT Call On DUT  ${random_msg}
        Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        ...  ELSE  Iteration Unsucessfull Keyword Telephony  ${D1}  ${ITERATION_COUNTER}
        Terminate Phone Call                                              #### added by Aditya  14 oct
    END
    Stability Test Status  ${D1}
    ##########Append in all test case to get cumulative Total Iteation count and Total pass count
    Keyword For Fetching All Data For Dashboard
    ##########
    [Teardown]  Run Keywords
    ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown Telephony  AND
    ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
    ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${MENUNAV_ITERATIONS_SUCCESSFULL}  AND
    ...  Disable RTT In MOS Device  AND
    ...  Repeat Keyword  3  Press Back  AND
    ...  Disable RTT As Particular Option In Partner Device  &{PARTNER_DEVICE_RTT_NOT_VISIBLE}  AND
    ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown

RTT_Receive An Audio Call Then Upgrade To RTT
    [Documentation]  RTT 5.1.15
    [Setup]  Run Keywords
    ...  Test Setup Keyword  AND
    ...  Test Setup Partner Device  AND
    ...  Enable RTT As Particular Option In Partner Device  &{PARTNER_DEVICE_RTT_VISIBLE_DURING_CALL}  AND
    ...  Enable RTT In MOS Device  #AND
    # ...  Enable Send Immediately Feature In RTT
    Log To Console  Event 1 : Receive An Audio Call Then Upgrade To RTT (25)
    Log  Event 1 : Receive An Audio Call Then Upgrade To RTT (25)
    #Set Test Variable  ${log_path}  ${EXECDIR}/Report/${TEST_NAME}/RTT_004_${TEST_DEVICE}_${converted_date}.txt
    #Create File  ${log_path}
    ${D1}  Create Dictionary
    ${random_msg}  Generate Random String  length=30
    FOR  ${ITERATION_COUNTER}  IN RANGE  1  ${ITERATION_COUNT_25}+1
      Iteration Setup
        Log To Console  \nIteration No.: ${ITERATION_COUNTER}
        #Append To File  ${log_path}  \n\nITERATION ${ITERATION_COUNTER}
        ${status}  Run Keyword And Return Status  Receive Voice Call And Upgrade To RTT  ${random_msg}
        Run Keyword If  ${status}  Iteration Sucessfull Keyword  ${D1}  ${ITERATION_COUNTER}
        ...  ELSE  Iteration Unsucessfull Keyword Telephony  ${D1}  ${ITERATION_COUNTER}
        Terminate Phone Call                                              #### added by Aditya  14 oct
    END
    Stability Test Status  ${D1}
    ##########Append in all test case to get cumulative Total Iteation count and Total pass count
    Keyword For Fetching All Data For Dashboard
    ##########
    [Teardown]  Run Keywords
    ...  Run Keyword If  ${Feature Status}=='Fail'  Test Fail Teardown Telephony  AND
    ...  Log  ${Total_Iteration_Count} ${Total_Pass_Count}  AND
    ...  Feature Stability Test Status  total_iters=${Total_Iteration_Count}  passiterations=${Total_Pass_Count}  expected_percent=${MENUNAV_ITERATIONS_SUCCESSFULL}  AND
    # ...  Disable Send Immediately Feature In RTT  AND
    ...  Disable RTT In MOS Device  AND
    ...  Repeat Keyword  3  Press Back  AND
    ...  Disable RTT As Particular Option In Partner Device  &{PARTNER_DEVICE_RTT_NOT_VISIBLE}  AND
    ...  Run Keyword If  ${Feature Status}=='Pass'  Test Pass Teardown

