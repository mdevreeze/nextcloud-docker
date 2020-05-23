#!/bin/sh
sleep 5
chown www-data:root /data
# Hand off to original entrypoint
/entrypoint.sh apache2-foreground