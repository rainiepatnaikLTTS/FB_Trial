*** Settings ***

Library             cogmationlibrary
Library             Dialogs
Resource            ${EXECDIR}/Res/Android/GenericFunction.robot
Resource            ${EXECDIR}/Res/Android/PhoneFunction.robot
Variables           ${EXECDIR}/VariableFiles/Android/Config.py

# Resource            /Res/Android/PhoneFunction.robot
# Resource            /Res/Android/GenericFunction.robot

*** Keywords ***
Contacts Suite Setup
    FOR  ${index}  IN  @{CONTACT_NAME_LIST}
        Create New Contact  ${index}  ${PARTNER_DEVICE_PHONENUMBER}
    END

Contacts Suite Teardown
    Delete All Contacts

Launch Contacts App
    Execute Adb Shell Command  am start -n ${CONTACTS_APP_PACKAGE}
    BuiltIn.Sleep  3s  For Page to load successfully
    ${status}  Wait For Exists  timeout=2000  &{CONTACTS_CREATE_NEW_CONTACT_BUTTON}
    Run Keyword Unless  ${status}  Fail  Contact App not launched successfully. Unable to detect new contact button on UI

Create New Contact
    [Arguments]  ${contact_name}  ${contact_number}
    Launch Contacts App
    ${status}  Wait For Exists  timeout=2000  &{CONTACTS_CREATE_NEW_CONTACT_BUTTON}
    Run Keyword If  ${status}  Click  &{CONTACTS_CREATE_NEW_CONTACT_BUTTON}
    ...  ELSE  Fail  Unable to detect new contact button on UI
    ${status}  Wait For Exists  timeout=2000  &{CONTACTS_FIRST_NAME_FIELD}
    Run Keyword If  ${status}  Set Text  ${contact_name}  &{CONTACTS_FIRST_NAME_FIELD}
    ...  ELSE  Fail  Unable to detect first name field on UI
    ${object}  Get Object  &{CONTACTS_PHONE_NUMBER_FIELD}
    ${status}  Scroll To Vertically  ${object}
    ${status}  Wait For Exists  timeout=2000  &{CONTACTS_PHONE_NUMBER_FIELD}
    Run Keyword If  ${status}  Set Text  ${contact_number}  &{CONTACTS_PHONE_NUMBER_FIELD}
    ...  ELSE  Fail  Unable to detect phone number field on UI
    ${status}  Wait For Exists  timeout=2000  &{CONTACTS_SAVE_CONTACT_BUTTON}
    Run Keyword If  ${status}  Click  &{CONTACTS_SAVE_CONTACT_BUTTON}
    ...  ELSE  Fail  Unable to detect Contact Save Button option on UI
    ${status}  Wait For Exists  timeout=2000  &{CONTACTS_EDIT_CONTACT_BUTTON}
    Run Keyword If  ${status}  Log  Contact Saved Successfully
    ...  ELSE  Fail  Unable to save contact successfully
    Repeat Keyword  3  Press Back

Delete All Contacts
    Launch Contacts App
    ${status}  Wait For Exists  timeout=2000  &{CONTACTS_MORE_OPTIONS_DOTS}
    Run Keyword If  ${status}  Click  &{CONTACTS_MORE_OPTIONS_DOTS}
    ...  ELSE  Fail  Unable to detect More option (Three dots)
    ${status}  Wait For Exists  timeout=2000  &{CONTACTS_SELECT_ALL_OPTION_TEXT}
    Run Keyword If  ${status}  Click  &{CONTACTS_SELECT_ALL_OPTION_TEXT}
    ...  ELSE  Fail  Unable to detect Select All option
    ${status}  Wait For Exists  timeout=2000  &{CONTACTS_DELETE_OPTION}
    Run Keyword If  ${status}  Click  &{CONTACTS_DELETE_OPTION}
    ...  ELSE  Fail  Unable to detect Delete Icon
    ${status}  Wait For Exists  timeout=2000  &{CONTACTS_CONFIRM_DELETE_OPTION}
    Run Keyword If  ${status}  Click  &{CONTACTS_CONFIRM_DELETE_OPTION}
    ...  ELSE  Fail  Unable to detect Confirm delete option
    BuiltIn.Sleep  5s  For Page to load successfully
    ${status}  Wait For Exists  timeout=2000  &{CONTACTS_CREATE_NEW_CONTACT_BUTTON}
    Run Keyword Unless  ${status}  Fail  Unable to detect new message button on UI
    Repeat Keyword  3  Press Back

Delete Contact
    [Arguments]  ${contact_name}
    Launch Contacts App
    ${status}  Wait For Exists  timeout=2000  &{CONTACTS_SEARCH_FIELD}
    Run Keyword If  ${status}  Click  &{CONTACTS_SEARCH_FIELD}
    ...  ELSE  Fail  Unable to detect contact by name "${contact_name}" in Contacts App
    ${status}  Wait For Exists  timeout=2000  &{CONTACTS_SEARCH_EDIT_FIELD}
    Run Keyword If  ${status}  Set Text  ${contact_name}  &{CONTACTS_SEARCH_EDIT_FIELD}
    ...  ELSE  Fail  Unable to detect first name field on UI
    ${status}  Wait For Exists  timeout=2000  description=${contact_name}
    Run Keyword If  ${status}  Click  description=${contact_name}
    ...  ELSE  Fail  Unable to detect contact by name "${contact_name}" in Contacts App
    ${status}  Wait For Exists  timeout=2000  &{CONTACTS_MORE_OPTIONS_DOTS}
    Run Keyword If  ${status}  Click  &{CONTACTS_MORE_OPTIONS_DOTS}
    ...  ELSE  Fail  Unable to detect More option (Three dots)
    ${status}  Wait For Exists  timeout=2000  &{CONTACTS_DELETE_STRING_OPTION}
    Run Keyword If  ${status}  Click  &{CONTACTS_DELETE_STRING_OPTION}
    ...  ELSE  Fail  Unable to detect delete option
    ${status}  Wait For Exists  timeout=2000  &{CONTACTS_CONFIRM_DELETE_OPTION}
    Run Keyword If  ${status}  Click  &{CONTACTS_CONFIRM_DELETE_OPTION}
    ...  ELSE  Fail  Unable to detect Confirm delete option
    Repeat Keyword  3  Press Back

Initiate Call From Contact Phonebook
    [Arguments]  ${contact_name}
    Launch Contacts App
    ${object}  Get Object  text=${contact_name}
    Log To Console  Calling ${contact_name}
    Log  Calling ${contact_name}
    # ${status}  Scroll To Vertically  ${object}   #not working
    # ${status}  Scroll Vertically To Object  ${object}   #not working
    # ${status}  Scroll Forward To Object  ${object}   #not working
    ${status}  Wait For Exists  timeout=3000  &{CONTACTS_SEARCH_FIELD}
    Run Keyword If  ${status}  Click  &{CONTACTS_SEARCH_FIELD}
    ...  ELSE  Fail  Unable to detect contact by name "${contact_name}" in Contacts App
    ${status}  Wait For Exists  timeout=3000  &{CONTACTS_SEARCH_EDIT_FIELD}
    Run Keyword If  ${status}  Set Text  ${contact_name}  &{CONTACTS_SEARCH_EDIT_FIELD}
    ...  ELSE  Fail  Unable to detect first name field on UI
    ${status}  Wait For Exists  timeout=3000  description=${contact_name}
    Run Keyword If  ${status}  Click  description=${contact_name}
    ...  ELSE  Fail  Unable to detect contact by name "${contact_name}" in Contacts App
    ${status}  Wait For Exists  timeout=3000  &{CONTACTS_CONTACT_MOBILE_OPTION}
    Run Keyword If  ${status}  Click  &{CONTACTS_CONTACT_MOBILE_OPTION}
    ...  ELSE  Fail  Unable to fetch any Mobile string on Contact Screen
    ${status}  Wait For Exists  timeout=5000  &{PHONE_END_CALL_ICON}
    Run Keyword Unless  ${status}  Fail  Unable to loacte End Call button on UI

Establish Call Connectivity From Contact Phonebook
    [Arguments]  ${contact_name}
    Set Serial  ${TEST_DEVICE}
    Initiate Call From Contact Phonebook  ${contact_name}
    BuiltIn.Sleep  5s  For Call Duration
    # Set Serial  ${PARTNER_DEVICE}
    # Recieve Phone Call
    [Teardown]  Handle Teardown For Call Connectivity

Add Particular Contacts To Phonebook
    [Arguments]  ${ITERATION_COUNTER}
    Log  ${ITERATION_COUNTER}
    ${ITERATION_COUNTER}  Evaluate  ${ITERATION_COUNTER}-1
    Log  ${CONTACT_NAME_LIST_20}[${ITERATION_COUNTER}]
    Log to Console  Creating Contact: ${CONTACT_NAME_LIST_20}[${ITERATION_COUNTER}]
    Create New Contact  ${CONTACT_NAME_LIST_20}[${ITERATION_COUNTER}]  ${SAMPLE_CONTACT_PHONENUMBER}

Delete Contact From Phonebook
    [Arguments]  ${ITERATION_COUNTER}
    Log  ${ITERATION_COUNTER}
    ${ITERATION_COUNTER}  Evaluate  ${ITERATION_COUNTER}-1
    Log  ${CONTACT_NAME_LIST_20}[${ITERATION_COUNTER}]
    Log to Console  Deleting Contact: ${CONTACT_NAME_LIST_20}[${ITERATION_COUNTER}]
    Delete Contact  ${CONTACT_NAME_LIST_20}[${ITERATION_COUNTER}]

Call Connectivity From Contact Phonebook
    # Set Serial  ${TEST_DEVICE}
    Launch Contacts App
    Initiate Call From Contact Phonebook
    # Set Serial  ${PARTNER_DEVICE}
    # Recieve Phone Call
    ${status}  Wait For Exists  timeout=7000  &{PHONE_END_CALL_ICON}
    Run Keyword If  ${status}  Click  &{PHONE_END_CALL_ICON}
    ...  ELSE  Fail  Unable to disconnect the Call
