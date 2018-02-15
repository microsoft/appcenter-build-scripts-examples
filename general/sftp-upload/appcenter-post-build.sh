#!/usr/bin/env bash
#
# Upload the binary from the build output directory via SFTP using LFTP https://lftp.yar.ru/lftp-man.html
# Make sure to use environment variables for the credentials

brew install lftp
cd $APPCENTER_OUTPUT_DIRECTORY
lftp -f $APPCENTER_SOURCE_DIRECTORY/upload.lftp