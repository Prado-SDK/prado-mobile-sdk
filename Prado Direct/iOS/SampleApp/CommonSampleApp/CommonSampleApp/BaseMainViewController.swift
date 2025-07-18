//
//  BaseMainViewController.swift
//  SampleApp
//
//  Created by Maria on 26/07/2023.
//

import UIKit
import MessageUI
import PradoSDK

@objc public class BaseMainViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    var mainViewHandler: MainViewControllerHandler!
    var firstTimeViewAppears = true
    
    @IBOutlet weak var logText: UITextView!
    @IBOutlet weak var appLabel: UILabel!
    
    @IBOutlet weak var loadInterstitialBtn: UIButton!
    @IBOutlet weak var showInterstitialBtn: UIButton!
    
    @IBOutlet weak var loadRewardedBtn: UIButton!
    @IBOutlet weak var showRewardedBtn: UIButton!
    
    @IBOutlet weak var loadBannerBtn: UIButton!
    @IBOutlet weak var closeBannerBtn: UIButton!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        loadInterstitialBtn.isEnabled = false
        showInterstitialBtn.isEnabled = false
        loadRewardedBtn.isEnabled = false
        showRewardedBtn.isEnabled = false
        loadBannerBtn.isEnabled = false
        closeBannerBtn.isEnabled = false
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        if firstTimeViewAppears {
            firstTimeViewAppears = false
            appLabel.text = mainViewHandler.getAppLabel()
            logOut(message: "SDK Version \(getSDKVersion())")
            logOut(message: "Initilalizing SDK...")
            mainViewHandler.initSDK()
        }
    }
    
    @objc public func setMainViewHandler(mainViewHandler: MainViewControllerHandler) {
        self.mainViewHandler = mainViewHandler
        mainViewHandler.setViewController(baseMainViewController: self)
    }
    
    @objc public func logOut(message: String) {
        logText.text = logText.text + message + "\n"
        let location = logText.text.count - 1
        let bottom = NSRange(location: location, length: 1)
        logText.scrollRangeToVisible(bottom)
        NSLog(message)
    }
    
    @objc func getSDKVersion() -> String {
        let sdkVersion: String = mainViewHandler.getSDKVersion(), build = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
        return "\(sdkVersion)(\(build))"
    }
    
    // MARK: - SDK
    @objc public func onSDKInitSuccess() {
        logOut(message: "SDK Init Success")
        loadInterstitialBtn.isEnabled = true
        loadRewardedBtn.isEnabled = true
        loadBannerBtn.isEnabled = true
    }
    
    @objc public func onSDKInitFailure(error: String!) {
        logOut(message: "SDK Init Error: " + error)
    }
    
    // MARK: - Interstitial
    @IBAction func loadInterstitial(_ sender: Any) {
        logOut(message: "----- Load Interstitial --")
        loadInterstitialBtn.isEnabled = false
        mainViewHandler.loadInterstitial()
    }
    
    @IBAction func showInterstitial(_ sender: Any) {
        logOut(message: "----- Show Interstitial --")
        showInterstitialBtn.isEnabled = false
        mainViewHandler.showInterstitial()
    }
    
    @objc public func onInterstitialClosed() {
        logOut(message: "Interstitial Closed")
        loadInterstitialBtn.isEnabled = true
        showInterstitialBtn.isEnabled = false
    }
    
    @objc public func onInterstitialOpened() {
        logOut(message: "Interstitial Shown")
    }
    
    @objc public func onInterstitialLoaded() {
        logOut(message: "Interstitial Loaded")
        loadInterstitialBtn.isEnabled = false
        showInterstitialBtn.isEnabled = true
    }
    
    @objc public func onInterstitialLoadFailed(error: String!) {
        logOut(message: "Interstitial Failed to Load:: " + error)
        loadInterstitialBtn.isEnabled = true
        showInterstitialBtn.isEnabled = false
    }
    
    @objc public func onInterstitialShowFailed(error: String!) {
        logOut(message: "Interstitial Failed to Show:: " + error)
        loadInterstitialBtn.isEnabled = true
        showInterstitialBtn.isEnabled = false
    }
    
    @objc public func onInterstitialImpression() {
        logOut(message: "Interstitial Impression")
    }
    
    // MARK: - Rewarded
    @IBAction func loadRewarded(_ sender: Any) {
        logOut(message: "----- Load Rewarded --")
        loadRewardedBtn.isEnabled = false
        mainViewHandler.loadRewarded()
    }
    
    @IBAction func showRewarded(_ sender: Any) {
        logOut(message: "----- Show Rewarded --")
        showRewardedBtn.isEnabled = false
        mainViewHandler.showRewarded()
    }
    
    @objc public func onRewardedClosed() {
        logOut(message: "Rewarded Closed")
        loadRewardedBtn.isEnabled = true
        showRewardedBtn.isEnabled = false
    }
    
    @objc public func onRewardedOpened() {
        logOut(message: "Rewarded Shown")
    }
    
    @objc public func onRewardedLoaded() {
        logOut(message: "Rewarded Loaded")
        showRewardedBtn.isEnabled = true
    }
    
    @objc public func onRewardedLoadFailed(error: String!) {
        logOut(message: "Rewarded Failed to Load::" + error)
        loadRewardedBtn.isEnabled = true
        showRewardedBtn.isEnabled = false
    }
    
    @objc public func onRewardedShowFailed(error: String!) {
        logOut(message: "Rewarded Failed to Show::" + error)
        loadRewardedBtn.isEnabled = true
        showRewardedBtn.isEnabled = false
    }
    
    @objc public func onRewardAchieved() {
        logOut(message: "Reward Received")
    }
    
    @objc public func onRewardedImpression() {
        logOut(message: "Rewarded Impression")
    }
    
    // MARK: - Banner
    @IBAction func loadBanner(_ sender: Any) {
        logOut(message: "----- Load Banner --")
        loadBannerBtn.isEnabled = false
        mainViewHandler.loadBanner()
    }
    
    @IBAction func closeBanner(_ sender: Any) {
        logOut(message: "----- Close Banner --")
        mainViewHandler.closeBanner()
        closeBannerBtn.isEnabled = false
    }
    
    @objc public func onBannerClosed() {
        logOut(message: "Banner Closed")
        loadBannerBtn.isEnabled = true
        closeBannerBtn.isEnabled = false
        
    }
    
    @objc public func onBannerOpened() {
        logOut(message: "Banner Shown")
    }
    
    @objc public func onBannerLoaded() {
        logOut(message: "Banner Loaded")
        closeBannerBtn.isEnabled = true
    }
    
    @objc public func onBannerLoadFailed(error: String!) {
        logOut(message: "Banner Failed to Load::" + error)
        loadBannerBtn.isEnabled = true
        closeBannerBtn.isEnabled = false
    }
    
    @objc public func onBannerShowFailed(error: String!) {
        logOut(message: "Banner Failed to Show::" + error)
        loadBannerBtn.isEnabled = true
        closeBannerBtn.isEnabled = false
    }
    
    @objc public func onBannerImpression() {
        logOut(message: "Banner Impression")
    }
    
    @objc public static func launchScreen(viewController: UIViewController, mainViewHandler: MainViewControllerHandler) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: BaseMainViewController.self))
        
        if let mainViewController = storyboard.instantiateViewController(withIdentifier: "baseMainViewController") as? BaseMainViewController {
            UIApplication.shared.keyWindow?.rootViewController = mainViewController
            mainViewController.setMainViewHandler(mainViewHandler: mainViewHandler)
            viewController.present(mainViewController, animated: false)
        }
    }
}
