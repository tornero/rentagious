import requests
import json

## ----- Authenticate with GoToWebinar API -----
## API Docs: https://goto-developer.logmeininc.com/gotowebinar-api-overview
## Pre-req: Create new app in developer center to generate consumerKey/consumerSecret
##          My Apps: https://goto-developer.logmeininc.com/user/me/apps
## 1) Send consumerKey and email/password to create a response key code
## 2) Send response key code to generate an auth token

consumerKey = "1oSjGAfe5v3oa6zCvfwgktteua18dpDr"
consumerSecret = "KfdRYkYIlFXLQe4o"
user = "michael.warkentin@mx.com"
password = "Abcd1234" 

def authenticate(consumerKey,consumerSecret,user,password):
    codeAuthUrl = "https://api.getgo.com/oauth/v2/authorize?client_id=" + consumerKey + "&response_type=code"
    c = requests.get(codeAuthUrl) 
    redirectUrl = c.url
    payload = {'emailAddress':user,'password':password}
    session = requests.session()
    c2 = session.post(redirectUrl,data=payload)
    redirectUrl2 = c2.url
    responseKey = redirectUrl2.replace("https://api.getgo.com?code=","")
    tokenAuthUrl = "https://api.getgo.com/oauth/v2/token"
    querystring = {"grant_type":"authorization_code",
                   "code":responseKey
    }
    authResponse = requests.request("POST", tokenAuthUrl, params=querystring, auth=(consumerKey,consumerSecret))
    auth_json = authResponse.json()
    return auth_json