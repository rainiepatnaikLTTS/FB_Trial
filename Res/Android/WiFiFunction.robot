*** Settings ***

Library             cogmationlibrary
Library             OperatingSystem
Variables           ${EXECDIR}/VariableFiles/Android/Config.py

*** Keywords ***
Open MOS Settings
    Repeat Keyword  4  Press Back
    Execute Adb Shell Command  am force-stop ${SETTINGS_APP_PACKAGE}
    Execute Adb Shell Command  am start -n ${SETTINGS_APP_PACKAGE}
    BuiltIn.sleep  1
    ${status}  Wait For Exists  5  text=Notifications
    Run Keyword If  ${status}  Log to console  MOS Settings launched Successfully
    ...  ELSE  FAIL  MOS Settings not launched

Open WiFi From Settings
    Open MOS Settings
    ${status}  Wait For Exists  5  &{NETWORK_AND_INTERNET_DICT}
    Run Keyword If  ${status}  Click  &{NETWORK_AND_INTERNET_DICT}
    BuiltIn.sleep  3

    ${status}  Wait For Exists  5  &{SETTINGS_WIFI_OPTION}
    Run Keyword If  ${status}  Run Keywords
    ...  Click  &{SETTINGS_WIFI_OPTION}  AND
    ...  Return From Keyword
    Run Keyword Unless  ${status}  scroll_vertically_to_object  &{SETTINGS_WIFI_OPTION}
    ${status}  Wait For Exists  5  &{SETTINGS_WIFI_OPTION}
    Run Keyword If  ${status}  Click  &{SETTINGS_WIFI_OPTION}
    ...  ELSE  FAIL  Wifi Option Not visible
    BuiltIn.sleep  3

Turn WiFi Radio On And Off
# [Documentation]  As per test plan, it switches ON Wifi, waits for 10 seconds and then switches it OFF
    Switch On WiFi Radio Button
    Log To Console  Waiting for 10 seconds
    BuiltIn.sleep  10
    Switch Off WiFi Radio Button

Switch On WiFi Radio Button
    Log To Console  Verifying whether WiFi Radio Button is ON
    Open WiFi From Settings
    Wait For Exists  &{SETTINGS_WIFI_SWITCH}
    ${switch_obj}  Get Object  &{SETTINGS_WIFI_SWITCH}
    ${switch_info}  Get Info Of Object  ${switch_obj}
    # Log  ${switch_info}
    # Log to console  ${switch_info}[enabled]
    Run Keyword If  '${switch_info}[checked]'== 'True'  Run Keywords
    ...  Log To Console  Switch Is On  AND
    ...  Return From Keyword
    Run Keyword If  '${switch_info}[checked]'== 'False'   Run keywords
    ...  Log To Console  Switch Is Off, Switching It ON  AND
    ...  Click  &{SETTINGS_WIFI_SWITCH}
    # ...  Click  text=Wi-Fi

Switch Off WiFi Radio Button
    Log To Console  Verifying whether WiFi Radio Button is OFF
    Open WiFi From Settings
    BuiltIn.sleep  3
    ${switch_obj}  Get Object  &{SETTINGS_WIFI_SWITCH}
    ${switch_info}  Get Info Of Object  ${switch_obj}
    Run Keyword If  '${switch_info}[checked]'== 'False'  Log To Console  Switch Is Off
    Run Keyword If  '${switch_info}[checked]'== 'True'   Run keywords
    ...  Log To Console  Switch Is On, Switching It Off  AND
    ...  Click  &{SETTINGS_WIFI_SWITCH}

Connect And Disconnect To WiFi Network
#######  Made changes on 20th oct
    # Connect To Particular WiFi  ${WIFI_NETWORK_AVAILABLE}  ${WIFI_NETWORK_AVAILABLE_PASSWORD}
    Switch On WiFi Radio Button
    Log to Console  Waiting for 20 seconds
    BuiltIn.Sleep  20
    # Repeat Keyword  4  Press Back
    # Disconnect From Particular WiFi  ${WIFI_NETWORK_AVAILABLE}
    Switch Off WiFi Radio Button

# Connect To Particular WiFi
#     [Arguments]  ${wifi_available_name}  ${wifi_password}
#     Open WiFi From Settings
#     Switch On WiFi Radio Button
#     BuiltIn.Sleep  2
#     Log To Console  Connecting to Particular WIFI network
#     Scroll To Beginning Vertically
#     # &{wifi_name_dict}  Create Dictionary  text=${wifi_available_name}\nSignal level: 5/5
#     &{wifi_name_dict}  Create Dictionary  text=${wifi_available_name}
#     ${status}  Wait For Exists  timeout=2000  &{wifi_name_dict}
#     Run Keyword If  ${status}  Click  &{wifi_name_dict}
#     Run Keyword Unless  ${status}  Run Keywords
#     ...  Scroll Vertically To Object  &{wifi_name_dict}  AND
#     ...  Click  &{wifi_name_dict}
#     # ${status}  Wait For Exists  timeout=7000  &{WIFI_PASSWORD_TEXTFIELD}
#     ${status}  Wait For Exists  textContains=Forget
#     Run Keyword If  ${status}  Run Keywords
#     ...  Log To Console  Already connected to the network  AND
#     ...  Press Back

#     Run Keyword Unless  ${status}  Execute Adb Shell Command  am broadcast -a com.facebook.wearable.system.keyboard.REQUEST_INPUT -e android.intent.extra.TEXT ${wifi_password}
#     # Run Keyword Unless  ${status}  FAIL  Unable to click on WiFi Network
#     BuiltIn.Sleep  5
#     # Click  text=CONNECT

Connect To Particular WiFi
###  KEYWORD for v9
    [Arguments]  ${wifi_available_name}  ${wifi_password}
    Open WiFi From Settings
    Switch On WiFi Radio Button
    BuiltIn.Sleep  2
    Log To Console  Connecting to Particular WIFI network
    Scroll To Beginning Vertically
    # &{wifi_name_dict}  Create Dictionary  text=${wifi_available_name}\nSignal level: 5/5
    &{wifi_name_dict}  Create Dictionary  text=${wifi_available_name}
    ${status}  Wait For Exists  timeout=2000  &{wifi_name_dict}
    Run Keyword If  ${status}  Click  &{wifi_name_dict}
    Run Keyword Unless  ${status}  Run Keywords
    ...  Scroll Vertically To Object  &{wifi_name_dict}  AND
    ...  Click  &{wifi_name_dict}
    # ${status}  Wait For Exists  timeout=7000  &{WIFI_PASSWORD_TEXTFIELD}
    ${status}  Wait For Exists  textContains=Forget
    Run Keyword If  ${status}  Run Keywords
    ...  Log To Console  Already connected to the network  AND
    ...  Press Back

    Run Keyword Unless  ${status}  Execute Adb Shell Command  am broadcast -a com.facebook.wearable.system.keyboard.REQUEST_INPUT -e android.intent.extra.TEXT ${wifi_password}
    # Run Keyword Unless  ${status}  FAIL  Unable to click on WiFi Network
    BuiltIn.Sleep  5
    # Click  text=CONNECT

Disconnect From Particular WiFi
    [Arguments]  ${wifi_available_name}
    Open WiFi From Settings
    # Switch On WiFi Radio Button
    Log To Console  Disconnecting From Particular WIFI network
    Scroll To Beginning Vertically
    # &{wifi_name_dict}  Create Dictionary  text=${wifi_available_name}\nSignal level: 5/5
    &{wifi_name_dict}  Create Dictionary  text=${wifi_available_name}
    ${status}  Wait For Exists  timeout=2000  &{wifi_name_dict}
    Run Keyword If  ${status}  Click  &{wifi_name_dict}
    Run Keyword Unless  ${status}  Run Keywords
    ...  Scroll Vertically To Object  &{wifi_name_dict}  AND
    ...  Click  &{wifi_name_dict}
    BuiltIn.Sleep  3
   ${status}  Wait For exists  timeout=5  textContains=Forget
   Run Keyword If  ${status}  Click  textContains=Forget
   ...  ELSE  Log To Console  Already disconnected from network

Turn ON Airplane Mode ON and OFF
    Switch On Airplane mode Radio Button
    Log To Console  Waiting for 10 seconds
    BuiltIn.sleep  10
    Switch Off Airplane mode Radio Button

Switch On Airplane mode Radio Button
    Log To Console  Verifying whether Airplane Radio Button is ON
    # Open WiFi From Settings
    Open MOS Settings
    ${status}  Wait For Exists  5  &{NETWORK_AND_INTERNET_DICT}
    Run Keyword If  ${status}  Click  &{NETWORK_AND_INTERNET_DICT}
    BuiltIn.sleep  3
    Wait For Exists  &{SETTINGS_AIRPLANE_SWITCH}
    ${switch_obj}  Get Object  &{SETTINGS_AIRPLANE_SWITCH}
    ${switch_info}  Get Info Of Object  ${switch_obj}
    # Log  ${switch_info}
    # Log to console  ${switch_info}[enabled]
    Run Keyword If  '${switch_info}[checked]'== 'True'  Run Keywords
    ...  Log To Console  Switch Is On  AND
    ...  Return From Keyword
    Run Keyword If  '${switch_info}[checked]'== 'False'   Run keywords
    ...  Log To Console  Switch Is Off, Switching It ON  AND
    ...  Click  &{SETTINGS_AIRPLANE_SWITCH}
    # ...  Click  text=Wi-Fi

Switch Off Airplane mode Radio Button
    Log To Console  Verifying whether Airplane Radio Button is OFF
    # Open WiFi From Settings
    Open MOS Settings
    ${status}  Wait For Exists  5  &{NETWORK_AND_INTERNET_DICT}
    Run Keyword If  ${status}  Click  &{NETWORK_AND_INTERNET_DICT}
    BuiltIn.sleep  3
    BuiltIn.sleep  3
    ${switch_obj}  Get Object  &{SETTINGS_AIRPLANE_SWITCH}
    ${switch_info}  Get Info Of Object  ${switch_obj}
    Run Keyword If  '${switch_info}[checked]'== 'False'  Log To Console  Switch Is Off
    Run Keyword If  '${switch_info}[checked]'== 'True'   Run keywords
    ...  Log To Console  Switch Is On, Switching It Off  AND
    ...  Click  &{SETTINGS_AIRPLANE_SWITCH}


Open Cellular From Settings
    Open MOS Settings
    ${status}  Wait For Exists  5  &{NETWORK_AND_INTERNET_DICT}
    Run Keyword If  ${status}  Click  &{NETWORK_AND_INTERNET_DICT}
    BuiltIn.sleep  3
    # Scroll To End Vertically
    ${status}  Wait For Exists  5  &{SETTINGS_CELLULAR_BUTTON}
    Run Keyword If  ${status}  Run Keywords
    ...  Click  &{SETTINGS_CELLULAR_BUTTON}  AND
    ...  Return From Keyword
    Run Keyword Unless  ${status}  scroll_vertically_to_object  &{SETTINGS_CELLULAR_BUTTON}
    ${status}  Wait For Exists  5  &{SETTINGS_CELLULAR_BUTTON}
    Run Keyword If  ${status}  Click  &{SETTINGS_CELLULAR_BUTTON}
    ...  ELSE  FAIL  Cellular Option Not visible
    BuiltIn.sleep  3


Turn Cellular Radio On And Off
    Switch On Cellular mode Radio Button
    Log To Console  Waiting for 10 seconds
    BuiltIn.sleep  10
    Switch Off Cellular mode Radio Button

Switch On Cellular mode Radio Button
    Log To Console  Verifying whether Cellular Radio Button is ON
    Open Cellular From Settings
    Wait For Exists  &{SETTINGS_CELLULAR_SWITCH}
    ${switch_obj}  Get Object  &{SETTINGS_CELLULAR_SWITCH}
    ${switch_info}  Get Info Of Object  ${switch_obj}
    # Log  ${switch_info}
    # Log to console  ${switch_info}[enabled]
    Run Keyword If  '${switch_info}[checked]'== 'True'  Run Keywords
    ...  Log To Console  Switch Is On  AND
    ...  Return From Keyword
    Run Keyword If  '${switch_info}[checked]'== 'False'   Run keywords
    ...  Log To Console  Switch Is Off, Switching It ON  AND
    ...  Click  &{SETTINGS_CELLULAR_SWITCH}
    # ...  Click  text=Wi-Fi

Switch Off Cellular mode Radio Button
    Log To Console  Verifying whether Cellular Radio Button is OFF
    Open Cellular From Settings
    BuiltIn.sleep  3
    ${switch_obj}  Get Object  &{SETTINGS_CELLULAR_SWITCH}
    ${switch_info}  Get Info Of Object  ${switch_obj}
    Run Keyword If  '${switch_info}[checked]'== 'False'  Log To Console  Switch Is Off
    Run Keyword If  '${switch_info}[checked]'== 'True'   Run keywords
    ...  Log To Console  Switch Is On, Switching It Off  AND
    ...  Click  &{SETTINGS_CELLULAR_SWITCH}


