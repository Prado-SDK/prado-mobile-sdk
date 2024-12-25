# Prado Admob iOS Adapter
The Prado Admob adapter was built and tested with Google-Mobile-Ads-SDK v10.8.0.<BR>
The minimum supported Xcode version is 14.1.<BR><BR>
Check out the [Admob Mediation Documentation](https://developers.google.com/admob/ios/quick-start) for app level integration.

## Integration Steps:
To add Prado Admob Adapter to your project with CocoaPods:
```
pod 'PradoSDK', '10.0.0'
pod 'PradoAdmobAdapter', '2.0.0'
```

Follow instructions on how to [Set Up Custom Events](https://developers.google.com/admob/ios/custom-events/setup#create) on the AdMob dashboard and set up Prado's adapter class:

- Set the following full path in the `Class Name` field: </br>
`PradoAdmobAdapter`

- Set the following json string in the `Parameter (optional)` field: </br>
`{"AppID":"publisherId", "Token":"publisherToken"}`

- Replace `publisherId` and `publisherToken` with the credentials received during [Prado's Publisher onboarding](http://accounts.kidoz.net/publishers/register?utm_source=prado_github).

## iOS SKAdNetwork Support

Please make sure to include the Prado ad network ID in your app property list file (Info.plist):

```java
v79kvwwj4g.skadnetwork	
```
For more information, see [Configuring a Source App for SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork/configuring_a_source_app).
