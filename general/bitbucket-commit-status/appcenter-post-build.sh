#!/usr/bin/env bash
#
# Report build status next to Bitbucket commit.
#
# Adjust settings in bitbucket.sh file
#
# Contributed by: Sohayb Hassoun

source bitbucket.sh

case $AGENT_JOBSTATUS in
     Failed)
          bitbucket_set_status_fail
          ;;
     Canceled)
          bitbucket_set_status_stopped
          ;; 
     *)
          bitbucket_set_status_success
          ;;
esac
