## ![](https://docs.github.com/assets/images/site/favicon.png) [GitHub](https://github.com/MirrorTab/api_v1/)

## Documentation for api.mirrortab.com 
Public v1 API to manage MirrorTab sessions

## Requirements
Please login and visit https://mirrortab.com/API to get your api_key

## Limits
Free accounts can not access the API. Enterprise and paid accounts have limits on number of sessions and session duration

## Overview of API 
### [Example bash and curl code on GitHub](https://github.com/MirrorTab/api_v1/tree/main/examples)

## new_session 
### This creates a new MirrorTab session and returns a URL to allow users to join
``` 
 # URL: https://api.mirrortab.com/new_session
 # Method: POST
 # Headers: Content-type: application/json
 
 # Define the api_key
 api_key='333c5322babf799edc1efdea4a'

 # String for the session name - this is optional 
 session_name='My first MirrorTab session'

 # Setting go_code_enable to true returns a public gocode that does not require users to create a MirrorTab account.
 # The gocode is a random string and will be required to share the session.
 # Setting go_code_enable to false requires the other users of the session to have a MirrorTab account.
 # The default is false and private
 go_code_enable='true' 

 # duration_min is the time in minutes before the session get removed - default is 45 mins
 duration_min='30'
 
 # This should return the following JSON
 #
 # {"session_id":"cllgnpvinm4yyvz76ohpxshxq0nr67","session_name":"My first MirrorTab Session","go_url":"rtbvdenadtz0is0rg2f16lzvdazyx1","gocode":"cat-coffee- 396","kill_time_UTC":1642101252956}
 #
 #    session_id =  rtbvdenadtz0is0rg2f16lzvdazyx1 
 #    session_name = "My first MirrorTab session"
 #    go_url = “https://mirrortab.com/go/rtbvdenadtz0is0rg2f16lzvdazyx1” 
 #    gocode=”Ilikepurplecars” //public gocode to be used at https://MirrorTab.com
 #    kill_time_UTC=unix_datetime 

```

## list_sessions
### This list all new MirrorTab sessions assigned to given api_key
``` 
 # URL: https://api.mirrortab.com/list_sessions
 # Method: POST
 # Headers: Content-type: application/json
 # Define the api_key
 api_key='333c5322babf799edc1efdea4a'
 
 # This should return the following JSON list of sessions
 #
 # # Session ID                        #Session name as string                     # Full gocode                                                    # Kill time unix timestamp     #GoCode string
 #
 # {"rtbvdenadtz0is0rg2f16lzvdazyx1":{"session_name":"My first MirrorTab Session","go_url":"https://mirrortab.com/go/rtbvdenadtz0is0rg2f16lzvdazyx1","kill_time_UTC":1642101252956,"gocode":"cat-coffee-396"}}
 #
 
```

## remove_session
### This removes a MirrorTab session given the session_id and api_key
``` 
 # URL: https://api.mirrortab.com/remove_session
 # Method: POST
 # Headers: Content-type: application/json

 # MirrorTab session will be removed automatically at the end of the configured duration
 # To remove the session before the scheduled time, use this function

 # Define the api_key
 api_key='333c5322babf799edc1efdea4a'

 # Define the session id to remove
 session_id='rtbvdenadtz0is0rg2f16lzvdazyx1'

 # This should return the status or an error
 # Passing case
 #
 # {"removed":true}
 #
 # Error example - it is possible the session already timed out or the session_id or api_key is not valid
 #
 # {"removed":false,"error_msg":"could not remove the session -e2"}

```
