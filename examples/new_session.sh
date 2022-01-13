#!/bin/bash

# MirrorTab bash/curl sample to create a new MirrorTab session

# Define the api_key
api_key='333c5322babf799edc1efdea4a'

### Define the options

# String for the session name - this is optional 
session_name='My first MirrorTab Session'

# Setting go_code_enable to true returns a public gocode that does not require users to create a MirrorTab account.
# The gocode is a random string and will be required to share the session.
# Setting go_code_enable to false requires the other users of the session to have a MirrorTab account.
# The default is false and private
go_code_enable='true' 

# duration_min is the time in minutes before the session get removed - default is 45 mins
duration_min='30'

# Build the JSON data string
generate_post_data()
{
  cat <<EOF
{
  "api_key": "$api_key",
  "session_name": "$session_name",
  "go_code_enable": "$go_code_enable",
  "duration_min": "$duration_min"
}
EOF
}


# API v1 URL
new_session_api_url='https://api.mirrortab.com/build_mtvb'

# This is easy :) 
curl $new_session_api_url -H "Content-Type:application/json" -X POST -d "$(generate_post_data)"

# This should return the following JSON
#
# {"session_id":"cllgnpvinm4yyvz76ohpxshxq0nr67","session_name":"My first MirrorTab Session","go_url":"rtbvdenadtz0is0rg2f16lzvdazyx1","gocode":"cat-coffee-396","kill_time_UTC":1642101252956}
#
#    session_id =  rtbvdenadtz0is0rg2f16lzvdazyx1
#    session_name = "My first MirrorTab Session"
#    go_url = “https://mirrortab.com/go/rtbvdenadtz0is0rg2f16lzvdazyx1” 
#    gocode=”Ilikepurplecars” //public gocode to be used at https://MirrorTab.com
#    kill_time_UTC=unix_datetime 
