# ironSource LevelPlay Adapter

Prado ironSource LevelPlay Adapter supports the following ad formats:

+ Interstitial 
+ Rewarded Video
+ Banner

On the following platforms:

+ [Native Android](/Mediation/IronSource%20LevelPlay%20Adapter/Android)
+ [Native iOS](/Mediation/IronSource%20LevelPlay%20Adapter/iOS)
+ [Unity](/Mediation/IronSource%20LevelPlay%20Adapter/Unity)

## Prerequisites
  
Before publishing your first app please complete the process for [Prado's Publisher onboarding](http://accounts.kidoz.net/publishers/register?utm_source=prado_github)  
and follow the instructions for [ironSource Custom Adapter setup](https://developers.is.com/ironsource-mobile/general/custom-adapter-setup/).<BR><BR>
Prado Network ID on ironSource is `15c051899` and you will need to setup the network level parameters with the `Publisher Id` and `Token` you got from Prado:  
  
  <img width="598" alt="ironSourceNetwork" src="https://user-images.githubusercontent.com/86282008/149078934-107106f0-a526-45bc-9c93-8ca53d5bf3cc.png">

## Ad Network Instance configuration
  On Unity Level Play --> SDK Network --> Prado App Settings page <B>Zone</B> field should be set to 1:<BR>

  <img width="598" alt="Prado Wideget Type Settings" src="https://github.com/Prado-SDK/prado-mobile-sdk/assets/86282008/a6d8b409-587e-425c-b45a-37e4446bfa46">

## App-ads.txt
Please set up [app-ads.txt](https://prado.co/app-ads.txt) for all the apps that use Prado sdk. This will increase your fill rate and earnings and will prevent ad serving being blocked.
Follow these instructions on how to [Set up an app-ads.txt file for your app](https://www.prado.co/intro-app-ads-txt).


## CPM Setup
You will need to define your Ad Unit CPM as displayed in your Prado dashboard. Contact a Prado publisher representative for more information at sdk@prado.co.

