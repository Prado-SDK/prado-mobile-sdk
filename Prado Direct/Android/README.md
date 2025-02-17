# Prado Android Mobile SDK

## Getting Started:

#### Include the following inside your app build.gradle dependencies:
```groovy
dependencies {
    implementation 'net.prado.sdk:prado-android-native:10.0.1'
}
``` 

## SDK initialization
The SDK should be initialized only once in an Activity lifecycle. 

You may run the Sample App with Prado's <B>sample</B> `publisherID` and `securityToken` provided in the sample code but <B>be sure not to publish your app with them</B>. 

</br>
Initialize the SDK inside your MainActivity's onCreate.

> MainActivity.java

```java
@Override 
protected void onCreate(Bundle savedInstanceState)
{
    ....
    Prado.initialize(MainActivity.this, PUBLISHER_ID, TOKEN, new SDKInitializationListener() {
        @Override
        public void onInitSuccess() {
            //SDK Init | Success().
        }

        @Override
        public void onInitError(String error) {
            //SDK Init | Error
        }
    });    
    //the rest of your main activity onCreate
    ...
}
```

## Prado Interstitial
The Prado InterstitialAd is a full screen single ad unit.

#### Displaying Interstitial Ads

To use the Interstitial Ad you first need to load an Ad instance with an InterstitialAdCallback listener :

```java
InterstitialAd mInterstitialAd;

InterstitialAd.load(<Activity>, new InterstitialAdCallback() {
    @Override
    public void onAdLoaded(InterstitialAd ad) {
        mInterstitialAd = ad;
        // onInterstitialLoaded();
    }

    @Override
    public void onAdFailedToLoad(PradoError error) {
        // onInterstitialLoadFailed(...);
    }

    @Override
    public void onAdShown(InterstitialAd ad) {
        // onInterstitialShown();
    }

    @Override
    public void onAdFailedToShow(PradoError error) {
       //  onInterstitialShowFailed(...);
    }

    @Override
    public void onAdImpression() {
        // onInterstitialImpression();
    }

    @Override
    public void onAdClosed(InterstitialAd ad) {
        // onInterstitialClosed();
    }
});
```



In order to show the ad once it is loaded call:

```java
mInterstitialAd.show();
```

## Prado Rewarded
Prado RewardedAd is a full screen single ad unit.

#### Displaying Rewarded Ads

To use the Rewarded Ad you first need to load an Ad instance with a RewardedAdCallback listener :

```java
RewardedAd mRewardedAd;

RewardedAd.load(MainActivity.this, new RewardedAdCallback() {
    @Override
    public void onAdLoaded(RewardedAd ad) {
        mRewardedAd = ad;
        // onRewardedLoaded();
    }

    @Override
    public void onAdFailedToLoad(PradoError error) {
        // onRewardedLoadFailed(...);
    }

    @Override
    public void onAdShown(RewardedAd ad) {
        // onRewardedShown();
    }

    @Override
    public void onAdFailedToShow(PradoError error) {
        // onRewardedShowFailed(...);
    }

    @Override
    public void onAdImpression() {
        // onRewardedImpression();
    }

    @Override
    public void onAdClosed(RewardedAd ad) {
        // onRewardedClosed();
    }

    @Override
    public void onRewardReceived() {
        // onRewardAchieved();
    }

});
```



In order to show the ad once it is loaded call:

```java
mRewardedAd.show();
```

## Prado Banner

PradoBannerView is a view that shows banner ads.
 
### Calling PradoBannerView Programmatically

* Create a PradoBannerView instance:
```java
PradoBannerView pradoBannerView = new PradoBannerView(<Activity>); 
```

* Set banner position:
```java
pradoBannerView.setBannerPosition(BANNER_POSITION.TOP_CENTER / BOTTOM_CENTER); 
```

* Set banner listener:
```java 
pradoBannerView.setPradoBannerListener(new BannerAdCallback() {

            @Override
            public void onAdLoaded() {
                // onBannerLoaded();
            }

            @Override
            public void onAdFailedToLoad(PradoError error) {
                // onBannerLoadFailed(...);
            }

            @Override
            public void onAdShown() {
               // onBannerShown();
            }

            @Override
            public void onAdFailedToShow(PradoError error) {
               // onBannerShowFailed(...);
            }

            @Override
            public void onAdImpression() {
                // onBannerImpression();
            }

            @Override
            public void onAdClosed() {
                // onBannerClosed();
            }
        });
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
pradoBannerView.hide(); 
```

### Showing PradoBannerView in View Hierarchy
* Add PradoBannerView to your layout (in xml):
```xml
            <com.prado.sdk.api.ads.banner.PradoBannerView
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:id="@+id/<YOUR_ID_NAME>"/>
``` 

* Find PradoBannerView instance in your layout by id:
```java
final PradoBannerView pradoBannerView = (PradoBannerView) findViewById(<your banner id>); 
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
pradoBannerView.hide(); 
```
