## ![](https://docs.github.com/assets/images/site/favicon.png) [GitHub](https://github.com/MirrorTab/api_v1/)

## Documentation for api.mirrortab.com 
Public v1 API to manage MirrorTab sessions

## Requirements
Please login and visit https://mirrortab.com/API to get your api_key

## Limits
Free accounts can not access the API. Enterprise and paid accounts have limits on number of sessions and session duration

## Code Examples
- [BASH](https://github.com/MirrorTab/api_v1/tree/main/examples)

## Overview of API 

### Create New Session

This creates a new MirrorTab session and returns a URL to allow users to join.

**URL** : `/new_session`

**Method** : `POST`

**Request Body**

```json
{
    api_key:"[Your unique API Key]"
    session_name:"[optional string for session name]",
    permissions:"[permission level for this session - One of [open, gocode, account] - default is  gocode]"
    duration_min:"[is the time in minutes before the session get removed - default is 45 mins]" 
    urls: "[optional array of URLs - opens provided URLs in the MirrorTab session]" 
}
```

```
Permissions
- open - this allows anyone with the url to join the MirrorTab session
- gocode - the MirrorTab api will generate a gocode allowing anyone with this code to join - (default)
- account - this requires all users of the session to have a MirrorTab account to join the session
```

**Request Body Example** 

```json
{
    api_key='333c5322babf799edc1efdea4a',
    session_name='My first MirrorTab session',
    permissions='open',
    duration_min='30'
    urls="['https://hackernews.com','https://silvershots.com']"
}
```

## Success Response

**Condition** : If everything is OK and session is successfully created.

**Code** : `201 CREATED`

**Content example**

```json
{
  session_id =  rtbvdenadtz0is0rg2f16lzvdazyx1 
  session_name = "My first MirrorTab session"
  go_url = “https://mirrortab.com/go/rtbvdenadtz0is0rg2f16lzvdazyx1” 
  gocode=”Ilikepurplecars” //public gocode to be used at https://MirrorTab.com
  kill_time_UTC=unix_datetime 
}
```

## Error Responses

**Condition** : If api_key is invalid.

**Code** : `401 Unauthorized`

**Content** : `{}`

### Or

**Condition** : If api_key is not provided.

**Code** : `400 BAD REQUEST`

**Content example**

```json
{
    "api_key": [
        "This field is required."
    ]
}
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
