#!/bin/bash

# MirrorTab bash/curl sample to a remove a MirrorTab session
#
# MirrorTab session will be removed automatically at the end of the configured duration
# To remove the session before the scheduled time, use this function

# Define the api_key
api_key='333c5322babf799edc1efdea4a'

# Define the session id to remove
session_id='rtbvdenadtz0is0rg2f16lzvdazyx1'

generate_post_data()
{
  cat <<EOF
{
  "api_key": "$api_key",
  "session_id" :"$session_id"
}
EOF
}

# API v1 URL
remove_sessions_api_url='https://api.mirrortab.com/remove_session'

# This is easy :) 
curl $remove_sessions_api_url -H "Content-Type:application/json" -X POST -d "$(generate_post_data)"

# This should return the status or an error
# Passing case
#
# {"removed":true}
#
# Error example - it is possible the session already timed out or the session_id or api_key is not valid
#
# {"removed":false,"error_msg":"could not remove the session -e2"}

