# Prado Android Mobile SDK

## Getting Started

#### Include the following inside your app build.gradle dependencies:
```groovy
dependencies {
    implementation("co.prado.sdk:prado-android-native:10.1.1")
}
```

## SDK Initialization

The SDK should be initialized only once in an Activity lifecycle.

You may run the Sample App with Prado's **sample** `publisherID` and `securityToken` provided in the sample code but **be sure not to publish your app with them**.

Initialize the SDK inside your MainActivity's `onCreate`:

> MainActivity.kt

```kotlin
override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    ...
    Prado.initialize(this, PUBLISHER_ID, TOKEN, object : PradoInitializationListener {

        override fun onInitSuccess() {
            // SDK Init Success
        }

        override fun onInitError(error: PradoError) {
            // SDK Init Error
        }
    })
    ...
}
```

---

## Prado Interstitial

The `PradoInterstitialAd` is a full screen single ad unit.

#### Displaying Interstitial Ads

To use the Interstitial Ad you first need to load an Ad instance with a `PradoInterstitialAdCallback` listener:

```kotlin
var interstitialAd: PradoInterstitialAd? = null

PradoInterstitialAd.load(this, object : PradoInterstitialAdCallback {
    override fun onAdLoaded(ad: PradoInterstitialAd) {
        interstitialAd = ad
    }

    override fun onAdFailedToLoad(error: PradoError) { }

    override fun onAdShown(ad: PradoInterstitialAd) { }

    override fun onAdFailedToShow(ad: PradoInterstitialAd, error: PradoError) {
        interstitialAd = null
    }

    override fun onAdImpression(ad: PradoInterstitialAd) { }

    override fun onAdClosed(ad: PradoInterstitialAd) {
        interstitialAd = null
    }
})  
```

Show the ad once it is loaded:

```kotlin
interstitialAd?.show()
```

---

## Prado Rewarded

`PradoRewardedAd` is a full screen single ad unit.

#### Displaying Rewarded Ads

```kotlin
var rewardedAd: PradoRewardedAd? = null

PradoRewardedAd.load(this, object : PradoRewardedAdCallback {
    override fun onAdLoaded(ad: PradoRewardedAd) {
        rewardedAd = ad
    }

    override fun onAdFailedToLoad(error: PradoError) { }

    override fun onAdShown(ad: PradoRewardedAd) { }

    override fun onAdFailedToShow(ad: PradoRewardedAd, error: PradoError) {
        rewardedAd = null
    }

    override fun onAdImpression(ad: PradoRewardedAd) { }

    override fun onRewardReceived(ad: PradoRewardedAd) { }

    override fun onAdClosed(ad: PradoRewardedAd) {
        rewardedAd = null
    }
})
```

Show the ad once it is loaded:

```kotlin
rewardedAd?.show()
```

---

## Prado Banner

`PradoBannerView` is a view that shows banner ads.

### Calling PradoBannerView Programmatically

Create a `PradoBannerView` instance:

```kotlin
val pradoBannerView = PradoBannerView(this) 
```

Set banner position:

```kotlin
pradoBannerView.setBannerPosition(PradoBannerView.Position.BOTTOM_CENTER)
```

Disable banner auto show on load:

```kotlin
pradoBannerView.setAutoShow(false)
```

Set banner listener:

```kotlin
pradoBannerView.setBannerCallback(object : PradoBannerAdCallback {
    override fun onAdLoaded() { }

    override fun onAdFailedToLoad(error: PradoError) { }

    override fun onAdShown() { }

    override fun onAdFailedToShow(error: PradoError) { }

    override fun onAdImpression() { }

    override fun onAdClosed() { }
})
```

Load before showing:

```kotlin
pradoBannerView.load() 
```

Show if `setAutoShow(false)` was set:

```kotlin
pradoBannerView.show() 
```

Hide banner:

```kotlin
pradoBannerView.close() 
```

### Showing PradoBannerView in View Hierarchy

Add `PradoBannerView` to your layout (in xml):

```xml
<net.prado.ads.banner.PradoBannerView
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:id="@+id/<YOUR_ID_NAME>"/>
```

Find `PradoBannerView` instance in your layout by id:

```kotlin
val pradoBannerView = findViewById<PradoBannerView>(R.id.<YOUR_ID_NAME>) 
```

Required — Set banner to not show on layout:

```kotlin
pradoBannerView.setLayoutWithoutShowing() 
```

Load before showing:

```kotlin
pradoBannerView.load() 
```

Show banner (needs to be ready):

```kotlin
pradoBannerView.show() 
```

Hide banner:

```kotlin
pradoBannerView.close() 
```

---

## Prado Android ORTB (Server-to-Server Bidding)

Prado Android SDK supports Server-to-Server (S2S) bidding integrations for Interstitial, Rewarded, and Banner ad types.

The flow inside your app is:

1. **Initialize the SDK** (as above).

2. **Get a Bid Signal from the SDK**

```kotlin
// Interstitial
val interstitialSignal: String? = PradoInterstitialAd.getSignal()

// Rewarded
val rewardedSignal: String? = PradoRewardedAd.getSignal()

// Banner
val bannerSignal: String? = PradoBannerView.getSignal()
```

3. **Request Bids From Your Server** *(out of scope for the SDK)*.

4. **Load a Winning Bid Into the SDK**

```kotlin
// Create bid from winning response
val pradoBid = PradoBid("winningBidResponseString")

// Interstitial
PradoInterstitialAd.load(this, pradoBid, object : PradoInterstitialAdCallback {
    override fun onAdLoaded(ad: PradoInterstitialAd) {
        interstitialAd = ad
    }
    override fun onAdFailedToLoad(error: PradoError) { interstitialAd = null }
    override fun onAdShown(ad: PradoInterstitialAd) {}
    override fun onAdFailedToShow(ad: PradoInterstitialAd, error: PradoError) {}
    override fun onAdImpression(ad: PradoInterstitialAd) {}
    override fun onAdClosed(ad: PradoInterstitialAd) { interstitialAd = null }
})

// Rewarded (replace Interstitial with Rewarded)
PradoRewardedAd.load(this, pradoBid, object : PradoRewardedAdCallback {
    override fun onAdLoaded(ad: PradoRewardedAd) {
        rewardedAd = ad
    }
    /* …other callbacks… */
})

// Banner (replace Interstitial with Banner)
pradoBannerView.load(this, pradoBid, object : PradoBannerAdCallback {
    override fun onAdLoaded() { /* … */ }
    /* …other callbacks… */
})
```

You continue to implement the same callback interfaces (`PradoInterstitialAdCallback`, `PradoRewardedAdCallback`, `PradoBannerAdCallback`) to receive load/show/close events as with the standard loading methods.
