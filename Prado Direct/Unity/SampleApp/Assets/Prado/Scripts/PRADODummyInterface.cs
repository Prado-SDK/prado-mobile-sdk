using UnityEngine;
using System.Collections;
using System;
using PRADONativeInterface;

namespace PRADODummyInterface
{
	public class PRADODummyInterface :PRADONativeInterface.PRADONativeInterface
	{

		public bool getIsInterstitialLoaded ()
		{
			return false;
		}


		public bool getIsRewardedLoaded ()
		{
			return false;
		}

		public void hideBanner ()
		{
			DebugLog ( "hideBanner" );
		}


		public void init (string developerID, string securityToken,string pluginVersion)
		{
			DebugLog ( "init, developerID=" + developerID + ", securityToken=" + securityToken );
		}

		public bool isInitialised ()
		{
			return true;
		}

		public void loadBanner (bool autoShow, int position)
		{
			DebugLog ( "loadBanner, autoShow=" + autoShow + ", position=" + position );
		}

		public void generateInterstitial ()
		{
			DebugLog ( "generateInterstitial" );
		}

		public void loadInterstitialAd (bool autoShow)
		{
			DebugLog ( "loadInterstitialAd, autoShow=" + autoShow );
		}

		public void generateRewarded ()
		{
			DebugLog ( "generateRewarded" );
		}

		public void loadRewardedAd (bool autoShow)
		{
			DebugLog ( "loadRewardedAd, autoShow=" + autoShow );
		}

		public void logMessage (string message)
		{
			DebugLog ( message );
		}

		public void setBannerPosition (int position)
		{
			DebugLog ( "setBannerPosition, position=" + position );
		}

		public void showBanner ()
		{
			DebugLog ( "showBanner" );
		}

		public void showInterstitial ()
		{
			DebugLog ( "showInterstitial" );
		}

		public void showRewarded ()
		{
			DebugLog ( "showRewarded" );
		}


		private void DebugLog (string msg)
		{
			Debug.Log ( "PRADO Dummy: " + msg );
		}

		public void setupCallbacks ()
		{
			DebugLog ("setupCallbacks");

		}
	}
}
