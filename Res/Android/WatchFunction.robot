*** Settings ***

Library             cogmationlibrary
Resource            ${EXECDIR}/Res/Android/GenericFunction.robot
Variables           ${EXECDIR}/VariableFiles/Android/Config.py


*** Keywords ***

Change Watch Theme
    Repeat Keyword  4  Press Back
    ${app_name}  Wait For exists  text=Camera
    Run Keyword If  ${app_name}  Press Home
    Long Click  index=2
    # ${status}  Wait for exists  text=Orbit
    # Run Keyword If  ${status}  Run Keywords
    # ...  BuiltIn.Sleep  3  AND
    # ...  Swipe By Coordinates  50  245  456  245  AND   ####change for v9
    # # ...  Swipe Right  AND
    # ...  Return From Keyword
    # Run Keyword Unless  ${status}  Swipe By Coordinates  456  245  50  245    ###Swipe Left
    log to console  Swiping the themes to set
    Swipe By Coordinates  456  245  50  245  ###Swipe Left
    Click  index=2

# Set Default Watch Theme
#     Log To Console  Changing watch theme back to default
#     Repeat Keyword  6  Press Back
#     FOR  ${key}  IN  @{SET_DEFAULT_THEME_DICT.keys()}
#         Log To Console  Checking For Current Theme of Watch
#         Long Click  index=0
#         ${theme_name}  Create Dictionary  text=${key}
#         ${status}  Wait For Exists  &{theme_name}
#         Run Keyword Unless  ${status}  Continue For Loop
#         Run Keyword If  ${status}  Log To Console  Setting theme back to Default
#         ${value}  Get From Dictionary  ${SET_DEFAULT_THEME_DICT}  ${key}
#         log to console  ${key}
#         log to console  ${value}
#         Repeat keyword  ${value}  Swipe By Coordinates  50  245  456  245   ##Swipe Right
#         Click  index=0
#         Return From Keyword
#     END

Change Watch Theme And Set Back To Default
    Change Watch Theme
    # Set Default Watch Theme