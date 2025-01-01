using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.UIElements;

using PradoSDK;

public class MainCode : MonoBehaviour, IScreenLogger
{


    private Text logScreen;
    public GameObject LogScreenContainer;
    private ScrollRect scrollRect;

    private List<string> Eventlog = new List<string>();

    // Start is called before the first frame update
    void Start()
    {

        GameObject.FindGameObjectWithTag("appLabel").GetComponent<Text>().text = "Prado Unity Plugin";

        logScreen = LogScreenContainer.GetComponent<Text>();
        scrollRect = GetComponentInChildren<ScrollRect>();
        AddEvent("SDK init..");
        initSDK();
    }

    protected void initSDK()
    {
        const string publisher_id = "14428";
		const string token = "6yAsKUngaG5yC4X5HsRoatKTso40NMoZ";

        Prado.init(publisher_id, token);
        Prado.SetiOSAppPauseOnBackground(true);

        //Delegates
        Prado.initSuccess += onSDKInit;
        Prado.initError += onSDKInitFailed;

        Prado.onInterstitialLoaded += onInterstitialLoaded;
        Prado.onInterstitialFailedToLoad += onInterstitialFailedToLoad;
        Prado.onInterstitialShown += onInterstitialShown;
        Prado.onInterstitialFailedToShow += onInterstitialFailedToShow;
        Prado.onInterstitialImpression += onInterstitialImpression;
        Prado.onInterstitialClosed += onInterstitialClosed;


        Prado.onRewardedLoaded += onRewardedLoaded;
        Prado.onRewardedFailedToLoad += onRewardedFailedToLoad;
        Prado.onRewardedShown += onRewardedShown;
        Prado.onRewardedFailedToShow += onRewardedFailedToShow;
        Prado.onRewardedImpression += onRewardedImpression;
        Prado.onRewardedReceived += onRewardedReceived;
        Prado.onRewardedClosed += onRewardedClosed;

        Prado.onBannerLoaded += onBannerLoaded;
        Prado.onBannerFailedToLoad += onBannerFailedToLoad;
        Prado.onBannerShown += onBannerShown;
        Prado.onBannerFailedToShow += onBannerFailedToShow;
        Prado.onBannerImpression += onBannerImpression;
        Prado.onBannerClosed += onBannerClosed;

    }

    protected void onSDKInit(string value)
    {
        AddEvent("SDK initialized");
    }

    protected void onSDKInitFailed(string error)
    {
        AddEvent("SDK failed to init: " + error);
    }

    // Banners

    public void loadBanner()
    {
        AddEvent("----- Load Banner --");
        Prado.loadBanner(true, Prado.BANNER_POSITION.BOTTOM_CENTER);
    }

    public void closeBanner()
    {
        AddEvent("----- Close Banner --");
        Prado.hideBanner();
    }

    protected void onBannerLoaded(string value)
    {
        AddEvent("Banner Loaded");
    }

    protected void onBannerFailedToLoad(string value)
    {
        AddEvent("Banner Failed to Load:: " + value);
    }

    protected void onBannerShown(string value)
    {
        AddEvent("Banner Shown");
    }

    protected void onBannerFailedToShow(string value)
    {
        AddEvent("Banner Failed to Show:: " + value);
    }

    protected void onBannerImpression(string value)
    {
        AddEvent("Banner Impression " + value);
    }

    protected void onBannerClosed(string value)
    {
        AddEvent("Banner Closed");
    }

    // Interstitial

    public void loadInterstitial()
    {
        AddEvent("----- Load Interstitial --");
        Prado.loadInterstitialAd();
    }

    public void showInterstitial()
    {
        AddEvent("----- Show Interstitial --");
        Prado.showInterstitial();
    }

    protected void onInterstitialLoaded(string value)
    {
        AddEvent("Interstitial Loaded");
    }

    protected void onInterstitialFailedToLoad(string value)
    {
        AddEvent("Interstitial Failed to Load:: " + value);
    }

    protected void onInterstitialShown(string value)
    {
        AddEvent("Interstitial Shown");
    }

    protected void onInterstitialFailedToShow(string value)
    {
        AddEvent("Interstitial Failed to Show:: " + value);
    }

    protected void onInterstitialImpression(string value)
    {
        AddEvent("Interstitial Impression");
    }

    protected void onInterstitialClosed(string value)
    {
        AddEvent("Interstitial Closed");
    }

    // Rewarded

    public void loadRewarded()
    {
        AddEvent("----- Load Rewarded --");
        Prado.loadRewardedAd();
    }

    public void showRewarded()
    {
        AddEvent("----- Show Rewarded --");
        Prado.showRewarded();
    }

    protected void onRewardedLoaded(string value)
    {
        AddEvent("Rewarded Loaded");
    }

    protected void onRewardedFailedToLoad(string value)
    {
        AddEvent("Rewarded Failed to Load:: " + value);
    }

    protected void onRewardedShown(string value)
    {
        AddEvent("Rewarded Shown");
    }

    protected void onRewardedFailedToShow(string value)
    {
        AddEvent("Rewarded Failed to Show:: " + value);
    }

    protected void onRewardedImpression(string value)
    {
        AddEvent("Rewarded Impression " + value);
    }

    protected void onRewardedReceived(string value)
    {
        AddEvent("Reward Received");
    }

    protected void onRewardedClosed(string value)
    {
        AddEvent("Rewarded Closed");
    }

    // Logs

    public void AddEvent(string eventString)
    {
        Eventlog.Add(eventString);

        string text = "";

        foreach (string logEvent in Eventlog)
        {
            text += logEvent;
            text += "\n";
        }
        logScreen.text = text;

        StartCoroutine(AutoScroll());

    }

    IEnumerator AutoScroll()
    {
        // Wait for end of frame AND force update all canvases before setting to bottom.
        yield return new WaitForEndOfFrame();
        Canvas.ForceUpdateCanvases();
        scrollRect.verticalNormalizedPosition = 0f;
        Canvas.ForceUpdateCanvases();
    }

    // Update is called once per frame
    void Update()
    {
        // Make sure user is on Android platform
        if (Application.platform == RuntimePlatform.Android)
        {

            // Check if Back was pressed this frame
            if (Input.GetKeyDown(KeyCode.Escape))
            {

                // Quit the application
                Application.Quit();
            }
        }
    }

}
