#!/bin/sh
sleep 5 # wait for s3ql container to be mounted
chown www-data:root /data
# Hand off to original entrypoint
/entrypoint.sh apache2-foreground