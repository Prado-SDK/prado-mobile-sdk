# Prado Admob Adapter

Prado Admob Adapter supports the following ad formats:

+ Interstitial 
+ Rewarded Video
+ Banner

On the following platforms:

+ [Native Android](/Mediation/AdMob%20Adapter/Android)
+ [Native iOS](/Mediation/AdMob%20Adapter/iOS)
+ [Unity](/Mediation/AdMob%20Adapter/Unity)

## Prerequisites
Before publishing your first app please complete the process for [Prado's Publisher onboarding](http://accounts.kidoz.net/publishers/register?utm_source=prado_github) to create your account and receive your Publisher ID and Security Token credentials.

## App-ads.txt
Please set up [app-ads.txt](https://prado.co/app-ads.txt) for all the apps that use Prado sdk. This will increase your fill rate and earnings and will prevent ad serving being blocked.
Follow these instructions on how to [Set up an app-ads.txt file for your app](https://www.prado.co/intro-app-ads-txt).

## Custom Event and CPM Setup

In order to setup custom events for all relevant ad units go to the ad unit's<BR>
Mediation Group -> Waterfall -> Add Custom Event<BR>
Set the Label and eCPM fields and continue

<img width="800" src="https://raw.githubusercontent.com/Prado-SDK/prado-mobile-sdk/refs/heads/docs/Mediation/AdMob%20Adapter/CustomEvent1.png"> 

Click the Select a mapping drop down

<img width="800" src="https://raw.githubusercontent.com/Prado-SDK/prado-mobile-sdk/refs/heads/docs/Mediation/AdMob%20Adapter/CustomEvent2.png"> 

On the Add mapping step set the Class Name and Parameter fields:<BR>

- For iOS set the following full path in the `Class Name` field: </br>
`PradoAdmobAdapter`

- For Android set the following full path in the `Class Name` field: </br>
`com.prado.mediation.admob.adapters.PradoAdMobAdapter`

- Set the following json string in the `Parameter (optional)` field: </br>
`{"AppID":"publisherId", "Token":"publisherToken"}`

- Replace `publisherId` and `publisherToken` with the credentials received during [Prado's Publisher onboarding](http://accounts.kidoz.net/publishers/register?utm_source=prado_github).

<img width="800" src="https://raw.githubusercontent.com/Prado-SDK/prado-mobile-sdk/refs/heads/docs/Mediation/AdMob%20Adapter/CustomEvent3.png"> 

You will need to define your Admob Ad Units CPM and align them with Prado eCPM displayed in your Prado dashboard. Contact a Prado publisher representative for more information at sdk@prado.co

## Important note:
While mapping the Prado Ad unit on Admob, it is highly recommended to run some JSON validator on the parameters passed to the Class name (AppID and Token). This method may minimize parsing mistakes that may arise on initial connection.
