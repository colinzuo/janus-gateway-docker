#!/bin/bash

function log_info ()
{
        DATE_N=`date "+%Y-%m-%d %H:%M:%S"`
        LOG_MSG="${DATE_N} $@"
        echo "${LOG_MSG}"
}

log_info "harix-auto-test-oss-janus Container Begin"

if [[ "${ENABLE_DEBUG}" == "true" ]]; then
    touch /tmp/debug
fi

logdir=$MY_POD_NAME
if [[ $logdir == "" ]]; then
    logdir=logs
fi

rm -rf /app/logs
mkdir -p /output/logs/$logdir
ln -s /output/logs/$logdir /app/logs

/usr/local/bin/janus

while true
do
    if [ -f /tmp/debug ]; then
        sleep 5
    else
        break
    fi
done

log_info "harix-auto-test-oss-janus Container End"
