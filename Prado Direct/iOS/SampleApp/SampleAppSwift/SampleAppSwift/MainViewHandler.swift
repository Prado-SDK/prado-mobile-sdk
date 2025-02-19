//
//  MainViewHandler.swift
//  SampleApp
//
//  Created by Maria on 25/07/2023.
//

import Foundation
import PradoSDK
import CommonSampleApp

public class MainViewHandler: NSObject, MainViewControllerHandler, PradoInitDelegate, PradoInterstitialDelegate, PradoRewardedDelegate, PradoBannerDelegate {
    
    var baseMainViewController: BaseMainViewController!
    var bannerView: PradoBannerView!
    var interstitialAd: PradoSDK.PradoInterstitialAd?
    var rewardedAd: PradoSDK.PradoRewardedAd?
    
    public func setViewController(baseMainViewController: BaseMainViewController) {
        self.baseMainViewController = baseMainViewController
    }
    
    public func getAppLabel() -> String {
        return "Prado Sample App"
    }
    
    public func getSDKVersion() -> String {
        return Prado.getSdkVersion()
    }
    
    public func initSDK() {
        Prado.instance.initialize(publisherID: "15492", securityToken: "4b4982c7c7429ba2006852c2ef9f684f", delegate: self)
    }
    
    public func onInitSuccess() {
        initBannerWithView()
        baseMainViewController.onSDKInitSuccess()
    }
    
    public func onInitError(_ errorMessage: String) {
        baseMainViewController.onSDKInitFailure(error: errorMessage)
    }
    
    // MARK: - Banner
    public func loadBanner() {
        if Prado.instance.isSDKInitialized() {
            bannerView.load()
        } else {
            baseMainViewController.logOut(message: "SDK not initialized")
        }
    }
    
    public func closeBanner() {
        bannerView.close()
        bannerView.removeFromSuperview()
        bannerView = nil
        initBannerWithView()
    }
    
    public func onBannerAdLoaded(pradoBannerView: PradoSDK.PradoBannerView) {
        baseMainViewController.onBannerLoaded()
    }
    
    public func onBannerAdFailedToLoad(pradoBannerView: PradoSDK.PradoBannerView, error: PradoSDK.PradoError) {
        baseMainViewController.onBannerLoadFailed(error: error.description)
    }
    
    public func onBannerAdShown(pradoBannerView: PradoSDK.PradoBannerView) {
        baseMainViewController.onBannerOpened()
    }
    
    public func onBannerAdFailedToShow(pradoBannerView: PradoSDK.PradoBannerView, error: PradoSDK.PradoError) {
        baseMainViewController.onBannerShowFailed(error: error.description)
    }
    
    public func onBannerAdImpression(pradoBannerView: PradoSDK.PradoBannerView) {
        baseMainViewController.onBannerImpression()
    }
    
    public func onBannerAdClosed(pradoBannerView: PradoSDK.PradoBannerView) {
        baseMainViewController.onBannerClosed()
    }

    // MARK: - Interstitial ad
    public func loadInterstitial() {
        if Prado.instance.isSDKInitialized() {
            PradoInterstitialAd.load(delegate: self)
        } else {
            baseMainViewController.logOut(message: "SDK not initialized")
        }
    }
    
    public func showInterstitial() {
        if let intestitial = interstitialAd, intestitial.isLoaded() {
            intestitial.show(viewController: baseMainViewController)
        } else {
            baseMainViewController.logOut(message: "Interstitial not ready")
        }
    }
    
    public func onInterstitialAdLoaded(pradoInterstitialAd ad: PradoSDK.PradoInterstitialAd) {
        self.interstitialAd = ad
        baseMainViewController.onInterstitialLoaded()
    }
    
    public func onInterstitialAdFailedToLoad(pradoError error: PradoSDK.PradoError) {
        baseMainViewController.onInterstitialLoadFailed(error: error.description)
    }
    
    public func onInterstitialAdFailedToShow(pradoInterstitialAd: PradoSDK.PradoInterstitialAd, pradoError: PradoSDK.PradoError) {
        baseMainViewController.onInterstitialShowFailed(error: pradoError.description)
    }
    
    public func onInterstitialAdShown(pradoInterstitialAd ad: PradoSDK.PradoInterstitialAd) {
        baseMainViewController.onInterstitialOpened()
    }
    
    public func onInterstitialImpression(pradoInterstitialAd: PradoSDK.PradoInterstitialAd) {
        baseMainViewController.onInterstitialImpression()
    }
    
    public func onInterstitialAdClosed(pradoInterstitialAd ad: PradoSDK.PradoInterstitialAd) {
        baseMainViewController.onInterstitialClosed()
    }
    
    // MARK: - Rewarded ad
    public func loadRewarded() {
        if Prado.instance.isSDKInitialized() {
            PradoRewardedAd.load(delegate: self)
        } else {
            baseMainViewController.logOut(message: "SDK not initialized")
        }
    }
    
    public func showRewarded() {
        if let rewarded = rewardedAd, rewarded.isLoaded() {
            rewarded.show(viewController: baseMainViewController)
        } else {
            baseMainViewController.logOut(message: "Rewarded not ready")
        }
    }
    
    public func onRewardedAdLoaded(pradoRewardedAd ad: PradoSDK.PradoRewardedAd) {
        rewardedAd = ad
        baseMainViewController.onRewardedLoaded()
    }
    
    public func onRewardedAdFailedToLoad(pradoError error: PradoSDK.PradoError) {
        baseMainViewController.onRewardedLoadFailed(error: error.description)
    }
    
    public func onRewardedAdShown(pradoRewardedAd ad: PradoSDK.PradoRewardedAd) {
        baseMainViewController.onRewardedOpened()
    }
    
    public func onRewardedAdFailedToShow(pradoRewardedAd: PradoSDK.PradoRewardedAd, pradoError: PradoSDK.PradoError) {
        baseMainViewController.onRewardedShowFailed(error: pradoError.description)
    }
    
    public func onRewardedImpression(pradoRewardedAd: PradoSDK.PradoRewardedAd) {
        baseMainViewController.onRewardedImpression()
    }
    
    public func onRewardReceived(pradoRewardedAd ad: PradoSDK.PradoRewardedAd) {
        baseMainViewController.onRewardAchieved()
    }
    
    public func onRewardedAdClosed(pradoRewardedAd ad: PradoSDK.PradoRewardedAd) {
        baseMainViewController.onRewardedClosed()
    }
    
    func initBannerWithView() {
        if let view = baseMainViewController.view {
            bannerView = PradoBannerView()
            bannerView.delegate = self
            bannerView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(bannerView)
            view.addConstraints(
                [NSLayoutConstraint(
                    item: bannerView!,
                    attribute: .bottom,
                    relatedBy: .equal,
                    toItem: baseMainViewController.bottomLayoutGuide,
                    attribute: .top,
                    multiplier: 1,
                    constant: 0),
                 NSLayoutConstraint(
                    item: bannerView!,
                    attribute: .centerX,
                    relatedBy: .equal,
                    toItem: view,
                    attribute: .centerX,
                    multiplier: 1,
                    constant: 0),
                 NSLayoutConstraint(
                    item: bannerView!,
                    attribute: .height,
                    relatedBy: .equal,
                    toItem: nil,
                    attribute: .notAnAttribute,
                    multiplier: 0,
                    constant: 50),
                 NSLayoutConstraint(
                    item: bannerView!,
                    attribute: .width,
                    relatedBy: .equal,
                    toItem: nil,
                    attribute: .notAnAttribute,
                    multiplier: 0,
                    constant: 320)])

        }
    }
}
