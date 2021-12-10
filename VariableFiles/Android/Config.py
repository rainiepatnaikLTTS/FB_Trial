# Device Configuration
TEST_DEVICE= '2748B3DC6M0015'
TEST_DEVICE_PHONENUMBER= '6502859726'
PARTNER_DEVICE= '0B121FDD4006U7'
PARTNER_DEVICE_PHONENUMBER= '6508628633'
BROWSER_TYPE= 'CHROME'

APPIUM_PORT_NUMBER= '4723'
# -------------------------------
# Appium Capabilities
# -------------------------------
APPIUM_URL= 'http://localhost:4723/wd/hub'


# Dashboard and LiveLog Configuration
# -----------------------------------
LOG_FLAG = ['Fatal Exception','Fatal Signal','ANR in']
Iteration_Total = 5

# -------------------------------
# Appium Capabilities
# -------------------------------
APPIUM_URL = ''
PLATFORM_NAME = 'Android'
DEVICE_NAME = ''
PLATFORM_VERSION = '10'
APP_PACKAGE = 'com.android.settings'
APP_ACTIVITY = 'com.android.settings.Settings'
# PARTNER_DEVICE = '182115225D0198'
APPIUM_PORT_NUMBER = '4723'

TEST_EMAIL_ID = 'akshay14031992@gmail.com'
SUPPORT_EMAIL_ID = 'stabilityfb@gmail.com'
# -------------------------------
# Mobile Applications
# -------------------------------


SETTINGS = 'Settings'
EXPECTED_ITERATIONS_SUCCESSFULL = 80
MESSAGING_ITERATIONS_SUCCESSFULL = 95
STOREFRONT_ITERATIONS_SUCCESSFULL = 95
MENUNAV_ITERATIONS_SUCCESSFULL = 99
MULTIMEDIA_ITERATIONS_SUCCESSFULL = 95
WIFI_ITERATIONS_SUCCESSFULL = 99
BROWSER_ITERATIONS_SUCCESSFULL = 95
EMAIL_ITERATIONS_SUCCESSFULL = 95
TELEPHONY_ITERATIONS_SUCCESSFULL = 95
MULTITASKING_ITERATIONS_SUCCESSFULL = 99
PIM_ITERATIONS_SUCCESSFULL = 99

ITERATION_COUNT_300 = 300
ITERATION_COUNT_200 = 200
ITERATION_COUNT_150 = 150
ITERATION_COUNT_100 = 100
ITERATION_COUNT_80 = 80
ITERATION_COUNT_50 = 50
ITERATION_COUNT_40 = 40
ITERATION_COUNT_25 = 25
ITERATION_COUNT_20 = 20
ITERATION_COUNT_10 = 10
ITERATION_COUNT_05 = 5
ITERATION_COUNT_01 = 1
ITERATION_COUNT_02 = 2


# ITERATION_COUNT_300 =1
# ITERATION_COUNT_200 =1
# ITERATION_COUNT_150 =1
# ITERATION_COUNT_100 =1
# ITERATION_COUNT_80 = 1
# ITERATION_COUNT_50 = 1
# ITERATION_COUNT_40 = 1
# ITERATION_COUNT_25 = 1
# ITERATION_COUNT_20 = 1
# ITERATION_COUNT_10 = 1
# ITERATION_COUNT_05 = 1
# ITERATION_COUNT_01 = 1
# ITERATION_COUNT_02 = 1

# ----------------------------------------------------------- #
# ---- Generic ---------------------------------------------- #
# ----------------------------------------------------------- #
WLAN_AP_NAME = 'Varuna_B104_2.4GHz'
WLAN_AP_PASSWORD = '13031963'

# WIFI_NETWORK_AVAILABLE = 'lab-t24103779'

# WIFI_NETWORK_AVAILABLE_PASSWORD = '186472ce03c0'

WIFI_NETWORK_AVAILABLE = 'MTBF_Lab'

WIFI_NETWORK_AVAILABLE_PASSWORD = '123456789'

WIFI_SWITCH_OFF_VERIFIER = {'text':'When Wi-Fi is off, your data may be affected.'}


ANDROID_TITLE = {'resourceId': 'android:id/title'}
ANDROID_SUMMARY = {'resourceId': 'android:id/summary'}
ANDROID_SWITCH = {'resourceId': 'android:id/switch_widget'}
OK_BUTTON = {'text': 'OK'}

CLEAR_ALL = {'text' : 'Clear all'}
RUNNING_TASKS = {'resourceId' : 'com.google.android.apps.nexuslauncher:id/snapshot'}
NO_RECENT_ITEMS = {'description' : 'No recent items'}
SCROLLABLE_VIEW = {'className' : 'android.widget.ListView'}

# ----------------------------------------------------------- #
# ---- Settings --------------------------------------------- #
# ----------------------------------------------------------- #
SETTINGS_APP_NAME_DICT = {'text': 'Settings'}

SETTINGS_APP_PACKAGE = 'com.facebook.wearable.system.settings/com.facebook.wearable.system.settings.SettingsActivity'

SETTINGS_SEARCH_SETTINGS = { 'description': 'Search settings'}

SETTINGS_SEARCH_SETTINGS_BAR = {'resourceId' : 'android:id/search_src_text'}

NETWORK_AND_INTERNET_DICT = {'text': 'Connectivity'}

SETTINGS_DISPLAY = {'text': 'Display'}
MOBILE_NETWORK_DICT = {'text': 'Mobile network'}
# MOBILE_NETWORK_DICT = {'text': 'Mobile'}

ADVANCED_TEXT_DICT = {'text': 'Advanced'}

NETWORK_SELECTION_DICT = {'text': 'Preferred network type', 'resourceId': 'android:id/title'}

SETTINGS_APPS_NOTIFS = {'text': 'Notifications'}

SETTINGS_SOUND = {'text': 'Sounds and haptics'}

SETTINGS_ALL_APPS_TEXT = {'text': 'All apps'}

SETTINGS_APPS_NOTIFS_SCREEN = {'text': 'Notifications'}

SETTINGS_SEARCH_BAR = {'resourceId' : 'com.android.settings:id/search_action_bar'}

SETTINGS_WIFI_STRING = {'text': 'Wi-Fi'}
SETTINGS_WIFI_OPTION = {'text': 'WiFi'}

SETTINGS_APP_UNINSTALL_BTN = {'text': 'UNINSTALL'}

SETTINGS_SWITCH = {'resourceId': 'android:id/switch_widget'}

# SETTINGS_WIFI_SWITCH = {'resourceId': 'com.facebook.wearable.system.settings:id/wifi_switch'}
# SETTINGS_WIFI_SWITCH = {'text':'WiFi','resourceId': 'android:id/switch_widget'}
SETTINGS_WIFI_SWITCH = {'resourceId':'com.facebook.wearable.system.settings:id/toggle'}
SETTINGS_PASSWORD_ENTRY_BOX = {'resourceId': 'com.android.settings:id/password'}
SETTINGS_AP_CONNECT = {'text': 'CONNECT'}
SETTINGS_AP_CONNECTED_TEXT = {'text': 'Connected'}
SETTINGS_AP_FORGET_TEXT = {'text': 'FORGET'}
SETTINGS_ADVANCED_TEXT = {'text': 'Advanced'}
SETTINGS_MOBILE_NETWORK_TEXT = {'text': 'Mobile network'}
SETTINGS_ENHANCED_LTE_TEXT = {'text': 'VoLTE Service'}
SETTINGS_ABOUT_PHONE = {'text': 'About Phone'}
SETTINGS_SIM_STATUS = {'text': 'SIM status'}
SETTINGS_WIFI_CALLING = {'text': 'Wi-Fi Calling'}
SETTINGS_IMS_REG_TEXT = {'text': 'IMS registration state'}
# SETTINGS_IMS_REG_TEXT = {'text': 'Not registered'}
# SETTINGS_IMS_NOT_REG_TEXT = {'text': 'Registered'}
REGISTERED_STRING = 'Not registered'
NOT_REGISTERED_STRING = 'Registered'
SETTINGS_WIFI_PREFERENCES = {'text' : 'Wi‑Fi preferences','resourceId' : 'android:id/title'}

WIFI_PASSWORD_TEXTFIELD = {'text' : 'Password'}
SETTINGS_NETWORK_AUTOMATIC = 'Automatic (LWG)'
SETTINGS_NETWORK_LTE_ONLY = 'LTE only'
SETTINGS_NETWORK_3G_ONLY = '3G only'
SETTINGS_NETWORK_2G_ONLY = '2G only'


SETTINGS_NETWORK_3G = '3G'      
SETTINGS_NETWORK_2G = '2G'          

LTE_VAR = 'LTE'
GSM_VAR = 'EDGE'
WCDMA_VAR = 'UMTS'

ENABLE = True
DISABLE = False

# ----------------------------------------------------------- #
# ---- Phone ------------------------------------------------ #
# ----------------------------------------------------------- #
PHONE_APP_NAME_DICT = {'resourceId': 'com.facebook.wearable.system.launcher:id/keypad_selector'}
PHONE_APP_PACKAGE = 'com.facebook.wearable.system.launcher/com.facebook.wearable.common.comms.calllog.ComposeActivity'  
RECENT_CALLS_NAME = {'text': 'Recent'}  

PHONE_END_INCALL_ICON = {'resourceId': 'com.facebook.wearable.system.launcher:id/decline_button'}      ##########edited######
# PHONE_END_CALL_ICON = {'resourceId': 'com.facebook.wearable.apps.phone:id/close_button'}
PHONE_END_CALL_ICON = {'resourceId': 'com.facebook.wearable.apps.phone:id/control_button_right'}
PHONE_END_CALL_ICON_1 = {'description' : 'End call'}
PHONE_CALLING_STRING = {'text': 'Calling…'}       #########edited########
PHONE_KEYPAD = {'resourceId': 'com.facebook.wearable.apps.phone:id/dialpad'}
PHONE_SPEED_DIAL_ICON = {'text': 'Speed dial'}
PHONE_CALL_HISTORY_ICON = {'description': 'Call History tab.'}
PHONE_CONTACTS_ICON = {'text': 'Contacts'}
PHONE_ENTER_NUMBER_DIGIT_AREA = {'resourceId': 'com.facebook.wearable.apps.phone:id/digits'}
PHONE_ENTER_NUMBER_DIGIT_AREA_CLEAR = {'description': 'backspace'}
PHONE_DIAL_NUMBER_ICON = {'resourceId': 'com.facebook.wearable.apps.phone:id/place_call'}
# PHONE_DIAL_NUMBER_ICON = {'resourceId' : 'com.facebook.wearable.apps.phone:id/pound'}
PHONE_CALL_HISTORY_DIAL_ICON = {'resourceId': 'com.facebook.wearable.system.launcher:id/title_row'}
PHONE_NOTIFICATION_FLANGE_ANSWER = {'text': 'Answer'}
PHONE_ONGOING_CALL = {'text' : 'Ongoing call'}
PHONE_HANG_UP = {'text' : 'Hang up'}
# PHONE_HANG_UP = {'resourceId' : 'com.facebook.wearable.apps.phone:id/close_button'}
PHONE_ACCEPT_BTN = {'resourceId':'com.facebook.wearable.system.launcher:id/accept_button', 'className' : 'android.view.View' , 'index':'5'}
PHONE_ACCEPT_BTN_1 = {'resourceId' : 'com.facebook.wearable.system.launcher:id/accept_button'}
PHONE_KEYPAD_ICON = {'text':'Keypad'}		#'resourceId' : 'ccom.facebook.wearable.system.launcher:id/call_keypad_button'}
PHONE_KEYPAD_ICON_1 = { 'description' : 'key pad'}
PHONE_KEYPAD_ICON_2 = { 'resourceId' : 'com.google.android.dialer:id/dialpad_fab'}
PHONE_ENTER_NUMBER_DIGIT_AREA_1 = {'resourceId' : 'com.google.android.dialer:id/digits'}
PHONE_DIALER = {'description' : 'dial'}
PHONE_DIALER_ACTION_BUTTON = {'resourceId': 'com.facebook.wearable.system.launcher:id/floating_action_button_call'}
PHONE_LAUNCH_DIALPAD = {'resourceId': 'com.facebook.wearable.system.launcher:id/floating_dialpad_button'}
PHONE_POPUP_TEXT_DISMISS = {'text':'Dismiss'}
PHONE_INCOMING_CALL_UI = {'text':'Incoming Call'}
# ----------------------------------------------------------- #
# ---- Contacts --------------------------------------------- #
# ----------------------------------------------------------- #
CONTACTS_APP_NAME_DICT = {'text': 'Contacts'}
CONTACTS_APP_PACKAGE = 'com.android.contacts/com.android.contacts.activities.PeopleActivity'
CONTACT_NAME_LIST = ['Contact One', 'Contact Two', 'Contact Three', 'Contact Four', 'Contact Five', 'Contact Six', 'Contact Seven', 'Contact Eight', 'Contact Nine', 'Contact Ten', 'Contact Eleven', 'Contact Twelve', 'Contact Thirteen', 'Contact Fourteen', 'Contact Fifteen', 'Contact Sixteen', 'Contact Seventeen', 'Contact Eighteen', 'Contact Nineteen', 'Contact Twenty']
CONTACT_NAME_LIST_20 = ['Contact One', 'Contact Two', 'Contact Three', 'Contact Four', 'Contact Five', 'Contact Six', 'Contact Seven', 'Contact Eight', 'Contact Nine', 'Contact Ten', 'Contact Eleven', 'Contact Twelve', 'Contact Thirteen', 'Contact Fourteen', 'Contact Fifteen', 'Contact Sixteen', 'Contact Seventeen', 'Contact Eighteen', 'Contact Nineteen', 'Contact Twenty']
CONTACTS_CREATE_NEW_CONTACT_BUTTON = {'resourceId': 'com.android.contacts:id/floating_action_button'}
CONTACTS_FIRST_NAME_FIELD = {'text': 'First name'}
CONTACTS_LAST_NAME_FIELD = {'text': 'Last name'}
CONTACTS_PHONE_NUMBER_FIELD = {'text': 'Phone'}
CONTACTS_SAVE_CONTACT_BUTTON = {'resourceId': 'com.android.contacts:id/editor_menu_save_button'}
CONTACTS_EDIT_CONTACT_BUTTON = {'resourceId': 'com.android.contacts:id/menu_edit'}
CONTACTS_MORE_OPTIONS_DOTS = {'description': 'More options'}
CONTACTS_SELECT_ALL_OPTION_TEXT = {'text': 'Select all'}
CONTACTS_DELETE_STRING_OPTION = {'text': 'Delete'}
CONTACTS_CONFIRM_DELETE_OPTION = {'text': 'DELETE'}
CONTACTS_DELETE_OPTION = {'resourceId': 'com.android.contacts:id/menu_delete'}
CONTACTS_CONTACT_HEADER_OPTION = {'resourceId': 'com.android.contacts:id/header'}
CONTACTS_CONTACT_MOBILE_OPTION = {'text': 'Mobile'}
CONTACTS_SEARCH_FIELD = {'description': 'Search contacts'}
CONTACTS_SEARCH_EDIT_FIELD = {'resourceId': 'com.android.contacts:id/search_view'}

TEST_CONTACT_FIRSTNAME ='Test1'
TEST_CONTACT_LASTNAME ='Last1'
EXIST_CONTACT_FULL_NAME = {'text': 'Test1 Last1'}
TEST_PHONE_NUMBER ='9490000001'
SAVE_CONTACT_BUTTON ={'text': 'SAVE'}
SAMPLE_CONTACT_PHONENUMBER = '1122112212'
# ----------------------------------------------------------- #
# ---- Message ---------------------------------------------- #
# ----------------------------------------------------------- #
# MESSAGE_CONTENT_0 = 'Message Content 0'
MESSAGE_CONTENT_0 = {'text':'Hello'}
MESSAGE_CONTENT_1 = 'Message Content 1'

MESSAGE_APP_NAME_DICT = {'text': 'Messaging'}

MESSAGE_APP_PACKAGE = 'com.google.android.apps.messaging/com.google.android.apps.messaging.ui.ConversationListActivity' 

MESSAGE_NEW_MESSAGE_CREATE_BTN = {'text': 'Start chat'}

MESSAGE_FROM_IDENTIFIER = {'resourceId': 'com.google.android.apps.messaging:id/start_new_conversation_button'}

MESSAGE_SUBJECT_IDENTIFIER = {'resourceId': 'com.android.mms:id/subject'}

MESSAGE_SELECTION_MENU_TOP = {'resourceId': 'com.android.mms:id/selection_menu'}

MESSAGE_DELETE_OPTION = {'resourceId': 'com.android.mms:id/delete'}

MESSAGE_RECIPIENT_EDITOR_TEXT_BOX = {'resourceId': 'com.google.android.apps.messaging:id/recipient_text_view'}

MESSAGE_MESSAGE_CONTENT_TEXT_BOX = {'resourceId' :'com.google.android.apps.messaging:id/compose_message_text'}

MESSAGE_SEND_MESSAGE_BUTTON = {'resourceId':'com.google.android.apps.messaging:id/send_message_button_icon'}

MESSAGE_SEND_MMS_MESSAGE_BUTTON = {'resourceId':'com.google.android.apps.messaging:id/send_message_button_icon'}

MESSAGE_SEND_MESSAGE_CONFIRM_TEXT = {'resourceId': 'com.android.mms:id/date_view', 'text': 'Now'}

MESSAGE_DELETE_STRING_OPTION = {'text': 'Delete'}

MESSAGE_CONFIRM_DELETE_OPTION = {'text': 'DELETE'}

MESSAGE_ATTACH_ICON = {'resourceId':'com.google.android.apps.messaging:id/plus_button'}


MESSAGE_IMAGE_TYPE_MMS = {'text': 'Pictures'}
MESSAGE_VIDEO_TYPE_MMS = {'text': 'Videos'}
MESSAGE_AUDIO_TYPE_MMS = {'text': 'Audio'}

MESSAGE_ATTACH_SYSTEM_AUDIO = {'text': 'System audio'}
MESSAGE_ATTACH_ANY_SYSTEM_AUDIO = {'resourceId': 'com.android.providers.media:id/checked_text_view'}

###### ---Rainie
MESSAGE_MORE_OPTIONS = {'description' : 'More options'}

MESSAGE_ATTACH_FILE_TEXT = {'text': 'Attach file'}

MESSAGE_ATTACH_FROM_CAM_GALLERY = {'resourceId':'com.google.android.apps.messaging:id/camera_gallery_button'}

MESSAGE_EXPAND_ATTACH_BTNS = {'resourceId':'com.google.android.apps.messaging:id/expand_attach_button'}

MESSAGE_FIRST_MESSAGE = {'resourceId' : 'com.google.android.apps.messaging:id/conversation_text_content'}

MESSAGE_SENT_SMS = {'resourceId' : 'com.google.android.apps.messaging:id/message_text_and_info'}

MESSAGE_FORWARD_OPTION = {'text' : 'Forward'}

MESSAGE_FORWARD_ALERT = {'text' : 'Forward message'}

MESSAGE_FORWARD_CHOOSE_NUMBER = {'resourceId' : 'com.google.android.apps.messaging:id/details_container'}


MESSAGE_APP_PACKAGE_1 = 'com.android.google.apps.messaging'

MESSAGE_TEXT_BOX = {'resourceId':'com.facebook.wearable.system.launcher:id/title_text'}

# ----------------------------------------------------------- #
# ---- File Manager ----------------------------------------- #
# ----------------------------------------------------------- #
FILE_MNGR_MORE_OPTIONS = {'description': 'More options'}
FILE_MNGR_SHOW_INTERNAL_STORAGE = {'text': 'Show internal storage'}
FILE_MNGR_SHOW_ROOTS = {'description': 'Show roots'}
FILE_MNGR_SEARCH_ICON = {'resourceId': 'com.android.documentsui:id/option_menu_search'}
# FILE_MNGR_SEARCH_ICON_TEXT_EDITOR_SPACE = {'resourceId': 'com.android.documentsui:id/search_src_text'}
FILE_MNGR_SEARCH_ICON_TEXT_EDITOR_SPACE = {'resourceId': 'android:id/search_src_text'}  ##rain

FILE_MNGR_LIST_VIEW = {'description': 'List View'}

IMAGE_FILE_NAME_1 = 'SampleImage.jpg'
# IMAGE_FILE_NAME_1 = 'test_image_1.png'
FILE_MNGR_ATTACH_PICTURE_FILE = {'resourceId': 'android:id/title', 'text': IMAGE_FILE_NAME_1}

VIDEO_FILE_NAME_1 = 'Samplevideo.mov'
# VIDEO_FILE_NAME_1 = 'test_video_1.png'
FILE_MNGR_ATTACH_VIDEO_FILE = {'resourceId': 'android:id/title', 'text': VIDEO_FILE_NAME_1}

AUDIO_FILE_NAME_1 = 'SampleAudio.mp3'
FILE_MNGR_ATTACH_AUDIO_FILE = {'resourceId': 'android:id/title', 'text': AUDIO_FILE_NAME_1}

# ----------------------------------------------------------- #
# ---- Mail App --------------------------------------------- #
# ----------------------------------------------------------- #
MAIL_APP_NAME_DICT = {'text': 'Gmail'}
MAIL_APP_PACKAGE = 'com.google.android.gm/com.google.android.gm.ConversationListActivityGmail'

TEST_SUBJECT = 'Sample email'
TEST_BODY = 'This is sample body message for email'
MAIL_MORE_OPTIONS_DOTS = {'description': 'More options'}

MAIL_NEW_MAIL_CREATE_BTN = {'resourceId': 'com.google.android.gm:id/compose_button'}
MAIL_TO_FIELD_TEXT = {'resourceId': 'com.google.android.gm:id/to'}
MAIL_SUBJECT_FIELD_TEXT = {'resourceId': 'com.google.android.gm:id/subject'}
MAIL_BODY_FIELD_TEXT = {'text': 'Compose email'}
MAIL_SEND_MAIL_BUTTON = {'resourceId': 'com.google.android.gm:id/send'}
MAIL_ATTACH_FILE_BUTTON = {'resourceId': 'com.google.android.gm:id/add_attachment'}
MAIL_ATTACH_FILE_TEXT = {'text': 'Attach file'}
MAIL_SENT_CONFIRMATION = {'text': 'Sent', 'resourceId': 'com.google.android.gm:id/description_text'}
MAIL_DISCARD_STRING = {'text': 'Discard'}

MAIL_OPEN_MAIL_WITH_SUBJECT = {'resourceId': 'com.google.android.gm:id/subject', 'text': TEST_SUBJECT}
MAIL_DELETE_ICON = {'resourceId': 'com.google.android.gm:id/delete'}



# ----------------------------------------------------------- #
# ---- Browser App ------------------------------------------ #
# ----------------------------------------------------------- #
BROWSER_APP_NAME_DICT = {'text': 'Chrome'}

BROWSER_APP_PACKAGE = 'com.android.chrome/com.google.android.apps.chrome.Main'

BROWSER_HOME_BUTTON = {'resourceId': 'com.android.chrome:id/home_button'}
BROWSER_TAB_SWITCHER = {'resourceId': 'com.android.chrome:id/tab_switcher_button'}
BROWSER_MORE_OPTIONS_DOTS = {'description': 'More options'}

BROWSER_SEARCH_INPUT_TEXT = {'resourceId': 'com.android.chrome:id/search_box_text'}

BROWSER_SEARCH_INPUT_URL_BAR = {'resourceId': 'com.android.chrome:id/url_bar'}

BROWSER_KEYBOARD_ICON = {'resourceId': 'com.appfour.wearbrowser:id/inputOptionsKeyboardIcon'}

BROWSER_CLOSE_ALL_TABS = {'text': 'Close all tabs'}

BROWSER_NEW_TAB_MENU_OPTION = {'description': 'New tab', 'text': 'New tab'}
BROWSER_NEW_TAB_STRING = {'text': 'New tab'}


WEBPAGE_URL_1 = 'www.att.com'
BROWSER_WEBPAGE_1_IDENTIFIER = 'AT&T home'

WEBPAGE_URL_2 = 'www.yahoo.com'
BROWSER_WEBPAGE_2_IDENTIFIER = 'Yahoo'
BROWSER_WEBPAGE_2_LOCATOR_1 = {'text': 'Mail'}
BROWSER_WEBPAGE_2_LOCATOR_2 = {'text': 'Next'}

APP_NAME_LIST = ['Contacts', 'Messaging', 'Browser', 'Playstore', 'Camera']
APP_NAME_LIST1 = ['Contacts', 'Messaging', 'Telephony', 'Playstore', 'Camera']


WEBPAGE_URL_LIST = ['www.att.com', 'www.yahoo.com', 'www.amazon.com', 'www.youtube.com', 'www.nytimes.com']
WEBPAGE_URL_LOCATOR_LIST = ['description', 'text', 'description', 'description', 'text']
WEBPAGE_URL_IDENTIFIER_LIST = ['AT&T home', 'Yahoo', 'Amazon', 'YouTube', 'Sections Navigation & Search']

SECONDS_30 = 30

# ----------------------------------------------------------- #
# ---- Camera App ------------------------------------------ #
# ----------------------------------------------------------- #

CAMERA_APP_PACKAGE = 'com.facebook.wearable.apps.camera/com.facebook.wearable.apps.camera.CameraActivity'

# CAMERA_IDENTIFIER = {'resourceId': 'com.motorola.cameraone:id/preview_surface'}

CAMERA_SHUTTER_BTN = {'resourceId':'com.facebook.wearable.apps.camera:id/shutter_button','description': 'Capture'}
CAMERA_CAPTURE_BUTTON = {'resourceId':'com.facebook.wearable.apps.camera:id/shutter_button','description':'Capture'}

CAMERA_IMAGE_CAPTURED_THUMBNAIL = {'resourceId': 'com.facebook.wearable.apps.camera:id/gallery_item_image_view', 'index':'0'}

CAMERA_VIDEO_CAPTURED_THUMBNAIL = {'resourceId': 'com.facebook.wearable.apps.camera:id/gallery_item_image_view'}

# CAMERA_CAPTURED_FILE_OPTIONS_BTN = {'resourceId': 'com.facebook.wearable.apps.camera:id/options_button'}
CAMERA_CAPTURED_FILE_OPTIONS_BTN = {'resourceId': 'com.facebook.wearable.apps.gallery:id/options_button'}
# CAMERA_CAPTURED_FILE_OPTIONS_BTN = {'description': 'Options Menu'}
# GALLERY_INFO_BTN = {'resourceId': 'com.google.android.apps.photos:id/details', 'description' : 'Info'}
GALLERY_DELETE_BTN = {'text': 'Delete'}

GALLERY_COMFIRM_DELETE = {'text': 'Delete Item'}

VIDEO_RECORDING_START_INDICATOR = {'resourceId': 'com.facebook.wearable.apps.camera:id/recording_indicator'}

CAMERA_GALLERY = {'resourceId': 'com.facebook.wearable.apps.camera:id/gallery_button'}

CAMERA_ACTIVITY_CONTAINER = {'resourceId':'com.facebook.wearable.apps.camera:id/camera_activity_container'}

# GALLERY_PLAY_VIDEO_BTN = {'resourceId' : 'com.facebook.wearable.apps.camera:id/playback_button'}
# GALLERY_PAUSE_VIDEO_BTN = {'description' : 'Pause video'}

# YOUTUBE_URL_PLAY_VIDEO = 'https://m.youtube.com/watch?v=vFWv44Z4Jhk'
# PHONESCREEN_X = 101
# PHONESCREEN_Y = 338

# PHOTOS_APP_PACKAGE = 'com.google.android.apps.photos/com.google.android.apps.photos.home.HomeActivity'

# PHOTOS_TRASH_BTN = {'text': 'Trash'}

# PHOTOS_FIRST_FILE = {'className' : 'android.view.ViewGroup'}

CAMERA_SETTINGS_MENU = {'resourceId':'com.facebook.wearable.apps.camera:id/settings_menu_button'}

CAMERA_SETTINGS_MORE_OPTION = {'text':'More'}  #,'resourceId':'com.facebook.wearable.apps.camera:id/camera_menu_value'}

CAMERA_SETTINGS_GENERAL = {'text':'General'}

# CAMERA_SETTINGS_CAPTURE_BUTTON = {'text':'Capture button','resourceId':'android:id/switch_widget'} 

CAMERA_SETTINGS_CAPTURE_BUTTON = {'text':'Capture button'}

CAMERA_VIDEO_SWITCH_MODE = {'text':'Video'}

# ----------------------------------------------------------- #
# ---- Music Player App ------------------------------------------ #
# ----------------------------------------------------------- #

MUSIC_FILENAME_LIST = ['Impact Moderato','sample1','sample2','sample3','sample4']

MUSIC_PLAYER_IDENTIFIER = {'text' : 'Library'}

MUSIC_PLAYER_PACKAGE_ACTIVITY = 'com.facebook.wearable.apps.player/com.facebook.wearable.apps.player.MainActivity'
MUSIC_PLAYER_PACKAGE = 'com.facebook.wearable.apps.player'

MUSIC_PLAYER_NAVIGATION = {'description' : 'Show navigation drawer'}

MUSIC_PLAYER_SEARCH = {'resourceId' : 'com.google.android.music:id/search'}

MUSIC_PLAYER_SEARCHFIELD = {'resourceId' : 'com.google.android.music:id/search_box_text_input'}

MUSIC_PLAYER_MUSICLIBRARY = {'text' : 'Library'}

MUSIC_PLAYER_LAST_PLAYED_SONG = {'description' : 'Play Last added'}

MUSIC_PLAYER_PAUSE_BTN = {'resourceId' : 'com.facebook.wearable.apps.player:id/play_pause_button'}

MUSIC_PLAYER_SONGS = {'text' : 'Songs'}

MUSIC_PLAYER_DEVICE_FILES = {'text' : 'DEVICE FILES'}

MUSIC_PLAYER_PAUSE_SONG = {'description' : 'Pause video'}

MUSIC_PLAYER_MINIMIZE = {'description' : 'Minimize'}

MUSIC_PLAYER_DEVICE_FILES_SONG ={'resourceId' : 'com.google.android.apps.youtube.music:id/details_container'}

MUSIC_PLAYER_MINI_PLAYER = {'resourceId' : 'com.google.android.apps.youtube.music:id/mini_player'}

MUSIC_PLAYER_PLAY_NEXT_MUSIC = {'resourceId' : 'com.facebook.wearable.apps.player:id/button_skip_next'}

MUSIC_PLAYER_REPEAT_OFF = {'description' : 'Repeat off'}
MUSIC_PLAYER_REPEAT_ON = {'description' : 'Repeat on'}
MUSIC_PLAYER_REPEAT_ONE = {'description' : 'Repeat one'}

MUSIC_PLAYER_APP_NAME = 'YouTube Music'

SETTINGS_MORE_OPTIONS = {'description': 'More options'}

SPOTIFY_APP = {'description':'Spotify'}



# ----------------------------------------------------------- #
# ---- Menu Navigation ------------------------------------------ #
# ----------------------------------------------------------- #
MENU_SETTINGS_DESC = {'text' : 'MOS Settings'}

MENU_MOS_SETTINGS_IDENTIFIER = {'text' : 'Notifications'}

MENU_PACKAGE = 'com.facebook.wearable.system.launcher/com.facebook.wearable.system.launcher.LauncherActivity'

DO_NOT_DISTURB_TEXT = {'text': 'Do Not Disturb'}

SETTINGS_DEVICE = {'text' : 'Device'}

SETTINGS_BATTERY = {'text' : 'Battery'}

SETTINGS_PASSCODE = {'text' : 'Passcode'}

SETTINGS_ACCESSIBILITY = {'text' : 'Accessibility'}

SETTINGS_PRIVACY = {'text' : 'Privacy'}

SETTINGS_GENERAL = {'text' : 'General'}

SETTINGS_ABOUT = {'text' : 'About'}

SETTINGS_HEALTH_WELLNESS = {'text' : 'Health and wellness'}

SETTINGS_SYSTEM = {'text' : 'System'}

SETTINGS_SYSTEM_UPDATE = {'text' : 'System Updates'}

SETTINGS_LANGUAGE_INPUT = {'text' : 'Language & Input'}

SETTINGS_ORIENTATION = {'text' : 'Orientation'}

SETTINGS_ORIENTATION_WRIST = {'text' : 'Wrist'}

SETTINGS_BACKGROUND_APP_REFRESH = {'text' : 'Background App Refresh'}

SETTINGS_WEBSITE_DATA = {'text' : 'Website Data'}

SETTINGS_DICTATION = {'text' : 'Dictation'}

SETTINGS_SCREENSHOTS =  {'text' : 'Screenshots'}

SETTINGS_USAGE = {'text' : 'Usage'}

SETTINGS_RESET = {'text' : 'Reset'}

SETTINGS_STORAGE_SYNC = {'text' : 'Storage and Sync'}

SETTINGS_CLOUD_BACKUPS = {'text' : 'Cloud Backups'}

SETTINGS_SAFETY = {'text' : 'Safety'}

SETTINGS_CAMERA = {'text' : 'Camera'}

# MENU_APPS_DICT_RES_ID = {'Accounts' : 'com.facebook.wearable.system.accounts:id/fb_login_button','Breathe' : 'com.facebook.wearable.apps.breathe:id/title_text','Camera' : 'com.facebook.wearable.apps.camera:id/camera_activity_container','Calendar':'com.facebook.wearable.apps.calendar:id/title_text','Data' : 'com.facebook.wearable.system.data:id/bt_demo_button','Device Health' : 'com.facebook.wearable.system.devicehealth:id/storage_overview_item_user_data','Gallery':'com.facebook.wearable.apps.gallery:id/title_text','Heart':'com.facebook.wearable.apps.heart:id/title','Sleep' : 'com.facebook.wearable.apps.sleep:id/title'}
# MENU_APPS_DICT_RES_ID = {'Accounts' : 'com.facebook.wearable.system.accounts:id/fb_login_button','Activity' : 'com.facebook.wearable.apps.activities:id/activity_levels_ring','Clock' : 'com.facebook.wearable.apps.clock:id/add_alarm_button','Breathe' : 'com.facebook.wearable.apps.breathe:id/title_text','Camera' : 'com.facebook.wearable.apps.camera:id/menu_background','Calendar':'com.facebook.wearable.apps.calendar:id/title_text','Data' : 'com.facebook.wearable.system.data:id/bt_demo_button','Device Health' : 'com.facebook.wearable.system.devicehealth:id/storage_overview_item_user_data','Gallery':'com.facebook.wearable.apps.gallery:id/title_text','Heart':'com.facebook.wearable.apps.heart:id/title','Sleep' : 'com.facebook.wearable.apps.sleep:id/title'}
MENU_APPS_DICT_RES_ID = {'Accounts' : 'com.facebook.wearable.system.accounts:id/fb_login_button','Activity' : 'com.facebook.wearable.apps.activities:id/activity_levels_ring','Clock' : 'com.facebook.wearable.apps.clock:id/add_alarm_button','Breathe' : 'com.facebook.wearable.apps.breathe:id/title_text','Camera' : 'com.facebook.wearable.apps.camera:id/menu_background','Calendar':'com.facebook.wearable.apps.calendar:id/title_text','Data' : 'com.facebook.wearable.system.data:id/bt_demo_button','Gallery':'com.facebook.wearable.apps.gallery:id/title_text','Sleep' : 'com.facebook.wearable.apps.sleep:id/title'}

# MENU_APPS_DICT_RES_ID = {'Accounts' : 'com.facebook.wearable.system.accounts:id/fb_login_button','Activity' : 'com.facebook.wearable.apps.activities:id/activity_levels_ring','Clock' : 'com.facebook.wearable.apps.clock:id/add_alarm_button','Breathe' : 'com.facebook.wearable.apps.breathe:id/title_text','Camera' : 'com.facebook.wearable.apps.camera:id/camera_activity_container','Data' : 'com.facebook.wearable.system.data:id/bt_demo_button','Device Health' : 'com.facebook.wearable.system.devicehealth:id/storage_overview_item_user_data'}  #,'Gallery' : 'com.facebook.wearable.apps.camera:id/title_text','Heart' : 'com.facebook.wearable.apps.heart:id/hr_value','Notifs' : 'com.facebook.wearable.system.notification:id/button_ios_notification','Sleep' : 'com.facebook.wearable.apps.sleep:id/title','Updater':'com.facebook.wearable.system.updater:id/text_build_version'}  #,'Bug Report':'com.facebook.wearable.system.bugreport:id/select_categories_button'

# SETTINGS_APPS_NOTIFS_LIST = ['Receive notifications','Mirror notifications','Device State Reporter','whatsapp','player','igdirect', 'Messenger','Phone','Sleep','Workout','Activities','calendar','personalsafety']

SETTINGS_APPS_NOTIFS_LIST = ['Activity','Breathe','Calendar','Camera','Heart','Instagram','Messenger','Phone','Sleep','Spotify','Weather','WhatsApp','Workout','clock','gallery','mediacontroller','stories','Mirror notifications']######changed by Aditya 14 oct#### removed 'App Update Notifications'

SETTINGS_CONNECTIVITY_LIST = ['Airplane mode','Bluetooth','WiFi','Cellular']########removed NFC added by Aditya-14 oct###

SETTINGS_DO_NOT_DISTURB_LIST = ['Do Not Disturb','Do Not Disturb Workouts']

SETTINGS_DEVICE_LIST = ['Display','Sound & Haptics','Battery']

SETTINGS_DISPLAY_LIST = ['Always On','Text','Large text','High contrast text']

SETTINGS_SOUND_LIST = ['Media Volume','Call Volume','Ring & Notifications','Vibration','Alarm']#,'Vibration'] #,'Haptic strength','Strong','Normal''Silent Mode','Do Not Disturb']  #[,'Alarm','Haptics Strength','Silent Mode']

SETTINGS_BATTERY_LIST = ['Battery']      #['Low Power']

SETTINGS_PASSCODE = ['Change Passcode']

# SETTINGS_ACCESSIBILITY_LIST = ['Large Text','High Contrast Text','Grayscale','Enable Real-Time Text']
SETTINGS_ACCESSIBILITY_LIST = ['TalkBack','Large text','Haptic strength','Strong','Normal','High contrast text','Grayscale','Real-time text (RTT)']

SETTINGS_PRIVACY_LIST = ['Permissions','Device personalization','Usage information'] ##mainline build 8500

SETTINGS_SYSTEM_LIST = ['Updates','Language and keyboard','Screen wake','Dictation','Enable screenshots','Storage','Back up','Factory reset']

SETTINGS_GENERAL_LIST = ['About','System Updates','Language & Input','Orientation','Background App Refresh','Website Data','Dictation','Screenshots','Usage','Reset','Storage and Sync','Cloud Backups','Safety']

# SETTINGS_ABOUT_LIST = ['Name','Facebook Account Info','Capacity','Available','Android Version','Model','Serial Number','MAC Address','Bluetooth','Android ID','Songs','Photos','Apps']
SETTINGS_ABOUT_LIST = ['Name','Version','Model','Serial Number']

# SETTINGS_HEALTH_WELLNESS_LIST = []

SETTINGS_SYSTEM_UPDATE_LIST = ['Last Updated: ']   #['Version','Check for an update']

SETTINGS_LANGUAGE_INPUT_LIST = ['Smart inputs','Smart inputs metadata','Languages']

SETTINGS_ORIENTATION_LIST = ['Wrist']

SETTINGS_ORIENTATION_WRIST_LIST = ['Left','Right']

SETTINGS_BACKGROUND_APP_REFRESH_LIST = ['Background App Refresh']

SETTINGS_WEBSITE_DATA_LIST = ['Clear Website Data']

SETTINGS_DICTATION_LIST = ['Dictation']

SETTINGS_SCREENSHOTS_LIST = ['Screenshots']

SETTINGS_USAGE_LIST = ['Available Storage','Used','Apps Usage']

SETTINGS_RESET_LIST = ['Reset']

SETTINGS_STORAGE_SYNC_LIST = ['Enable Auto Sync for Media','Enable Cloud Backup for Media','Enable Cloud Media Backup with LTE']

SETTINGS_CLOUD_BACKUPS_LIST = ['About','Backup over LTE','Enable Settings Backup to Cloud','Backup Now']

SETTINGS_SAFETY_LIST = ['Enable Safety Check Alerts','Enable Silent 911']

SETTINGS_CAMERA_LIST = ['Capture Quality','Original Quality','High Quality','General','Stabilize Video','Geotagging','Mirror Camera']


# ----------------------------------------------------------- #
# ---- STOREFRONT-PLAY STORE------------------------------------------ #
# ----------------------------------------------------------- #

#STORE_FRONT_PACKAGE = 'com.android.vending/com.android.vending.AssetBrowserActivity'

STORE_FRONT_PACKAGE = 'com.android.vending/com.android.vending.AssetBrowserActivity' 

STORE_FRONT_PACKAGE_TO_CLOSE = 'com.android.vending'

STORE_FRONT_IDENTIFIER = {'text' : 'Apps'}

PLAYSTORE_SEARCH = {'text' : 'Search for apps & games'}

# PLAYSTORE_KEYBOARD = {'resourceId' : 'com.google.android.wearable.app:id/ime_choice'}

PLAYSTORE_SEARCH_BAR = {'resourceId' : 'com.android.vending:id/0_resource_name_obfuscated'}

PLAYSTORE_APPS_TO_DOWNLOAD_LIST = ['Outlook']  ##Need to add Apps name same as that viewed in Apps & notifications screen after download

PLAYSTORE_OUTLOOK_APP_DOWNLOADED = ['Outlook']

PLAYSTORE_YOUTUBEMUSIC_APP_DOWNLOADED = ['YouTube Music']

PLAYSTORE_OUTLOOK_APP_PACKAGE = 'com.microsoft.office.outlook/com.microsoft.office.outlook.MainActivity'

PLAYSTORE_OUTLOOK_APP_PACKAGE_TO_CLOSE = 'com.microsoft.office.outlook'

PLAYSTORE_INSTALL_BTN = { 'text' : 'Install'}

PLAYSTORE_APP_DOWNLOAD_CANCEL = {'text' : 'Cancel'}

PLAYSTORE_APP_DOWNLOAD_INSTALLING = {'text' : 'Installing...'}
    
PLAYSTORE_APP_OPEN = {'text' : 'Open'}

PLAYSTORE_APP_INSTALLED = {'text' : 'Installed'}

CLEAR_ALL_TEXT = {'text' : 'CLEAR ALL'}

NUMBER_OF_TIMES_APP_DOWNLOAD = 10

test = {'className':'android.widget.LinearLayout'}

# ----------------------------------------------------------- #
# ---- PIM ------------------------------------------ #
# ----------------------------------------------------------- #

CALENDAR_APP_PACKAGE = 'com.google.android.calendar/com.android.calendar.LaunchActivity'
CREATE_EVENT_DICT = {'resourceId': 'com.google.android.calendar:id/floating_action_button'}
ALARM_APP_PACKAGE = 'com.facebook.wearable.apps.clock/com.facebook.wearable.apps.clock.ClockActivity'
ALARM_BUTTON = {'resourceId': 'com.facebook.wearable.apps.clock:id/add_alarm_button'}
CREATE_ALARM ={'resourceId': 'com.facebook.wearable.apps.clock:id/confirm_add_alarm_button'}
ALARM_LIST = {'resourceId': 'com.facebook.wearable.apps.clock:id/alarm_list_item_container'}
SET_ALARM_OK ={'text' : 'OK', 'resourceId': 'android:id/button1'}
ALARM_DELETE_BUTTON = {'text':'Delete'}
ALARM_DELETE_CONFIRM = {'resourceId':'com.facebook.wearable.apps.clock:id/delete_alarm_confirmation_delete_button'}
NO_ALARM_EXIST ={'text':'No Alarms', 'resourceId': 'com.google.android.deskclock:id/alarm_empty_view'}
ALARM_EXPAND = {'description' : 'Expand alarm'}
ALARM_COLLAPSE = {'description' : 'Collapse alarm'}
CALENDAR_DATE_INDEX = [35, 36, 37, 38, 39]
CALENDAR_SETTINGS_DRAWER = {'description' : 'Show Calendar List and Settings drawer'}
CALENDAR_DRAWER_MONTH = {'text' : 'Month'}
CALENDAR_CREATE_EVENT = {'text' : 'Event'}
CALENDAR_EVENT_SAVE = {'resourceId': 'com.google.android.calendar:id/save'}
CALENDAR_JUMP_TODAY = {'description' : 'Jump to Today'}
CALENDAR_EVENT_NAME = {'description' : '(No title), All day: '}
CALENDAR_EVENT_ALLDAY = {'text' : 'All-day'}
CALENDAR_EVENT_MORE_OPTIONS = {'description' : 'More options'}
CALENDAR_EVENT_DELETE_OPTION = {'text' : 'Delete'}
CALENDAR_EVENT_DELETE_CONFIRM = {'text' : 'Delete'}

CHARGING_ICON = {'resourceId':'com.facebook.wearable.system.launcher:id/charging_icon'}

EDIT_ALARMS_BUTTON = {'text':'Edit Alarms'}
# ----------------------------------------------------------- #
# ---- WATCH THEME ------------------------------------------ #
# ----------------------------------------------------------- #

# WATCH_ALL_THEMES_LIST = ['com.facebook.wearable.system.launcher:id/hour_hand','com.facebook.wearable.system.launcher:id/hour_time','com.facebook.wearable.system.launcher:id/clock','com.facebook.wearable.system.launcher:id/time']


# ----------------------------------------------------------- #
# ---- Chats ------------------------------------------------ #
# ----------------------------------------------------------- #


HELLO_MESSAGE = 'HELLO'
HELLO_TEXT_VERIFY = {'text':'HELLO'}
FB_MSGR_APP = {'text':'Messenger'}
CHATS_NEW_CONV = {'resourceId': 'com.facebook.wearable.system.launcher:id/floating_action_button'}
CHAT_ENTER_NUMBER = {'resourceId':'com.facebook.wearable.system.launcher:id/dialpad'}
RECENT_CHATS_NAME = {'text': 'Chats'}
CHATS_ENTER_NUMBER_DIGIT_AREA = {'resourceId': 'com.facebook.wearable.system.launcher:id/digits'}
CHATS_SELECT_CONTACT_BUTTON = {'resourceId':'com.facebook.wearable.system.launcher:id/call'}
CHATS_UNREAD_NOTIFICATION = {'resourceId':'com.facebook.wearable.system.launcher:id/unread_indicator'}
CHATS_CONTACT_USER1 = {'text':'Rock Lee'}
CHATS_KEYBOARD = {'resourceId': 'com.facebook.wearable.system.launcher:id/keyboard','className':'android.widget.ImageButton'}
CHAT_USER = {'index':'5','className':'android.view.ViewGroup'}
CHATS_FB_MSGER_EDIT_TEXT = {'className': 'android.widget.EditText', 'text':'Aa'}
FB_MSGER_SEND_BUTTON = {'description': 'Send'}
CHATS_NEW_MESSAGE = {'description':'New Message'}
CHATS_NOTIFICATION_VIEW = {'resourceId': 'com.facebook.wearable.system.launcher:id/recycler_view'}
CHATS_NOTIFICATION_VERIFIER = {'resourceId': 'com.facebook.wearable.system.launcher:id/notification_header_container'}
NOTIFCATION_CLEAR_ALL_BUTTON = {'text':'Clear All'}
CHATS_CHOOSE_PHOTO = {'description':'Choose photo'}
CHATS_IMAGE_FR_ATTACHMENT = {'className':'android.widget.ImageView','index':'0'}
CHATS_SEND_IMAGE = {'text':'SEND'}
CHATS_IMAGE_SCREEN = {'className':'androidx.recyclerview.widget.RecyclerView'}
CHATS_CONTACT_USER_01 = {'text':'Adityaaa'}
CHATS_CAMERA_ATTACHMENT = {'resourceId':'com.facebook.wearable.system.launcher:id/camera'}
CHATS_CONFIRMATION_BUTTON = {'resourceId':'com.facebook.wearable.apps.camera:id/preview_confirm_button'}
CHATS_RECENT_THREAD = {'index':'3','className':'android.view.ViewGroup'}
CHATS_PHOTO_MSG = {'description':'Received photo message'}
CHATS_RECORD_BUTTON = {'resourceId':'com.facebook.wearable.system.launcher:id/dictation'}
CHATS_RECORD_BUTTON_PARTNER = {'description':'Record voice'}
CHATS_STOP_SEND_BUTTON = {'resourceId':'com.facebook.wearable.system.launcher:id/send_as_voice_button'}
CHATS_RECEIVE_VOICE_MSG = {'description':'Stability sent a voice clip.'}
CHATS_VOICE_MSG_PLAY_OR_PAUSE_BUTTON = {'description':'Play or pause voice message'}
CHATS_VIDEO_MSG = {'description':'Video'}
CHATS_TAKE_PHOTO = {'description':'Take photo'}
CHATS_VIDEO_SWITCH = {'text':'VIDEO'}
CHATS_VIDEO_CAPTURE = {'description':'Capture video'}
CHATS_ATTACHMENT = {'resourceId':'com.facebook.wearable.system.launcher:id/message_attachment'}
CHATS_PHONE_ATTACHMENT = {'resourceId':'com.facebook.wearable.system.launcher:id/rtc'}
CHATS_VOICE_CALL_BUTTON = {'resourceId' : 'com.facebook.wearable.apps.mwear:id/audio_button'}
CHATS_CALL_END_BUTTON = {'resourceId':'com.facebook.wearable.apps.mwear:id/control_button_right'}
CHATS_NOT_NOW_BUTTON = {'text':'NOT NOW'}
CHATS_PIXEL_VOICE_CALL_BUTTON = {'description':'Voice call'}
CHATS_VOICE_CALL_ANSWER_BUTTON = {'resourceId':'com.facebook.wearable.system.launcher:id/accept_button'}
CHATS_VIDEO_CALL_BUTTON = {'resourceId':'com.facebook.wearable.apps.mwear:id/video_button'}
CHATS_VIDEO_CHAT_BUTTON = {'description':'Video chat'}

CHATS_DIALPAD_BUTTON = {'resourceId': 'com.facebook.wearable.system.launcher:id/call_button'}



CHARGING_ICON = {'resourceId':'com.facebook.wearable.system.launcher:id/charging_icon'}


# ----------------------------------------------------------- #
# ------------------- RTT --------------------- #
# ----------------------------------------------------------- #
rtt_selector = {'text' : 'Real-time text (RTT) call'}
switch_selector = {'className' : 'android.widget.Switch'}

PHONE_MORE_OPTIONS = {'description': 'More options'}

KEYBOARD_OPTION = {'text':'Keyboard'}

VOICE_CALL_OPTION = {'text':'Voice Call', 'resourceId':'com.facebook.wearable.apps.phone:id/voice_call_button'}

RTT_CALL_OPTION = {'text':'RTT Call', 'resourceId':'com.facebook.wearable.apps.phone:id/rtt_call_button'}

RTT_MIDDLE_BUTTON = {'resourceId' : 'com.facebook.wearable.apps.phone:id/control_button_middle'}

RTT_ENABLE_SWITCH = {'text' : 'Enable Real-Time Text','resourceId' : 'android:id/switch_widget'}

SEND_IMMEDIATELY_SWITCH = {'text' : 'Send immediately','resourceId' : 'android:id/switch_widget'}

RTT_OPTION = {'text' : 'Real-time text (RTT)'}

RTT_BACK_BTN = {'resourceId' : 'com.facebook.wearable.apps.phone:id/backButton'}

PARTNER_DEVICE_START_RTT_CALL_BTN = {'resourceId' :'com.google.android.dialer:id/dialpad_rtt_call_button'}

PARTNER_DEVICE_START_VOICE_CALL_BTN = {'resourceId' :'com.google.android.dialer:id/dialpad_rtt_visible_voice_call_button'}

PARTNER_DEVICE_RTT_ALWAYS_VISIBLE = {'resourceId' :'com.google.android.dialer:id/rtt_configuration_radio_button_always_visible'}

PARTNER_DEVICE_RTT_NOT_VISIBLE = {'resourceId' :'com.google.android.dialer:id/rtt_configuration_radio_button_not_visible'}

PARTNER_DEVICE_RTT_VISIBLE_DURING_CALL = {'resourceId' :'com.google.android.dialer:id/rtt_configuration_radio_button_visible_during_call'}

PARTNER_DEVICE_NORMAL_AUDIO_CALL_BTN = {'resourceId' : 'com.google.android.dialer:id/dialpad_voice_call_button'}

PARTNER_DEVICE_RTT_INPUT_TEXT = {'resourceId' :'com.google.android.dialer:id/rtt_chat_input'}

PARTNER_DEVICE_RTT_TEXT_SUBMIT = {'resourceId' :'com.google.android.dialer:id/rtt_chat_submit_button'}

RTT_TEXT_ENABLING_MSG= {'text':'RTT assists callers who are deaf, hard of hearing, have a speech disability, or need more than voice alone.'}

RTT_MSG_OK_BTN = {'resourceId':'com.google.android.dialer:id/rtt_button_ok'}

RTT_NEVER_SHOW = {'text':'Never show'}

RTT_ALWAYS_SHOW = {'text':'Always show'}

RTT_USE_BTN = {'text':'Use RTT', 'resourceId':'com.facebook.wearable.apps.phone:id/first_button'}

RTT_OPTION_ON_PIXEL = {'text':'RTT'}

#####--------------------------------------------------------------------------------------------------------------------------######


SETTINGS_AIRPLANE_SWITCH = {'text':'Airplane mode'}
SETTINGS_CELLULAR_BUTTON = {'text':'Cellular'}
SETTINGS_CELLULAR_SWITCH = {'text':'Cellular','resourceId':'android:id/switch_widget'}


CHATS_PERMISSION_FOR_VIDEO_CALL = {'index':'1','text':'ALLOW'}

CHATS_VIDEO_PERMISSION = {'text':'While using the app'}

CHATS_AUDIO_PERMISSION = {'text':'While using the app'}

