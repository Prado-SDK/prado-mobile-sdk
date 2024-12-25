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
Follow these instructions on how to [Set up an app-ads.txt file for your app](https://www.kidoz.net/intro-app-ads-txt).

## CPM Setup
You will need to define your Admob Ad Units CPM and align them with Prado eCPM displayed in your Prado dashboard. Contact a Prado publisher representative for more information at sdk@prado.co

## Important note:
While mapping the Prado Ad unit on Admob, it is highly recommended to run some JSON validator on the parameters passed to the Class name (AppID and Token). This method may minimize parsing mistakes that may arise on initial connection.
