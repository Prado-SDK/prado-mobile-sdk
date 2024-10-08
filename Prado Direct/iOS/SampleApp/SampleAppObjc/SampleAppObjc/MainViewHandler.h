//
//  MainViewHandler.h
//  SampleAppObjc
//
//  Created by Maria on 31/07/2023.
//

#import <Foundation/Foundation.h>
#import <CommonSampleApp/CommonSampleApp.h>
#import <PradoSDK/PradoSDK.h>
@class MainViewControllerHandler;

@interface MainViewHandler : NSObject <PradoInitDelegate, PradoInterstitialDelegate, PradoRewardedDelegate, PradoBannerDelegate>

- (void)setViewController:(BaseMainViewController*) baseMainViewController;
- (NSString*)getAppLabel;
- (NSString*)getSDKVersion;

// MARK: - Prado SDK
- (void)initSDK;
- (void)onInitSuccess;
- (void)onInitError:(NSString * _Nonnull)error;

// MARK: - Banner
- (void)loadBanner;
- (void)closeBanner;
- (void)onBannerAdLoadedWithPradoBannerView:(PradoBannerView * _Nonnull)pradoBannerView;
- (void)onBannerAdFailedToLoadWithPradoBannerView:(PradoBannerView * _Nonnull)pradoBannerView error:(PradoError * _Nonnull)error;
- (void)onBannerAdShownWithPradoBannerView:(PradoBannerView * _Nonnull)pradoBannerView;
- (void)onBannerAdFailedToShowWithPradoBannerView:(PradoBannerView * _Nonnull)pradoBannerView error:(PradoError * _Nonnull)error;
- (void)onBannerAdImpressionWithPradoBannerView:(PradoBannerView * _Nonnull)pradoBannerView;
- (void)onBannerAdClosedWithPradoBannerView:(PradoBannerView * _Nonnull)pradoBannerView;

// MARK: - Interstitial ad
- (void)loadInterstitial;
- (void)showInterstitial;
- (void)onInterstitialAdLoadedWithPradoInterstitialAd:(PradoInterstitialAd * _Nonnull)pradoInterstitialAd;
- (void)onInterstitialAdFailedToLoadWithPradoError:(PradoError * _Nonnull)pradoError;
- (void)onInterstitialAdShownWithPradoInterstitialAd:(PradoInterstitialAd * _Nonnull)pradoInterstitialAd;
- (void)onInterstitialAdFailedToShowWithPradoInterstitialAd:(PradoInterstitialAd * _Nonnull)pradoInterstitialAd pradoError:(PradoError * _Nonnull)pradoError;
- (void)onInterstitialImpressionWithPradoInterstitialAd:(PradoInterstitialAd * _Nonnull)pradoInterstitialAd;
- (void)onInterstitialAdClosedWithPradoInterstitialAd:(PradoInterstitialAd * _Nonnull)pradoInterstitialAd;

// MARK: - Rewarded ad
- (void)loadRewarded;
- (void)showRewarded;
- (void)onRewardedAdLoadedWithPradoRewardedAd:(PradoRewardedAd * _Nonnull)pradoRewardedAd;
- (void)onRewardedAdFailedToLoadWithPradoError:(PradoError * _Nonnull)pradoError;
- (void)onRewardedAdShownWithPradoRewardedAd:(PradoRewardedAd * _Nonnull)pradoRewardedAd;
- (void)onRewardedAdFailedToShowWithPradoRewardedAd:(PradoRewardedAd * _Nonnull)pradoRewardedAd pradoError:(PradoError * _Nonnull)pradoError;
- (void)onRewardReceivedWithPradoRewardedAd:(PradoRewardedAd * _Nonnull)pradoRewardedAd;
- (void)onRewardedImpressionWithPradoRewardedAd:(PradoRewardedAd * _Nonnull)pradoRewardedAd;
- (void)onRewardedAdClosedWithPradoRewardedAd:(PradoRewardedAd * _Nonnull)pradoRewardedAd;

@end
