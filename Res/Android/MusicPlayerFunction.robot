*** Settings ***

Library             cogmationlibrary
Library             Dialogs
Resource            ${EXECDIR}/Res/Android/GenericFunction.robot
Variables           ${EXECDIR}/VariableFiles/Android/Config.py


*** Keywords ***

Launch Music Player App
    Repeat Keyword  4  Press Back
    Press Home
    # BuiltIn.Sleep  2s
    Scroll Vertically To Object  &{SPOTIFY_APP}
    BuiltIn.Sleep  2s
    Click  &{SPOTIFY_APP}
    Wait For exists  timeout=15000  &{MUSIC_PLAYER_PAUSE_BTN}
    # BuiltIn.Sleep  10s  For Page to load successfully
    Verify Particular App Is Launched  &{MUSIC_PLAYER_PAUSE_BTN}

Check Pairing Of Music Player
    Repeat Keyword  4  Press Back
    Press Home
    BuiltIn.Sleep  2s
    Scroll Vertically To Object  &{SPOTIFY_APP}
    BuiltIn.Sleep  2s
    Click  &{SPOTIFY_APP}
    Log To Console  Checking if Spotify is paired
    ${status}  Wait For exists  timeout=10  textContains=spotify.com/pair
    Run keyword if  ${status}  FAIL  Spotify Pairing is not done
    ...  ELSE  Log To console  Spotify is Paired

Music Player Iteration Setup
    Check Pairing Of Music Player

Open And Close Music Player
    # Execute Adb Shell Command  input keyevent KEYCODE_HOME
    # BuiltIn.Sleep  3s  For Page to load successfully
    Launch Music Player App
    # BuiltIn.Sleep  3s
    ${status}  Wait For Exists  10  &{MUSIC_PLAYER_PAUSE_BTN}
    Close Particular App  ${MUSIC_PLAYER_PACKAGE}

Open Music Player Play Device Music and Play Next
    # Execute Adb Shell Command  input keyevent KEYCODE_HOME
    # BuiltIn.Sleep  3s  For Page to load successfully
    # Press Back
    # Press Home
    # BuiltIn.Sleep  2s
    # Scroll Vertically To Object  &{SPOTIFY_APP}
    # BuiltIn.Sleep  2s
    # Click  &{SPOTIFY_APP}
    # BuiltIn.Sleep  10
    # Verify Particular App Is Launched  &{MUSIC_PLAYER_MUSICLIBRARY}
    Launch Music Player App
    ${status}  Wait For Exists  5  &{MUSIC_PLAYER_PAUSE_BTN}
    Run Keyword If  ${status}  Click  &{MUSIC_PLAYER_PAUSE_BTN}
    Run Keyword Unless  ${status}  FAIL  Not able to get Play/Pause button
    Log To Console  Music has started to play
    BuiltIn.Sleep  15
    Log to console  Switching to next song
    Click  &{MUSIC_PLAYER_PLAY_NEXT_MUSIC}

Sample Test Open Music Player Play Device Music and Play Next
    Launch Music Player App
    ${status}  Wait For Exists  5  &{MUSIC_PLAYER_PAUSE_BTN}
    Run Keyword If  ${status}  Click  &{MUSIC_PLAYER_PAUSE_BTN}
    Run Keyword Unless  ${status}  FAIL  Not able to get Play/Pause button
    Log To Console  Music has started to play
    BuiltIn.Sleep  15
    Log to console  Switching to next song
    Click  &{MUSIC_PLAYER_PLAY_NEXT_MUSIC}


Give Permission To YouTube Music App
    Launch Particular App  ${SETTINGS_APP_PACKAGE}
    Verify Particular App Is Launched  ${SETTINGS_SEARCH_SETTINGS}
    ${status}  Wait For Exists  &{SETTINGS_SEARCH_SETTINGS}
    Run keyword if  ${status}  Click  &{SETTINGS_SEARCH_SETTINGS}
    ...  ELSE  FAIL  Couldn't click on Search Settings
    BuiltIn.sleep  2
    Log To Console  Searching for YouTube Music
    Adb Input Text  ${MUSIC_PLAYER_APP_NAME}
    Click  text=App info
    Click  text=Permissions
    Click  &{SETTINGS_MORE_OPTIONS}
    Click  text=All permissions
    Repeat Keyword  6  Press Back

Video Streaming Using Youtube
    Launch Webpage  url=${YOUTUBE_URL_PLAY_VIDEO}  locator=description  element=${WEBPAGE_URL_IDENTIFIER_LIST}[3]
    BuiltIn.Sleep  2
    Log To Console  User is clicking on youtube player

Close Music Player
    Close Particular App  ${MUSIC_PLAYER_PACKAGE}

Music Play Pause
    Launch Particular App  ${MUSIC_PLAYER_PACKAGE_ACTIVITY}
    BuiltIn.Sleep  10
    Verify Particular App Is Launched  &{MUSIC_PLAYER_PAUSE_BTN}
    ${status}  Wait For Exists  5  &{MUSIC_PLAYER_PAUSE_BTN}
    Run Keyword If  ${status}  Click  &{MUSIC_PLAYER_PAUSE_BTN}
    Run Keyword Unless  ${status}  FAIL  Not able to get Play/Pause button
    Log To Console  Music has started to play