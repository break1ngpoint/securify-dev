#!/bin/bash

current_time() { echo `date '+%Y-%m-%d %H:%M:%S'`; }

log() { echo "$(current_time) ${1}"; }

mkdir -p ./results

start_time=$(date +%s)

for file in ./contracts/*; do
    log "$(basename $file)"
    java -Xmx16G -jar build/libs/securify-0.1.jar -fh $file --livestatusfile ./results/$(basename $file .bin).json
done

end_time=$(date +%s)
time_diff=$((end_time-start_time))
log "Total Used: $time_diff seconds"
