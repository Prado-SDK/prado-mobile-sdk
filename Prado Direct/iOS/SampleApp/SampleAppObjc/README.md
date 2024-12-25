# Prado iOS Mobile - Objective-C

## Initialize Prado SDK
Call the initialize method with the Publisher ID and Security Token which you received during [Prado's Publisher onboarding](http://accounts.prado.co/publishers/register?utm_source=prado_github).
```Objective-C 
    [Prado.instance initializeWithPublisherID: <enter your publisher ID> securityToken: <enter your security Token> delegate: <PradoInitDelegate>];
```

You can check Prado SDK state using the following method:  
```Objective-C 
    BOOL initialized = [Prado.instance isSDKInitialized];
```

Report the `PradoInitDelegate` protocol's callbacks:  
```Objective-C 
    - (void)onInitSuccess;
    - (void)onInitError:(NSString * _Nonnull)error;
```
<BR>

## Prado iOS Interstitial Ad 
**Intersitial** is a full screen widget which is designed for showing a full screen advertisement.  
#### Add support for Interstitial ad unit

Load Interstitial ad: 
```Objective-C 
    if ([Prado.instance isSDKInitialized]) {
       [PradoInterstitialAd loadWithDelegate: <PradoInterstitialDelegate>];
    }
```

Show Interstitial ad:  
```Objective-C 
    if (interstitialAd != NULL && [interstitialAd isLoaded] ) {
       [interstitialAd showWithViewController: <YourViewController>];
    }
```

Report the `PradoInterstitialDelegate` protocol's callbacks: 
```Objective-C  
    - (void)onInterstitialAdLoadedWithPradoInterstitialAd:(PradoInterstitialAd * _Nonnull)pradoInterstitialAd;
    - (void)onInterstitialAdFailedToLoadWithPradoError:(PradoError * _Nonnull)pradoError;
    - (void)onInterstitialAdShownWithPradoInterstitialAd:(PradoInterstitialAd * _Nonnull)pradoInterstitialAd;
    - (void)onInterstitialAdFailedToShowWithPradoInterstitialAd:(PradoInterstitialAd * _Nonnull)pradoInterstitialAd pradoError:(PradoError * _Nonnull)pradoError;
    - (void)onInterstitialImpressionWithPradoInterstitialAd:(PradoInterstitialAd * _Nonnull)pradoInterstitialAd;
    - (void)onInterstitialAdClosedWithPradoInterstitialAd:(PradoInterstitialAd * _Nonnull)pradoInterstitialAd;
```
**Prado iOS Interstitial best practices**
- The preferred timing to show Interstitial Ads: Before the game ends, between game levels, after completing a game level.   
- Some Interstitial Ads may contain video with sound. In order to maximize the user experience, it is important to mute or pause game background sounds and pause the game while the Interstitial is displayed. This can be achieved by using `-onInterstitialAdShown:` and `-onInterstitialAdClosed:` callbacks:
```Swift 
onInterstitialAdShown {
    // mute|pause background sounds
    // pause your game 
}

onInterstitialAdClosed(ad: PradoSDK.PradoInterstitialAd) {
    // unmute|resume background sounds
    // resume your game 
}
```
<BR>

## Prado iOS Rewarded Ad
**Rewarded** is a full screen widget which is designed for showing a full screen advertisement.   
#### Add support for Rewarded ad unit

Load Rewarded ad: 
```Objective-C 
    if ([Prado.instance isSDKInitialized]) {
       [PradoRewardedAd loadWithDelegate: <PradoRewardedDelegate>];
    }
```

Show Rewarded ad:  
```Objective-C 
    if (rewardedAd != NULL && [rewardedAd isLoaded] ) {
       [rewardedAd showWithViewController: <YourViewController>];
    }
```

Report the `PradoRewardedDelegate` protocol's callbacks: 
```Objective-C   
    - (void)onRewardedAdLoadedWithPradoRewardedAd:(PradoRewardedAd * _Nonnull)pradoRewardedAd;
    - (void)onRewardedAdFailedToLoadWithPradoError:(PradoError * _Nonnull)pradoError;
    - (void)onRewardedAdShownWithPradoRewardedAd:(PradoRewardedAd * _Nonnull)pradoRewardedAd;
    - (void)onRewardedAdFailedToShowWithPradoRewardedAd:(PradoRewardedAd * _Nonnull)pradoRewardedAd pradoError:(PradoError * _Nonnull)pradoError;
    - (void)onRewardReceivedWithPradoRewardedAd:(PradoRewardedAd * _Nonnull)pradoRewardedAd;
    - (void)onRewardedImpressionWithPradoRewardedAd:(PradoRewardedAd * _Nonnull)pradoRewardedAd;
    - (void)onRewardedAdClosedWithPradoRewardedAd:(PradoRewardedAd * _Nonnull)pradoRewardedAd;
```
**Prado iOS Rewarded best practices**
- The preferred timing to show Rewarded Ads: Based on the implementation of rewarded logic in your game .   
- Some Rewarded Ads may contain video with sound. In order to maximize the user experience, it is important to mute or pause game background sounds and pause the game flow while the Rewarded is displayed. This can be achieved by using `-onRewardedAdShownWithAd:` and `-onRewardedAdClosedWithAd:` callbacks:
```Swift 
onRewardedAdShownWithAd {
    // mute|pause background sounds
    // pause your game 
}

onRewardedAdClosedWithAd {
    // unmute|resume background sounds
    // resume your game 
}
```
<BR>

## Prado iOS Banner 
#### Add support for Banner ad unit

Initialize Banner:
```Objective-C 
    PradoBannerView* bannerView = [[PradoBannerView alloc] init];
    bannerView.delegate = <PradoBannerDelegate>;
```

Load and show Banner:  
```Objective-C 
    if ([Prado.instance isSDKInitialized]) {
       [bannerView load];
    }
``` 

Close Banner:  
```Objective-C 
    [bannerView close];
```  

Report the `PradoBannerDelegate` protocol's callbacks: 
```Objective-C 
    - (void)onBannerAdLoadedWithPradoBannerView:(PradoBannerView * _Nonnull)pradoBannerView;
    - (void)onBannerAdFailedToLoadWithPradoBannerView:(PradoBannerView * _Nonnull)pradoBannerView error:(PradoError * _Nonnull)error;
    - (void)onBannerAdShownWithPradoBannerView:(PradoBannerView * _Nonnull)pradoBannerView;
    - (void)onBannerAdFailedToShowWithPradoBannerView:(PradoBannerView * _Nonnull)pradoBannerView error:(PradoError * _Nonnull)error;
    - (void)onBannerAdImpressionWithPradoBannerView:(PradoBannerView * _Nonnull)pradoBannerView;
    - (void)onBannerAdClosedWithPradoBannerView:(PradoBannerView * _Nonnull)pradoBannerView;
```
