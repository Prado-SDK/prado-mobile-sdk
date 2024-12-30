using System;
using PRADONativeInterface;
using System.Runtime.InteropServices;
using System.Collections;
using UnityEngine; 
using UnityEngine.UI;

namespace PRADOAndroidInterface {
#if UNITY_ANDROID
	public class PRADOAndroidInterface : PRADONativeInterface.PRADONativeInterface
	{

		private static AndroidJavaObject pradoBridgeObject = null;
		private AndroidJavaObject activityContext = null;
		
		public PRADOAndroidInterface()
		{
		}

		public void init(string developerID, string securityToken,string pluginVersion)
		{
			
			///get activity
			using (AndroidJavaClass activityClass = new AndroidJavaClass ("com.unity3d.player.UnityPlayer")) {
				activityContext = activityClass.GetStatic<AndroidJavaObject> ("currentActivity");
			}

			string prado_name = PradoSDK.Prado.Instance.gameObject.name;

			//init Prado
			using (var pradoBridgeClass = new AndroidJavaClass ("com.prado.sdk.api.platforms.PradoUnityBridge")) {

				pradoBridgeObject = pradoBridgeClass.CallStatic<AndroidJavaObject> ("getInstance", activityContext);

				pradoBridgeObject.Call ("initialize", new object [] { activityContext, developerID, securityToken,pluginVersion ,prado_name});				

			}

		}

		public bool isInitialised(){
			if (pradoBridgeObject == null) {
				return false;
			}

			return pradoBridgeObject.Call<bool>("isInitialised");
		}
			
		
		//***********************************//
		//***** INTERSTITIAL & REWARDED *****//
		//***********************************//

		public void loadInterstitialAd(bool autoShow)
		{
			pradoBridgeObject.Call("loadInterstitialAd",autoShow);
		}

		public void generateInterstitial()
		{
			pradoBridgeObject.Call("loadInterstitialAd",false);
		}

		public void showInterstitial()
		{
			pradoBridgeObject.Call("showInterstitial");
		}
		
		public bool getIsInterstitialLoaded()
		{
			return pradoBridgeObject.Call<bool>("getIsInterstitialLoaded");
		}

		public void loadRewardedAd(bool autoShow)
		{
			pradoBridgeObject.Call("loadRewardedAd",autoShow);
		}
		
		public void generateRewarded()
		{
			pradoBridgeObject.Call("loadRewardedAd",false);
		}
		
		public void showRewarded()
		{
			pradoBridgeObject.Call("showRewarded");
		}
		
		public bool getIsRewardedLoaded()
		{
			return pradoBridgeObject.Call<bool>("getIsRewardedLoaded");
		}


		//******************//
		//***** BANNER *****//
		//******************//

		public void loadBanner(bool autoShow, int position)
		{
			pradoBridgeObject.Call("loadBannerAd", autoShow, position);
		}

		public void setBannerPosition(int position)
		{
			pradoBridgeObject.Call("setBannerPosition", position);
		}



		public void showBanner()
		{
			pradoBridgeObject.Call ("showBannerAd");
		}

		public void hideBanner()
		{
			pradoBridgeObject.Call ("hideBannerAd");
		}




		public void logMessage(string message)
		{
			pradoBridgeObject.Call("printToastLog",message); 
		}
	}
#endif
}
