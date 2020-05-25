#!/bin/sh
# todo this is now unnecessary now that s3ql is mounted by Ansible?
chown www-data:root /s3ql
# Hand off to original entrypoint
/entrypoint.sh apache2-foreground