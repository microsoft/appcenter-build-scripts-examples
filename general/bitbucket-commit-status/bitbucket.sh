#!/usr/bin/env bash
#
# Report build status next to Bitbucket commit.
# 
# - Fill in BITBUCKET_USER that owns the repo
# - Fill MS_APPCENTER_ORG is the AppCenter organization that owns the app
# - Fill MS_APPCENTER_APP is AppCenter's app name
# - BITBUCKET_TOKEN is your user and Base64 encoding of "user:password", this should be an environment variable defined in AppCenter's Job's configurations
#
# Contributed by: Sohayb Hassoun

cd $APPCENTER_SOURCE_DIRECTORY

BITBUCKET_USER=""
MS_APPCENTER_ORG=""
MS_APPCENTER_APP=""

bitbucket_set_status() {
    local status job_status
    local "${@}"

    build_url="https://appcenter.ms/orgs/$MS_APPCENTER_ORG/apps/$MS_APPCENTER_APP/build/branches/$APPCENTER_BRANCH/builds/$APPCENTER_BUILD_ID"

    curl -X POST https://api.bitbucket.org/2.0/repositories/$BITBUCKET_USER/$BUILD_REPOSITORY_NAME/commit/$BUILD_SOURCEVERSION/statuses/build -d \
        "{
            \"state\": \"$status\", 
            \"key\": \"$APPCENTER_BUILD_ID\",
            \"name\": \"$APPCENTER_BRANCH\",
            \"url\": \"$build_url\",
            \"description\": \"The build status is: $job_status!\"
        }" \
        -H "Authorization: Basic $BITBUCKET_TOKEN" \
        -H "Content-Type: application/json"
}

bitbucket_set_status_success() {
    bitbucket_set_status status="SUCCESSFUL" job_status="$AGENT_JOBSTATUS"
}

bitbucket_set_status_fail() {
    bitbucket_set_status status="FAILED" job_status="$AGENT_JOBSTATUS"
}

bitbucket_set_status_stopped() {
    bitbucket_set_status status="STOPPED" job_status="$AGENT_JOBSTATUS"
}

bitbucket_set_status_in_progress() {
    bitbucket_set_status status="INPROGRESS" job_status="In progress"
}