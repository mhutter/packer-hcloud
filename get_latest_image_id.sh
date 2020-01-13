#!/bin/sh

jq -r '
  .last_run_uuid as $id |
  .builds[] | select(.packer_run_uuid == $id) | .artifact_id
' $@
