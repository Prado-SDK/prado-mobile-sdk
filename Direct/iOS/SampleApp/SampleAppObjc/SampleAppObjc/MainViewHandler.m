//
//  MainViewHandler.m
//  SampleAppObjc
//
//  Created by Maria on 31/07/2023.
//

#import "MainViewHandler.h"

@interface MainViewHandler()
@property (nonatomic, retain) BaseMainViewController* baseMainViewController;
@property (nonatomic, retain) PradoBannerView* bannerView;
@property (nonatomic, retain) PradoInterstitialAd* interstitialAd;
@property (nonatomic, retain) PradoRewardedAd* rewardedAd;
@end

@implementation MainViewHandler

@synthesize baseMainViewController;
@synthesize bannerView;
@synthesize interstitialAd;
@synthesize rewardedAd;

- (void)setViewControllerWithBaseMainViewController:(BaseMainViewController *)baseMainViewController {
    self.baseMainViewController = baseMainViewController;
}

- (NSString * _Nonnull)getAppLabel {
    return @"Prado Sample App";
}

- (NSString * _Nonnull)getSDKVersion {
    return [Prado getSdkVersion];
}

- (void)initSDK {
    [Prado.instance initializeWithPublisherID:@"14428" securityToken:@"6yAsKUngaG5yC4X5HsRoatKTso40NMoZ" delegate:self];
}

- (void)onInitSuccess {
    [self initBannerWithView];
    [baseMainViewController onSDKInitSuccess];
}

- (void)onInitError:(NSString*) errorMessage {
    [baseMainViewController onSDKInitFailureWithError: errorMessage];
}

// MARK: - Banner
- (void)loadBanner {
    if ([Prado.instance isSDKInitialized]) {
        [bannerView load];
    } else {
        [baseMainViewController logOutWithMessage:@"SDK not initialized"];
    }
}

- (void)closeBanner {
    [bannerView close];
    [bannerView removeFromSuperview];
    bannerView = NULL;
    [self initBannerWithView];
}

- (void)onBannerAdLoadedWithPradoBannerView:(PradoBannerView * _Nonnull)pradoBannerView {
    [baseMainViewController onBannerLoaded];
}

- (void)onBannerAdFailedToLoadWithPradoBannerView:(PradoBannerView * _Nonnull)pradoBannerView error:(PradoError * _Nonnull)error {
    [baseMainViewController onBannerLoadFailedWithError: error.description];
}

- (void)onBannerAdShownWithPradoBannerView:(PradoBannerView * _Nonnull)pradoBannerView {
    [baseMainViewController onBannerOpened];
}

- (void)onBannerAdFailedToShowWithPradoBannerView:(PradoBannerView * _Nonnull)pradoBannerView error:(PradoError * _Nonnull)error {
    [baseMainViewController onBannerShowFailedWithError: error.description];
}

- (void)onBannerAdImpressionWithPradoBannerView:(PradoBannerView * _Nonnull)pradoBannerView {
    [baseMainViewController onBannerImpression];
}

- (void)onBannerAdClosedWithPradoBannerView:(PradoBannerView * _Nonnull)pradoBannerView {
    [baseMainViewController onBannerClosed];
}

// MARK: - Interstitial ad
- (void)loadInterstitial {
    if ([Prado.instance isSDKInitialized]) {
        [PradoInterstitialAd loadWithDelegate: self];
    } else {
        [baseMainViewController logOutWithMessage: @"SDK not initialized"];
    }
}

- (void)showInterstitial {
    if (interstitialAd != NULL && [interstitialAd isLoaded] ) {
        [interstitialAd showWithViewController: baseMainViewController];
    } else {
        [baseMainViewController logOutWithMessage: @"Interstitial not ready"];
    }
}

- (void)onInterstitialAdLoadedWithPradoInterstitialAd:(PradoInterstitialAd * _Nonnull)pradoInterstitialAd {
    self.interstitialAd = pradoInterstitialAd;
    [baseMainViewController onInterstitialLoaded];
}

- (void)onInterstitialAdFailedToLoadWithError:(PradoError *)error {
    [baseMainViewController onInterstitialLoadFailedWithError: error.description];
}

- (void)onInterstitialAdFailedToShowWithPradoInterstitialAd:(PradoInterstitialAd * _Nonnull)pradoInterstitialAd pradoError:(PradoError * _Nonnull)pradoError {
    [baseMainViewController onInterstitialShowFailedWithError: pradoError.description];
}

- (void)onInterstitialAdShownWithPradoInterstitialAd:(PradoInterstitialAd * _Nonnull)pradoInterstitialAd {
    [baseMainViewController onInterstitialOpened];
}

- (void)onInterstitialImpressionWithPradoInterstitialAd:(PradoInterstitialAd * _Nonnull)pradoInterstitialAd {
    [baseMainViewController onInterstitialImpression];
}

- (void)onInterstitialAdClosedWithPradoInterstitialAd:(PradoInterstitialAd * _Nonnull)pradoInterstitialAd {
    [baseMainViewController onInterstitialClosed];
}

// MARK: - Rewarded ad
- (void)loadRewarded {
    if ([Prado.instance isSDKInitialized]) {
        [PradoRewardedAd loadWithDelegate: self];
    } else {
        [baseMainViewController logOutWithMessage: @"SDK not initialized"];
    }
}

- (void)showRewarded {
    if (rewardedAd != NULL && [rewardedAd isLoaded] ) {
        [rewardedAd showWithViewController: baseMainViewController];
    } else {
        [baseMainViewController logOutWithMessage: @"Rewarded not ready"];
    }
}

- (void)onRewardedAdLoadedWithPradoRewardedAd:(PradoRewardedAd * _Nonnull)pradoRewardedAd {
    rewardedAd = pradoRewardedAd;
    [baseMainViewController onRewardedLoaded];
}

- (void)onRewardedAdFailedToLoadWithPradoError:(PradoError * _Nonnull)pradoError {
    [baseMainViewController onRewardedLoadFailedWithError: pradoError.description];
}

- (void)onRewardedAdShownWithPradoRewardedAd:(PradoRewardedAd * _Nonnull)pradoRewardedAd {
    [baseMainViewController onRewardedOpened];
}

- (void)onRewardedAdFailedToShowWithPradoRewardedAd:(PradoRewardedAd * _Nonnull)pradoRewardedAd pradoError:(PradoError * _Nonnull)pradoError {
    [baseMainViewController onRewardedShowFailedWithError: pradoError.description];
}

- (void)onRewardedImpressionWithPradoRewardedAd:(PradoRewardedAd * _Nonnull)pradoRewardedAd {
    [baseMainViewController onRewardedImpression];
}

- (void)onRewardReceivedWithPradoRewardedAd:(PradoRewardedAd * _Nonnull)pradoRewardedAd {
    [baseMainViewController onRewardAchieved];
}

- (void)onRewardedAdClosedWithPradoRewardedAd:(PradoRewardedAd * _Nonnull)pradoRewardedAd {
    [baseMainViewController onRewardedClosed];
}

-(void) initBannerWithView {
    if ([baseMainViewController view] != NULL) {
        bannerView = [[PradoBannerView alloc] init];
        bannerView.delegate = self;
        [bannerView setTranslatesAutoresizingMaskIntoConstraints: NO];
        [[baseMainViewController view]addSubview: bannerView];

        NSLayoutConstraint *bottom = [
            NSLayoutConstraint constraintWithItem:bannerView
            attribute:NSLayoutAttributeBottom
            relatedBy:NSLayoutRelationEqual
            toItem:baseMainViewController.bottomLayoutGuide
            attribute:NSLayoutAttributeTop
            multiplier:1
            constant:0
        ];

        NSLayoutConstraint *centerX = [
            NSLayoutConstraint constraintWithItem:bannerView
            attribute:NSLayoutAttributeCenterX
            relatedBy:NSLayoutRelationEqual
            toItem:baseMainViewController.view
            attribute:NSLayoutAttributeCenterX
            multiplier:1
            constant:0
        ];

        NSLayoutConstraint *height = [
            NSLayoutConstraint constraintWithItem:bannerView
            attribute:NSLayoutAttributeHeight
            relatedBy:NSLayoutRelationEqual
            toItem:NULL
            attribute:NSLayoutAttributeNotAnAttribute
            multiplier:0
            constant: 50
        ];

        NSLayoutConstraint *width = [
            NSLayoutConstraint constraintWithItem:bannerView
            attribute:NSLayoutAttributeWidth
            relatedBy:NSLayoutRelationEqual
            toItem:NULL
            attribute:NSLayoutAttributeNotAnAttribute
            multiplier:0
            constant: 320
        ];

        [[baseMainViewController view] addConstraints:@[bottom, centerX, height, width]];
    }
}

@end

