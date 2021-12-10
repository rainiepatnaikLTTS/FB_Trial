*** Settings ***

Library             cogmationlibrary
Library             OperatingSystem
Variables           ${EXECDIR}/VariableFiles/Android/Config.py

*** Keywords ***
Open Calendar App
    Execute Adb Shell Command  am start -n ${CALENDAR_APP_PACKAGE}
    ${status}  Wait For Exists  timeout=5000  &{CREATE_EVENT_DICT}
    Run Keyword If  ${status}  Log To Console  Calendar app is launched
    ${status}  Wait For Exists  5  &{CALENDAR_JUMP_TODAY}
    Run Keyword If  ${status}  Click  &{CALENDAR_JUMP_TODAY}
    Run Keyword Unless  ${status}  FAIL  Unable to Open Calendar app
    BuiltIn.sleep  3

Open Alarm App
    Execute Adb Shell Command  am start -n ${ALARM_APP_PACKAGE}
    ${status}  Wait For Exists  5  &{ALARM_BUTTON}
    # Run Keyword If  ${status}  Click  &{ALARM_BUTTON}
    Run Keyword If  ${status}  Log To Console  Alarm app is launched
    Run Keyword Unless  ${status}  FAIL  Unable to Open Alarm app
    BuiltIn.sleep  3

Open Contacts App
    Execute Adb Shell Command  am start -n ${CONTACTS_APP_PACKAGE}
    ${status}  Wait For Exists  5  &{CONTACTS_APP_NAME_DICT}
    Run Keyword If  ${status}  Log To Console  Contacts app is launched
    Run Keyword Unless  ${status}  FAIL  Unable to Open Contacts app
    BuiltIn.sleep  3

Set an Alarm
    Open Alarm App
    ${status1}  Wait For Exists  timeout=5000  &{ALARM_BUTTON}
    Run Keyword If  ${status1}  Click  &{ALARM_BUTTON}
    ${status2}  Wait For Exists  timeout=5000  &{CREATE_ALARM}
    Run Keyword If  ${status2}  Click  &{CREATE_ALARM}
    Run Keyword Unless  ${status2}  FAIL  Unable Set an Alarm
    ${status3}  Wait For Exists  timeout=5000  &{ALARM_LIST}
    Run Keyword If  ${status3}  Log To Console  Alarm is set successfully
    Run Keyword Unless  ${status3}  FAIL  Unable Set an Alarm
    [Teardown]  Repeat Keyword  3  Press Back

Delete an Alarm
    Open Alarm App
    # BuiltIn.Sleep  3s
    # Scroll To End Vertically
    # Click  &{EDIT_ALARMS_BUTTON}
    ${status}  Wait For Exists  timeout=5000  &{ALARM_LIST}
    Run Keyword If  ${status}  Click  &{ALARM_LIST}
    Scroll To End Vertically
    ${status}  Wait For Exists  timeout=2000  &{ALARM_DELETE_BUTTON}
    Run Keyword If  ${status}  Click  &{ALARM_DELETE_BUTTON}
    # ${status}  Wait For Exists  timeout=2000  &{ALARM_DELETE_CONFIRM}
    # Run Keyword If  ${status}  Click  &{ALARM_DELETE_CONFIRM}
    ...  ELSE  Fail  Unable to detect any alarm


Create Appointment
    [Arguments]  ${Date_Index}
    Open Calendar App
    ${status}  Wait For Exists  timeout=5000  &{CALENDAR_SETTINGS_DRAWER}
    Run Keyword If  ${status}  Click  &{CALENDAR_SETTINGS_DRAWER}
    ...  ELSE  Fail  Unable to open calendar Settings
    ${status}  Wait For Exists  timeout=3000  &{CALENDAR_DRAWER_MONTH}
    Run Keyword If  ${status}  Click  &{CALENDAR_DRAWER_MONTH}
    ${status}  Wait For Exists  timeout=3000  index=${Date_Index}
    Run Keyword If  ${status}  Click  index=${Date_Index}
    ${status}  Wait For Exists  timeout=3000  &{CREATE_EVENT_DICT}
    Run Keyword If  ${status}  Click  &{CREATE_EVENT_DICT}
    ${status}  Wait For Exists  timeout=3000  &{CALENDAR_CREATE_EVENT}
    Run Keyword If  ${status}  Click  &{CALENDAR_CREATE_EVENT}
    ${status}  Wait For Exists  timeout=3000  &{CALENDAR_EVENT_ALLDAY}
    Run Keyword If  ${status}  Click  &{CALENDAR_EVENT_ALLDAY}
    ${status}  Wait For Exists  timeout=3000  &{CALENDAR_EVENT_SAVE}
    Run Keyword If  ${status}  Click  &{CALENDAR_EVENT_SAVE}
    ${status}  Wait For Exists  5  &{CALENDAR_JUMP_TODAY}
    Run Keyword If  ${status}  Click  &{CALENDAR_JUMP_TODAY}
    ...  ELSE  Fail  Unable To Create New Event
    [Teardown]  Repeat Keyword  3  Press Back


Delete Appointment
    [Arguments]  ${Date_Index}
    Open Calendar App
    ${status}  Wait For Exists  timeout=5000  &{CALENDAR_SETTINGS_DRAWER}
    Run Keyword If  ${status}  Click  &{CALENDAR_SETTINGS_DRAWER}
    ...  ELSE  Fail  Unable to open calendar Settings
    ${status}  Wait For Exists  timeout=3000  &{CALENDAR_DRAWER_MONTH}
    Run Keyword If  ${status}  Click  &{CALENDAR_DRAWER_MONTH}
    ${status}  Wait For Exists  timeout=3000  index=${Date_Index}
    Run Keyword If  ${status}  Click  index=${Date_Index}
    ${status}  Wait For Exists  timeout=3000  &{CALENDAR_EVENT_NAME}
    Run Keyword If  ${status}  Click  &{CALENDAR_EVENT_NAME}
    ...  ELSE  Fail  Unable to open event
    ${status}  Wait For Exists  timeout=3000  &{CALENDAR_EVENT_MORE_OPTIONS}
    Run Keyword If  ${status}  Click  &{CALENDAR_EVENT_MORE_OPTIONS}
    ${status}  Wait For Exists  timeout=3000  &{CALENDAR_EVENT_DELETE_OPTION}
    Run Keyword If  ${status}  Click  &{CALENDAR_EVENT_DELETE_OPTION}
    ...  ELSE  Fail  Unable to delete an event
    ${status}  Wait For Exists  timeout=3000  &{CALENDAR_EVENT_DELETE_CONFIRM}
    Run Keyword If  ${status}  Click  &{CALENDAR_EVENT_DELETE_CONFIRM}
    ...  ELSE  Fail  Unable to delete an event

Add Appointment To Calendar
    [Arguments]  ${ITERATION_COUNTER}
    Log  ${ITERATION_COUNTER}
    ${ITERATION_COUNTER}  Evaluate  ${ITERATION_COUNTER}-1
    Log  ${CALENDAR_DATE_INDEX}[${ITERATION_COUNTER}]
    Log to Console  Adding: ${CALENDAR_DATE_INDEX}[${ITERATION_COUNTER}]
    Create Appointment  ${CALENDAR_DATE_INDEX}[${ITERATION_COUNTER}]

Delete Appointment In Calendar
    [Arguments]  ${ITERATION_COUNTER}
    Log  ${ITERATION_COUNTER}
    ${ITERATION_COUNTER}  Evaluate  ${ITERATION_COUNTER}-1
    Log  ${CALENDAR_DATE_INDEX}[${ITERATION_COUNTER}]
    Log to Console  Deleting: ${CALENDAR_DATE_INDEX}[${ITERATION_COUNTER}]
    Delete Appointment  ${CALENDAR_DATE_INDEX}[${ITERATION_COUNTER}]
