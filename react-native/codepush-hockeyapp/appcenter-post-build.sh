#!/usr/bin/env bash

# Example: Install App Center CLI
npm install -g appcenter-cli

ENVIRONMENT=Development
APP_NAME=OrganizationName/MyApp-iOS
APP_PATH=myApp.ipa
# HockeyApp-iOS-Dev
HOCKEY_APP_ID=""
HOCKEY_TOKEN=""
APP_CENTER_TOKEN=""
COMMIT_MESSAGE=$(git log -1 HEAD --pretty=format:%s)

if [ "$APPCENTER_BRANCH" == "master" ]; then
    ENVIRONMENT=Production
    # HockeyApp-iOS-Prod
    HOCKEY_APP_ID=""
fi

if [[ -z "$APPCENTER_XCODE_PROJECT" ]]; then
    APP_NAME=OrganizationName/MyApp-Android
    APP_PATH=app-debug.apk
    # HockeyApp-Android-Dev
    HOCKEY_APP_ID=""

    if [ "$APPCENTER_BRANCH" == "master" ]; then
        # HockeyApp-Android-Prod
        HOCKEY_APP_ID=""
    fi
fi

echo "**************** PUBLISH CHANGES WITH CODEPUSH ******************"
echo "APP NAME               => $APP_NAME"
echo "CURRENT ENVIRONMENT    => $ENVIRONMENT"
echo "SELECTED RN PACKAGE    => $APPCENTER_REACTNATIVE_PACKAGE"
echo "SELECTED XCODE PROJECT => $APPCENTER_XCODE_PROJECT"
echo "OUTPUT DIRECTORY       => $APPCENTER_OUTPUT_DIRECTORY"

appcenter codepush release-react -a "$APP_NAME" -m --description "$COMMIT_MESSAGE" -d "$ENVIRONMENT" --token "$APP_CENTER_TOKEN"

curl \
    -F "status=2" \
    -F "notify=1" \
    -F "notes=$COMMIT_MESSAGE" \
    -F "notes_type=0" \
    -F "ipa=@$APPCENTER_OUTPUT_DIRECTORY/$APP_PATH" \
    -H "X-HockeyAppToken: $HOCKEY_TOKEN" \
    https://rink.hockeyapp.net/api/2/apps/$HOCKEY_APP_ID/app_versions/upload