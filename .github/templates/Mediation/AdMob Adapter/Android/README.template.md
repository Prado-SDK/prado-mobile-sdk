# Prado Admob Android Adapter

## Requirements
- Android API level 21 or higher
- Prado Android SDK 11.x
- Google Mobile Ads SDK (`com.google.android.gms:play-services-ads`) 23.2.0 or higher

Check out the [Admob Mediation Documentation](https://developers.google.com/admob/android/quick-start) for app level integration.

## Integration Steps:

Include the following inside your app build.gradle dependencies:

```java
dependencies {
    implementation("co.prado.sdk:prado-android-admob-adapter:{{VERSION}}")
}
```
Follow instructions on how to [Set Up Custom Events](https://developers.google.com/admob/android/custom-events/setup#create) on the AdMob dashboard and set up Prado's adapter class:

- Set the following full path in the `Class Name` field: </br>
`co.prado.mediation.admob.adapters.PradoAdMobAdapter`

- Set the following json string in the `Parameter (optional)` field: </br>
`{"AppID":"publisherId", "Token":"publisherToken"}` <B>*</B>

- Replace `publisherId` and `publisherToken` with the credentials received during [Prado's Publisher onboarding](http://accounts.prado.co/publishers/register?utm_source=prado_github).
