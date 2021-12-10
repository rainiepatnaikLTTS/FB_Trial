*** Settings ***

Library             cogmationlibrary
Resource            ${EXECDIR}/Res/Android/GenericFunction.robot
Variables           ${EXECDIR}/VariableFiles/Android/Config.py

# Resource            /Res/Android/GenericFunction.robot

*** Keywords ***
Launch Settings App
    Execute Adb Shell Command  am start -n ${SETTINGS_APP_PACKAGE}
    BuiltIn.Sleep  3s  For Page to load successfully
    # ${status}  Wait For Exists  timeout=3000  &{NETWORK_AND_INTERNET_DICT}
    # Run Keyword Unless  ${status}  Fail  Unable to launch Settings App
    ${status}  Wait For Exists  timeout=3000  &{NETWORK_AND_INTERNET_DICT}
    Run Keyword Unless  ${status}  Fail  Unable to launch Settings App

Latch Device To Network
    [Arguments]  ${network_selection}
    Launch Settings App
    # ${status}  Wait For Exists  timeout=3000  &{NETWORK_AND_INTERNET_DICT}
    # Run Keyword If  ${status}  Click  &{NETWORK_AND_INTERNET_DICT}
    # Swipe By coordinates  308  351  308  100
    ${status}  Wait For Exists  timeout=3000  &{NETWORK_AND_INTERNET_DICT}
    Run Keyword If  ${status}  Click  &{NETWORK_AND_INTERNET_DICT}
    ...  ELSE  Fail  Unable to detect following item on UI ${NETWORK_AND_INTERNET_DICT}[text]
    ${status}  Wait For Exists  timeout=3000  &{MOBILE_NETWORK_DICT}
    Run Keyword If  ${status}  Click  &{MOBILE_NETWORK_DICT}
    ...  ELSE  Fail  Unable to detect following item on UI &{MOBILE_NETWORK_DICT}[text]

    FOR  ${INITIAL_LOOP}  IN RANGE  1  11
        ${status}  Wait For Exists  timeout=3000  &{ADVANCED_TEXT_DICT}
        Run Keyword If  ${status}  Run Keywords
        ...  Click  &{ADVANCED_TEXT_DICT}  AND
        ...  Exit For Loop
        Run Keyword Unless  ${status}  Run Keywords
        ...  Swipe By coordinates  308  351  308  100  AND
        ...  Continue For Loop
        Run Keyword If  ${INITIAL_LOOP} == 11  Fail  Unable to detect following item on UI &{ADVANCED_TEXT_DICT}[text]
    END
    # # ${status}  Wait For Exists  timeout=3000  &{ADVANCED_TEXT_DICT}
    # # Run Keyword If  ${status}  Click  &{ADVANCED_TEXT_DICT}
    # # ...  ELSE  Fail  Unable to detect following item on UI &{ADVANCED_TEXT_DICT}[text]
    ${status}  Wait For Exists  timeout=3000  &{NETWORK_SELECTION_DICT}
    Run Keyword If  ${status}  Click  &{NETWORK_SELECTION_DICT}
    ...  ELSE  Fail  Unable to detect following item on UI &{NETWORK_SELECTION_DICT}[text]
    ${status}  Wait For Exists  timeout=3000  text=${network_selection}
    Run Keyword If  ${status}  Click  text=${network_selection}
    ...  ELSE  Fail  Unable to detect following item on UI ${network_selection}
    Repeat Keyword  5  Press Back

Verify Device Latched To Any WWAN Network
    FOR  ${INITIAL_LOOP}  IN RANGE  1  31
        ${curr_network}  Execute Adb Shell Command  getprop gsm.network.type
        ${curr_network}  Set Variable  ${curr_network}[0]
        Exit For Loop If  '${LTE_VAR}' in '''${curr_network}'''
        Exit For Loop If  '${GSM_VAR}' in '''${curr_network}'''
        Exit For Loop If  '${WCDMA_VAR}' in '''${curr_network}'''
    END
    Run Keyword If  ${INITIAL_LOOP} == 30  Fail  Device not latched to any Network
    ...  ELSE  Log  Device Latched To ${curr_network} Network

Verify Device Latched To Sepcific WWAN Network
    [Arguments]  ${wwan_network}
    FOR  ${INITIAL_LOOP}  IN RANGE  1  31
        ${curr_network}  Execute Adb Shell Command  getprop gsm.network.type
        ${curr_network}  Set Variable  ${curr_network}[0]
        Exit For Loop If  '${wwan_network}' in '''${curr_network}'''
    END
    Run Keyword If  ${INITIAL_LOOP} == 30  Fail  Device not latched to ${wwan_network} Network
    ...  ELSE  Log  Device Latched To ${wwan_network} Network

Launch WiFi Status
    Launch Settings App
    ${status}  Wait For Exists  timeout=3000  &{NETWORK_AND_INTERNET_DICT}
    Run Keyword If  ${status}  Click  &{NETWORK_AND_INTERNET_DICT}
    ...  ELSE  Fail  Unable to detect following item on UI &{NETWORK_AND_INTERNET_DICT}[text]
    ${status}  Wait For Exists  timeout=3000  &{SETTINGS_WIFI_STRING}
    Run Keyword If  ${status}  Click  &{SETTINGS_WIFI_STRING}
    ...  ELSE  Fail  Unable to detect following item on UI &{SETTINGS_WIFI_STRING}[text]
    ${status}  Wait For Exists  timeout=3000  &{SETTINGS_SWITCH}
    Run Keyword Unless  ${status}  Fail  Unable to detect switch on UI

Change WiFi Status
    [Arguments]  ${wifi_status}
    Launch WiFi Status
    ${switch_info}  Get The Text  &{SETTINGS_SWITCH}
    Run Keyword If  '${wifi_status}' == '${ENABLE}' and '${switch_info}' == 'ON'  Log  WiFi is already ON
    ...  ELSE IF  '${wifi_status}' == '${ENABLE}' and '${switch_info}' == 'OFF'  Click  &{SETTINGS_SWITCH}
    ...  ELSE IF  '${wifi_status}' == '${DISABLE}' and '${switch_info}' == 'ON'  Click  &{SETTINGS_SWITCH}
    ...  ELSE IF  '${wifi_status}' == '${DISABLE}' and '${switch_info}' == 'OFF'  Log  WiFi is already OFF
    ...  ELSE  Fail  Invalid Arguments
    Repeat Keyword  5  Press Back


Validate WiFi Switch Status
    [Arguments]  ${wifi_status}
    Launch WiFi Status
    ${switch_info}  Get The Text  &{SETTINGS_SWITCH}
    Run Keyword If  '${wifi_status}' == '${ENABLE}' and '${switch_info}' == 'ON'  Log  WiFi is already ON
    ...  ELSE IF  '${wifi_status}' == '${ENABLE}' and '${switch_info}' == 'OFF'  Fail  WiFi i expected to be ON, but is OFF
    ...  ELSE IF  '${wifi_status}' == '${DISABLE}' and '${switch_info}' == 'ON'  Fail  WiFi is expected to be OFF, but is ON
    ...  ELSE IF  '${wifi_status}' == '${DISABLE}' and '${switch_info}' == 'OFF'  Log  WiFi is already OFF
    ...  ELSE  Fail  Invalid Arguments
    Repeat Keyword  5  Press Back

Toggle WiFi
    Change WiFi Status  ${ENABLE}
    Validate WiFi Switch Status  ${ENABLE}
    Change WiFi Status  ${DISABLE}
    Validate WiFi Switch Status  ${DISABLE}
    [Teardown]  Run Keyword And Ignore Error  Change WiFi Status  ${DISABLE}

Connect To WiFi Access Point
    [Arguments]  ${ap_name}  ${ap_password}
    Change WiFi Status  ${ENABLE}
    Validate WiFi Switch Status  ${ENABLE}
    Launch WiFi Status
    BuiltIn.Sleep  10s  For WiFi Page to complete refreshing process
    &{AP_DICT}  Create Dictionary  text  ${ap_name}
    ${status}  Wait For Exists  timeout=3000  &{AP_DICT}
    Run Keyword If  ${status}  Click  &{AP_DICT}
    ...  ELSE  Fail  Unable to detect following WiFi Access Point on UI ${ap_name}
    ${status}  Wait For Exists  timeout=3000  &{SETTINGS_PASSWORD_ENTRY_BOX}
    Run Keyword If  ${status}  Set Text  ${ap_password}  &{SETTINGS_PASSWORD_ENTRY_BOX}
    ...  ELSE  Fail  Unable to enter WLAN Access Point password
    ${status}  Wait For Exists  timeout=3000  &{SETTINGS_AP_CONNECT}
    Run Keyword If  ${status}  Click  &{SETTINGS_AP_CONNECT}
    ...  ELSE  Fail  Unable to detect connect button on UI
    BuiltIn.Sleep  5s  For WiFi to get connected
    ${text_on_ui}  Get The Relative Object Text  obj_a=&{AP_DICT}  obj_b=&{SETTINGS_AP_CONNECTED_TEXT}  position=bottom
    Run Keyword If  '${text_on_ui}' != 'Connected'  Fail  Device ot connected to following AP successfully ${ap_name}
    Repeat Keyword  5  Press Back


Forget WiFi Access Point
    [Arguments]  ${ap_name}
    Change WiFi Status  ${ENABLE}
    Validate WiFi Switch Status  ${ENABLE}
    Launch WiFi Status
    BuiltIn.Sleep  10s  For WiFi Page to complete refreshing process
    &{AP_DICT}  Create Dictionary  text  ${ap_name}
    ${status}  Wait For Exists  timeout=3000  &{AP_DICT}
    Run Keyword If  ${status}  Click  &{AP_DICT}
    ...  ELSE  Fail  Unable to detect following WiFi Access Point on UI ${ap_name}
    BuiltIn.Sleep  5s  For WiFi to get connected
    ${text_on_ui}  Get The Relative Object Text  obj_a=&{AP_DICT}  obj_b=&{SETTINGS_AP_CONNECTED_TEXT}  position=bottom
    Run Keyword If  '${text_on_ui}' != 'Connected'  Fail  Device not connected to following AP successfully ${ap_name}
    ${status}  Wait For Exists  timeout=3000  &{SETTINGS_AP_CONNECTED_TEXT}
    Run Keyword If  ${status}  Click  &{SETTINGS_AP_CONNECTED_TEXT}
    ...  ELSE  Fail  Unable to detect Connected string on UI
    ${status}  Wait For Exists  timeout=3000  &{SETTINGS_AP_FORGET_TEXT}
    Run Keyword If  ${status}  Click  &{SETTINGS_AP_FORGET_TEXT}
    ...  ELSE  Fail  Unable to detect Forget button on UI
    ${status}  Wait For Exists  timeout=3000  &{SETTINGS_AP_CONNECTED_TEXT}
    Run Keyword If  ${status}  Fail  WiFi AP is still in connected state
    Repeat Keyword  5  Press Back

Connect Disconnect WLAN
    Connect To WiFi Access Point  ${WLAN_AP_NAME}  ${WLAN_AP_PASSWORD}
    Forget WiFi Access Point  ${WLAN_AP_NAME}
    [Teardown]  Run Keyword And Ignore Error  Forget WiFi Access Point  ${WLAN_AP_NAME}

Change Enhanced VoLTE Status
    [Arguments]  ${volte_status}
    Launch Settings App
    ${status}  Wait For Exists  timeout=3000  &{NETWORK_AND_INTERNET_DICT}
    Run Keyword If  ${status}  Click  &{NETWORK_AND_INTERNET_DICT}
    ...  ELSE  Fail  Unable to detect following item on UI &{NETWORK_AND_INTERNET_DICT}[text]
    ${status}  Wait For Exists  timeout=3000  &{SETTINGS_MOBILE_NETWORK_TEXT}
    Run Keyword If  ${status}  Click  &{SETTINGS_MOBILE_NETWORK_TEXT}
    ...  ELSE  Fail  Unable to detect following item on UI &{SETTINGS_MOBILE_NETWORK_TEXT}[text]
    ${status}  Wait For Exists  timeout=3000  &{SETTINGS_ADVANCED_TEXT}
    Run Keyword If  ${status}  Click  &{SETTINGS_ADVANCED_TEXT}
    ...  ELSE  Fail  Unable to detect following item on UI &{SETTINGS_ADVANCED_TEXT}[text]
    ${status}  Wait For Exists  timeout=3000  &{SETTINGS_ENHANCED_LTE_TEXT}
    Run Keyword Unless  ${status}  Fail  Unable to detect following item on UI &{SETTINGS_ENHANCED_LTE_TEXT}[text]
    ${text_on_ui}  Get The Relative Object Text  obj_a=&{SETTINGS_ENHANCED_LTE_TEXT}  obj_b=&{ANDROID_SWITCH}  position=right
    Run Keyword If  '${volte_status}' == '${ENABLE}' and '${text_on_ui}' != 'ON'  Log  VoLTE is already enabled
    ...  ELSE IF  '${volte_status}' == '${ENABLE}' and '${text_on_ui}' != 'OFF'  Click  &{SETTINGS_ENHANCED_LTE_TEXT}
    ...  ELSE IF  '${volte_status}' == '${DISABLE}' and '${text_on_ui}' != 'ON'  Click  &{SETTINGS_ENHANCED_LTE_TEXT}
    ...  ELSE IF  '${volte_status}' == '${DISABLE}' and '${text_on_ui}' != 'OFF'  Log  VoLTE is already disabled
    ...  ELSE  Fail  Invalid status of VoLTE Switch

Verify IMS Registration
    [Arguments]  ${expected}
    Launch Settings App
    ${object}  Get Object  &{SETTINGS_ABOUT_PHONE}
    ${status}  Scroll To Vertically  ${object}
    Run Keyword If  ${status}  Click  &{SETTINGS_ABOUT_PHONE}
    ...  ELSE  Fail  Unable to detect About Phone field on UI
    ${object}  Get Object  &{SETTINGS_SIM_STATUS}
    ${status}  Scroll To Vertically  ${object}
    Run Keyword If  ${status}  Click  &{SETTINGS_SIM_STATUS}
    ...  ELSE  Fail  Unable to detect SIM Status field on UI
    ${object}  Get Object  &{SETTINGS_IMS_REG_TEXT}
    ${status}  Scroll To Vertically  ${object}
    Run Keyword Unless  ${status}  Fail  Unable to detect IMS registration state on UI
    ${text_on_ui}  Get The Relative Object Text  obj_a=&{SETTINGS_IMS_REG_TEXT}  obj_b=&{}  position=bottom
    Run Keyword If  '${expected}' == '${ENABLE}' and '${text_on_ui}' != '${REGISTERED_STRING}'  Log  VoLTE is already enabled
    ...  ELSE IF  '${expected}' == '${ENABLE}' and '${text_on_ui}' != '${NOT_REGISTERED_STRING}'  Fail  IMS Registration is expected to be Registered but is Not Registered
    ...  ELSE IF  '${expected}' == '${DISABLE}' and '${text_on_ui}' != '${REGISTERED_STRING}'  Fail  IMS Registration is expected to be Not Registered but is Registered
    ...  ELSE IF  '${expected}' == '${DISABLE}' and '${text_on_ui}' != '${NOT_REGISTERED_STRING}'  Log  VoLTE is already disabled
    ...  ELSE  Fail  Invalid status of IMS Registration

Change WiFi Calling Status
    [Arguments]  ${wifi_calling_status}
    Launch Settings App
    ${status}  Wait For Exists  timeout=3000  &{NETWORK_AND_INTERNET_DICT}
    Run Keyword If  ${status}  Click  &{NETWORK_AND_INTERNET_DICT}
    ...  ELSE  Fail  Unable to detect following item on UI &{NETWORK_AND_INTERNET_DICT}[text]
    ${status}  Wait For Exists  timeout=3000  &{SETTINGS_MOBILE_NETWORK_TEXT}
    Run Keyword If  ${status}  Click  &{SETTINGS_MOBILE_NETWORK_TEXT}
    ...  ELSE  Fail  Unable to detect following item on UI &{SETTINGS_MOBILE_NETWORK_TEXT}[text]
    ${status}  Wait For Exists  timeout=3000  &{SETTINGS_ADVANCED_TEXT}
    Run Keyword If  ${status}  Click  &{SETTINGS_ADVANCED_TEXT}
    ...  ELSE  Fail  Unable to detect following item on UI &{SETTINGS_ADVANCED_TEXT}[text]
    ${text_on_ui}  Get The Relative Object Text  obj_a=&{SETTINGS_WIFI_CALLING}  obj_b=&{ANDROID_SWITCH}  position=right
    Run Keyword If  '${wifi_calling_status}' == '${ENABLE}' and '${text_on_ui}' != 'ON'  Log  Wi-Fi Calling is already enabled
    ...  ELSE IF  '${wifi_calling_status}' == '${ENABLE}' and '${text_on_ui}' != 'OFF'  Click  &{SETTINGS_WIFI_CALLING}
    ...  ELSE IF  '${wifi_calling_status}' == '${DISABLE}' and '${text_on_ui}' != 'ON'  Click  &{SETTINGS_WIFI_CALLING}
    ...  ELSE IF  '${wifi_calling_status}' == '${DISABLE}' and '${text_on_ui}' != 'OFF'  Log  Wi-Fi Calling is already disabled
    ...  ELSE  Fail  Invalid status of WiFi Calling Switch
