# AppLovin Max Adapter

Prado AppLovin Max Adapter supports the following ad formats:

+ Interstitial 
+ Rewarded Video
+ Banner

On the following platforms:

+ [Native Android](/Mediation/AppLovin%20Max%20Adapter/Android)
+ [Native iOS](/Mediation/AppLovin%20Max%20Adapter/iOS)
+ [Unity](/Mediation/AppLovin%20Max%20Adapter/Unity)

## Prerequisites

Before publishing your first app please complete the process for [Prado's Publisher onboarding](http://accounts.prado.co/publishers/register?utm_source=prado_github). <BR>

Follow instructions on the [AppLovin Custom SDK Network Integration Guide](https://dash.applovin.com/documentation/mediation/android/mediation-setup/custom-sdk).

In the Manage Network form you should enter the following data:
```
Custom Network Name: Prado 
iOS Adapter Class Name: PradoMediationAdapter
Android / Fire OS Adapter Class Name: com.applovin.mediation.adapters.PradoMediationAdapter
```
<img width="800" alt="AppLovinCustomNetwork" src="https://raw.githubusercontent.com/Prado-SDK/prado-mobile-sdk/refs/heads/docs/Mediation/AppLovin%20Max%20Adapter/applovin1.png">  
  
Once the Prado Network is properly configured you will now be able to enable and configure the Prado Ad Data in your App's Ad Unit waterfall.<BR>

Replace PUBLISHER_ID and SECURITY_TOKEN with the publisher id and token you received from Prado when you created your publisher account.
```java
  {"publisher_id":"PUBLISHER_ID","token":"SECURITY_TOKEN"}
```
Place the json string in the Custom Parameters field and save.
  
  <img width="800" alt="AppLovin AdUnit Config" src="https://raw.githubusercontent.com/Prado-SDK/prado-mobile-sdk/refs/heads/docs/Mediation/AppLovin%20Max%20Adapter/applovin2.png">

## App-ads.txt
Please set up [app-ads.txt](https://prado.co/app-ads.txt) for all the apps that use Prado sdk. This will increase your fill rate and earnings and will prevent ad serving being blocked.
Follow these instructions on how to [Set up an app-ads.txt file for your app](https://www.prado.co/intro-app-ads-txt).

## CPM Setup
You will need to define your Ad Unit CPM as displayed in your Prado dashboard. Contact a Prado publisher representative for more information at sdk@prado.co.

