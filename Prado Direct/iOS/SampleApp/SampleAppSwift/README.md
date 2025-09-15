# Prado iOS Mobile SDK - Swift

## Initialize Prado SDK
Call the initialize method with the Publisher ID and Security Token which you received during [Prado's Publisher onboarding](http://accounts.prado.co/publishers/register?utm_source=prado_github).

```Swift
Prado.instance.initialize(publisherID: <enter your publisher ID>, securityToken: <enter your security Token>, delegate: <PradoInitDelegate>)
````

You can check Prado SDK state using the following method:

```Swift
Prado.instance.isSDKInitialized()
```

Report the `PradoInitDelegate` protocol's callbacks:

```Swift
func onInitSuccess()
func onInitError(_ error: String)
```

<BR>

## Prado iOS Interstitial Ad

**Intersitial** is a full screen widget which is designed for showing a full screen advertisement.

#### Add support for Interstitial ad unit

Load Interstitial ad:

```Swift
if Prado.instance.isSDKInitialized() {
   PradoInterstitialAd.load(delegate: <PradoInterstitialDelegate>)
}
```

Show Interstitial ad:

```Swift
if let intestitial = interstitialAd, intestitial.isLoaded() {
   intestitial.show(viewController: <YourViewController>)
}
```

Report the `PradoInterstitialDelegate` protocol's callbacks:

```Swift
func onInterstitialAdLoaded(pradoInterstitialAd: PradoSDK.PradoInterstitialAd)
func onInterstitialAdFailedToLoad(pradoError: PradoSDK.PradoError)
func onInterstitialAdShown(pradoInterstitialAd: PradoSDK.PradoInterstitialAd)   
func onInterstitialAdFailedToShow(pradoInterstitialAd: PradoSDK.PradoInterstitialAd, pradoError: PradoSDK.PradoError)
func onInterstitialImpression(pradoInterstitialAd: PradoSDK.PradoInterstitialAd)
func onInterstitialAdClosed(pradoInterstitialAd: PradoSDK.PradoInterstitialAd)
```

**Prado iOS Interstitial best practices**

* The preferred timing to show Interstitial Ads: Before the game ends, between game levels, after completing a game level .
* Some Interstitial Ads may contain video with sound. In order to maximize the user experience, it is important to mute or pause game background sounds and pause the game while the Interstitial is displayed. This can be achieved by using `-onInterstitialAdShown:` and `-onInterstitialAdClosed:` callbacks:

```Swift
onInterstitialAdShown {
// mute|pause background sounds
// pause your game 
}

onInterstitialAdClosed {
// unmute|resume background sounds
// resume your game 
}
```

<BR>

## Prado iOS Rewarded Ad

**Rewarded**  is a full screen widget which is designed for showing a full screen advertisement.

#### Add support for Rewarded ad unit

Load Rewarded ad:

```Swift
if Prado.instance.isSDKInitialized() {
   PradoRewardedAd.load(delegate: <PradoRewardedDelegate>)
}
```

Show Rewarded ad:

```Swift
if let rewarded = rewardedAd, rewarded.isLoaded() {
rewarded.show(viewController: baseMainViewController)
}
```

Report the `PradoRewardedDelegate` protocol's callbacks:

```Swift
func onRewardedAdLoaded(pradoRewardedAd: PradoSDK.PradoRewardedAd)
func onRewardedAdFailedToLoad(pradoError: PradoSDK.PradoError)
func onRewardedAdShown(pradoRewardedAd: PradoSDK.PradoRewardedAd)
func onRewardedAdFailedToShow(pradoRewardedAd: PradoSDK.PradoRewardedAd, pradoError: PradoSDK.PradoError)
func onRewardReceived(pradoRewardedAd: PradoSDK.PradoRewardedAd)
func onRewardedImpression(pradoRewardedAd: PradoSDK.PradoRewardedAd)
func onRewardedAdClosed(pradoRewardedAd: PradoSDK.PradoRewardedAd)
```

**Prado iOS Rewarded best practices**

* The preferred timing to show Rewarded Ads: Based on the implementation of rewarded logic in your game.
* Some Rewarded Ads may contain video with sound. In order to maximize the user experience, it is important to mute or pause game background sounds and pause the game flow while the Rewarded is displayed. This can be achieved by using `-onRewardedAdShownWithAd:` and `-onRewardedAdClosedWithAd:` callbacks:

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

```Swift
let bannerView = PradoBannerView()
bannerView.delegate = <PradoBannerDelegate>
```

Load and show Banner:

```Swift
if Prado.instance.isSDKInitialized() {
   bannerView.load()
}
```

Close Banner:

```Swift
bannerView.close()
```

Report the `PradoBannerDelegate` protocol's callbacks:

```Swift
func onBannerAdLoaded(pradoBannerView: PradoSDK.PradoBannerView)
func onBannerAdFailedToLoad(pradoBannerView: PradoSDK.PradoBannerView, error: PradoSDK.PradoError)
func onBannerAdShown(pradoBannerView: PradoSDK.PradoBannerView)
func onBannerAdFailedToShow(pradoBannerView: PradoSDK.PradoBannerView, error: PradoSDK.PradoError)
func onBannerAdImpression(pradoBannerView: PradoSDK.PradoBannerView)
func onBannerAdClosed(pradoBannerView: PradoSDK.PradoBannerView)
```

<BR>

## Prado iOS ORTB (Server-to-Server Bidding)

Prado SDK supports Server-to-Server (S2S) bidding integrations for Interstitial, Rewarded, and Banner ad types.

The flow inside your app is:

1. **Get a Bid Signal from the SDK**
   Call the SDK’s `getSignal()` method for the desired ad unit. This returns a string that you send to your server or exchange to request bids.

2. **Request Bids From Your Server** *(out of scope for the SDK)*
   Your server communicates with Prado or other exchanges to obtain bids.

3. **Load a Winning Bid Into the SDK**
   Once you have a winning bid response string, create a `KidozBid` instance and call the relevant `load(bid:delegate:)` method to load the ad.
   
### 1. Initialize the SDK

   Make sure the Prado SDK is initialized before you request bid signals or load ads:
   ```swift
   Prado.instance.initialize(publisherID: <enter your publisher ID>,
                             securityToken: <enter your security Token>,
                             delegate: <PradoInitDelegate>)
```
### 2. Get Bid Signal

```Swift
// Interstitial
let interstitialSignal = PradoInterstitialAd.getSignal()

// Rewarded
let rewardedSignal = PradoRewardedAd.getSignal()

// Banner
let bannerSignal = PradoBannerView.getSignal()
```

### 3. Create a `KidozBid` From the Winning Bid Response

```Swift
let kidozBid = KidozBid(bidResponse: String)
```

### 4. Load the Ad With the Bid

```Swift
// Interstitial
PradoInterstitialAd.load(bid: kidozBid, delegate: self)

// Rewarded
PradoRewardedAd.load(bid: kidozBid, delegate: self)

// Banner
bannerView.load(bid: kidozBid, delegate: self)
```

You continue to implement the same delegate callbacks (`PradoInterstitialDelegate`, `PradoRewardedDelegate`, `PradoBannerDelegate`) to receive load/show/close events as with the standard loading methods.

