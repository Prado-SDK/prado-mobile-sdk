using System;
using AOT;
using PRADONativeInterface;
using System.Runtime.InteropServices;

namespace PRADOiOSInterface {
#if UNITY_IOS
	public class PRADOiOSInterface : PRADONativeInterface.PRADONativeInterface
	{

		enum PradoSDKEvents {
			SDK_INIT_SUCCESS,
			SDK_INIT_ERROR,

			PRADO_INTERSTITIAL_LOADED,
			PRADO_INTERSTITIAL_FAILED_TO_LOAD,
			PRADO_INTERSTITIAL_SHOWN,
			PRADO_INTERSTITIAL_FAILED_TO_SHOW,
			PRADO_INTERSTITIAL_IMPRESSION,
			PRADO_INTERSTITIAL_CLOSED,
    
			PRADO_REWARDED_LOADED,
			PRADO_REWARDED_FAILED_TO_LOAD,
			PRADO_REWARDED_SHOWN,
			PRADO_REWARDED_FAILED_TO_SHOW,
			PRADO_REWARDED_IMPRESSION,
			PRADO_REWARDED_RECEIVED,
			PRADO_REWARDED_CLOSED,
    
			PRADO_BANNER_LOADED,
			PRADO_BANNER_FAILED_TO_LOAD,
			PRADO_BANNER_SHOWN,
			PRADO_BANNER_FAILED_TO_SHOW,
			PRADO_BANNER_IMPRESSION,
			PRADO_BANNER_CLOSED
		};
		
		[DllImport("__Internal")]
		private static extern void PradoInit(string developerID ,string securityToken ,DelegateMessage callback,string pluginVersion);
		
		[DllImport("__Internal")]
		private static extern bool PradoIsInitialised();
		
		[DllImport("__Internal")]
		private static extern void PradoLogMessage(string message);
		
		[DllImport("__Internal")]
		private static extern IntPtr PradoGetSDKVersion();

		[DllImport("__Internal")]
		private static extern void PradoLoadInterstitialAd();
		
		[DllImport("__Internal")]
		private static extern void PradoShowInterstitial();
		
		[DllImport("__Internal")]
		private static extern bool PradoGetIsInterstitialLoaded();
		
		[DllImport("__Internal")]
		private static extern void PradoLoadRewardedAd();
		
		[DllImport("__Internal")]
		private static extern void PradoShowRewarded();
		
		[DllImport("__Internal")]
		private static extern bool PradoGetRewardedLoaded();
		
		[DllImport("__Internal")]
		private static extern void PradoLoadBannerAd(bool autoShow,int position);
		
		[DllImport("__Internal")]
		private static extern void PradoSetBannerPosition(int position);
		
		[DllImport("__Internal")]
		private static extern void PradoShowBanner();
		
		[DllImport("__Internal")]
		private static extern void PradoHideBanner();		
		
		private delegate void DelegateMessage(int number,string message);
		
		[MonoPInvokeCallback(typeof(DelegateMessage))] 
		private static void delegateMessageReceived(int number,string message) {
			
			switch((PradoSDKEvents)number){
				
			case PradoSDKEvents.SDK_INIT_SUCCESS:
				PradoSDK.Prado.Instance.initSuccessCallback("");
				break;				
			case PradoSDKEvents.SDK_INIT_ERROR:
				PradoSDK.Prado.Instance.initErrorCallback(message);
				break;
						
			case PradoSDKEvents.PRADO_INTERSTITIAL_LOADED:
				PradoSDK.Prado.Instance.interstitialLoadedCallBack("");
				break;
			case PradoSDKEvents.PRADO_INTERSTITIAL_FAILED_TO_LOAD:
				PradoSDK.Prado.Instance.interstitialFailedToLoadCallBack(message);
				break;	
			case PradoSDKEvents.PRADO_INTERSTITIAL_SHOWN:
				PradoSDK.Prado.Instance.interstitialShownCallBack("");
				break;
			case PradoSDKEvents.PRADO_INTERSTITIAL_FAILED_TO_SHOW:
				PradoSDK.Prado.Instance.interstitialFailedToShowCallBack(message);
				break;
			case PradoSDKEvents.PRADO_INTERSTITIAL_IMPRESSION:
				PradoSDK.Prado.Instance.interstitialImpressionCallBack("");
				break;
			case PradoSDKEvents.PRADO_INTERSTITIAL_CLOSED:
				PradoSDK.Prado.Instance.interstitialClosedCallBack("");
				break;				

				
			case PradoSDKEvents.PRADO_REWARDED_LOADED:
				PradoSDK.Prado.Instance.rewardedLoadedCallBack("");
				break;
			case PradoSDKEvents.PRADO_REWARDED_FAILED_TO_LOAD:
				PradoSDK.Prado.Instance.rewardedFailedToLoadCallBack(message);
				break;	
			case PradoSDKEvents.PRADO_REWARDED_SHOWN:
				PradoSDK.Prado.Instance.rewardedShownCallBack("");
				break;
			case PradoSDKEvents.PRADO_REWARDED_FAILED_TO_SHOW:
				PradoSDK.Prado.Instance.rewardedFailedToShowCallBack(message);
				break;
			case PradoSDKEvents.PRADO_REWARDED_IMPRESSION:
				PradoSDK.Prado.Instance.rewardedImpressionCallBack("");
				break;
			case PradoSDKEvents.PRADO_REWARDED_RECEIVED:
				PradoSDK.Prado.Instance.rewardedReceivedCallBack("");
				break;
			case PradoSDKEvents.PRADO_REWARDED_CLOSED:
				PradoSDK.Prado.Instance.rewardedClosedCallBack("");
				break;

			case PradoSDKEvents.PRADO_BANNER_LOADED:
				PradoSDK.Prado.Instance.bannerLoadedCallBack("");
				break;
			case PradoSDKEvents.PRADO_BANNER_FAILED_TO_LOAD:
				PradoSDK.Prado.Instance.bannerFailedToLoadCallBack(message);
				break;	
			case PradoSDKEvents.PRADO_BANNER_SHOWN:
				PradoSDK.Prado.Instance.bannerShownCallBack("");
				break;
			case PradoSDKEvents.PRADO_BANNER_FAILED_TO_SHOW:
				PradoSDK.Prado.Instance.bannerFailedToShowCallBack(message);
				break;
			case PradoSDKEvents.PRADO_BANNER_IMPRESSION:
				PradoSDK.Prado.Instance.bannerImpressionCallBack("");
				break;
			case PradoSDKEvents.PRADO_BANNER_CLOSED:
				PradoSDK.Prado.Instance.bannerClosedCallBack("");
				break;				
			}
			
		}
		
		public PRADOiOSInterface()
		{
			
		}
		
		public bool isInitialised()
		{
			return PradoIsInitialised();
		}

		public string getSdkVersion()
		{
			IntPtr versionPtr = PradoGetSDKVersion();
    		string version = Marshal.PtrToStringAnsi(versionPtr);
			return version;
		}
		
		public void init(string developerID, string securityToken,string pluginVersion)
		{			
			PradoInit(developerID,securityToken,delegateMessageReceived,pluginVersion);			
		}
		
		//***********************************//
		//***** INTERSTITIAL & REWARDED *****//
		//***********************************//
		
		
		public void loadInterstitialAd()
		{
			PradoLoadInterstitialAd();
		}
		
		public void showInterstitial()
		{
			PradoShowInterstitial();
		}
		
		public bool getIsInterstitialLoaded()
		{
			return  PradoGetIsInterstitialLoaded();
		}
		
		public void loadRewardedAd()
		{
			PradoLoadRewardedAd();
		}
		
		public void showRewarded()
		{
			PradoShowRewarded();
		}
		
		public bool getIsRewardedLoaded()
		{
			return PradoGetRewardedLoaded();
		}
		
		//***********************************//
		
		//************ BANNER ***************//
		
		public void setBannerPosition (int position)
		{	
			PradoSetBannerPosition(position);
		}
		
		public void loadBanner(bool autoShow, int position)
		{	
			PradoLoadBannerAd(autoShow,position);
		}
		
		public void showBanner()
		{
			PradoShowBanner();
		}
		
		public void hideBanner()
		{
			PradoHideBanner();
		}
		
		//***********************************//
		
		public void logMessage(string message)
		{
			PradoLogMessage (message);
		}

	}
	
#endif
}