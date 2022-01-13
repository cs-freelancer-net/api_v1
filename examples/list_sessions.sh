#!/bin/bash

# MirrorTab bash/curl sample to list the MirrorTab sessions for a given api_key

# Define the api_key
api_key='333c5322babf799edc1efdea4a'


generate_post_data()
{
  cat <<EOF
{
  "api_key": "$api_key"
}
EOF
}


# API v1 URL
list_sessions_api_url='https://api.mirrortab.com/list_mtvb'

# This is easy :) 
curl $list_sessions_api_url -H "Content-Type:application/json" -X POST -d "$(generate_post_data)"

# This should return the following JSON list of sessions
#
# # Session ID                        #Session name as string                     # Full gocode                                                    # Kill time unix timestamp     #GoCode string
#
# {"rtbvdenadtz0is0rg2f16lzvdazyx1":{"session_name":"My first MirrorTab Session","go_url":"https://mirrortab.com/go/rtbvdenadtz0is0rg2f16lzvdazyx1","kill_time_UTC":1642101252956,"gocode":"cat-coffee-396"}}
#

