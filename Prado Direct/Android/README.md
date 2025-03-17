# Prado Android Mobile SDK

## Getting Started:

#### Include the following inside your app build.gradle dependencies:
```groovy
dependencies {
    implementation("co.prado.sdk:prado-android-native:10.0.1")
    implementation("com.kpadplayer.sdk:kpadplayer-android-native:10.0.1")
}
``` 

## SDK initialization
The SDK should be initialized only once in an Activity lifecycle. 

You may run the Sample App with Prado's <B>sample</B> `PUBLISHER_ID` and `TOKEN` provided in the sample code but <B>be sure not to publish your app with them</B>. 

</br>
Initialize the SDK inside your MainActivity's onCreate.

> MainActivity.java

```java
@Override 
protected void onCreate(Bundle savedInstanceState)
{
    ....
    Prado.initialize(this, PUBLISHER_ID, TOKEN, object : PradoInitializationListener {

        override fun onInitSuccess() {
            //SDK Init | Success().
        }

        override fun onInitError(error: PradoError) {
            //SDK Init | Error
        }

    })    
    ...
}
```

## Prado Interstitial
The PradoInterstitialAd is a full screen single ad unit.

#### Displaying Interstitial Ads

To use the Interstitial Ad you first need to load an Ad instance with an PradoInterstitialAdCallback listener :

```java
val mInterstitialAd : PradoInterstitialAd? = null

PradoInterstitialAd.load(this, object : PradoInterstitialAdCallback {
    override fun onAdLoaded(ad: PradoInterstitialAd) {
        pradoInterstitialAd = ad
    }

    override fun onAdFailedToLoad(error: PradoError) {

    }

    override fun onAdShown(ad: PradoInterstitialAd) {

    }

    override fun onAdFailedToShow(ad: PradoInterstitialAd, error: PradoError) {
        pradoInterstitialAd = null
    }

    override fun onAdImpression(ad: PradoInterstitialAd) {

    }

    override fun onAdClosed(ad: PradoInterstitialAd) {
        pradoInterstitialAd = null
    }

})  

```

In order to show the ad once it is loaded call:

```java
mInterstitialAd.show()
```

## Prado Rewarded
PradoRewardedAd is a full screen single ad unit.

#### Displaying Rewarded Ads

To use the Rewarded Ad you first need to load an Ad instance with a PradoRewardedAdCallback listener :

```java
var pradoRewardedAd: PradoRewardedAd? = null

PradoRewardedAd.load(this, object : PradoRewardedAdCallback {
    override fun onAdLoaded(ad: PradoRewardedAd) {
        pradoRewardedAd = ad
    }

    override fun onAdFailedToLoad(error: PradoError) {

    }

    override fun onAdShown(ad: PradoRewardedAd) {

    }

    override fun onAdFailedToShow(ad: PradoRewardedAd, error: PradoError) {
        pradoRewardedAd = null
    }

    override fun onAdImpression(ad: PradoRewardedAd) {

    }

    override fun onRewardReceived(ad: PradoRewardedAd) {

    }

    override fun onAdClosed(ad: PradoRewardedAd) {
        pradoRewardedAd = null
    }

})
    
```



In order to show the ad once it is loaded call:

```java
mRewardedAd.show()
```

## Prado Banner

PradoBannerView is a view that shows banner ads.
 
### Calling PradoBannerView Programmatically

* Create a PradoBannerView instance:
```java
var pradoBannerView = PradoBannerView(<Activity>); 
```

* Set banner position:
```java
pradoBannerView.setBannerPosition(PradoBannerView.Position.BOTTOM_CENTER); 
```

* Set banner listener:
```java 
pradoBannerView.setBannerCallback(object : PradoBannerAdCallback {
    override fun onAdLoaded() {
       
    }

    override fun onAdFailedToLoad(error: PradoError) {
      
      
    }

    override fun onAdShown() {
        
    }

    override fun onAdFailedToShow(error: PradoError) {
        
    }

    override fun onAdImpression() {
        
    }

    override fun onAdClosed() {
        
    }
})
    
```

* Call banner load before showing:
```java
pradoBannerView.load(); 
```

* Call banner show (banner needs to be ready before showing):

```java
pradoBannerView.show(); 
```

* To hide banner:
```java
pradoBannerView.close(); 
```

### Showing PradoBannerView in View Hierarchy
* Add PradoBannerView to your layout (in xml):
```xml
            <co.prado.ads.banners.PradoBannerView
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:id="@+id/<YOUR_ID_NAME>"/>
``` 

* Find PradoBannerView instance in your layout by id:
```java
val pradoBannerView = findViewById(<YOUR_ID_NAME>); 
```



* Required (atm) - Set banner to not show on layout():
```java
pradoBannerView.setLayoutWithoutShowing(); 
```

* Call banner load before showing:
```java
pradoBannerView.load(); 
```

* Call banner show (banner needs to be ready before showing):

```java
pradoBannerView.show(); 
```

* To hide banner:
```java
pradoBannerView.close(); 
```
