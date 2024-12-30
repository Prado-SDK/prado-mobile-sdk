
namespace PRADONativeInterface {
	public interface PRADONativeInterface
	{
		// interface members
		bool isInitialised();

		void init(string developerID, string securityToken,string pluginVersion);

		void loadBanner(bool autoShow, int position);

		void showBanner();

		void hideBanner();

	
		//***********************************//
		//***** INTERSTITIAL & REWARDED *****//
		//***********************************//

		void loadInterstitialAd(bool autoShow);

		void loadRewardedAd(bool autoShow);

		void showInterstitial();

		void showRewarded();

		bool getIsInterstitialLoaded();

		bool getIsRewardedLoaded();

		void logMessage(string message);
	}
}
