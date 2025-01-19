*** Settings ***
Library     AppiumLibrary
Library     Collections
Library     BuiltIn
Library     OperatingSystem

*** Variables ***
${NEW_DIR}          C:/Users/DiaaAl-Haref/Downloads/
${APP_Name}         Android-MyDemoAppRN.1.3.0.build-244.apk
${REMOTE_URL}       http://localhost:4723
${PLATFORM_VERSION}     19
${PLATFORM_NAME}    Android
${DEVICE_NAME}      emulator-5554

*** Keywords ***
Set App Path
    [Documentation]    Set the application path based on the specified directory.
    ${absolute_app_path}=    Set Variable    ${NEW_DIR}${APP_Name}
    Set Suite Variable    ${APP}    ${absolute_app_path}  # Set as a suite variable

Startup application
    [Documentation]    Starts the application.
    Log    Starting the application...
    BaseTest.Set App Path
    open Application    ${REMOTE_URL}       platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}      platformVersion=${PLATFORM_VERSION}     app=${APP}      automationName=UiAutomator2

Teardown application
    [Documentation]    Tears down the application.
    Log    Closing the application...
    close Application

