package co.prado.android.sampleapp

import android.app.Activity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.ScrollView
import android.widget.TextView
import co.prado.ads.banners.PradoBannerAdCallback
import co.prado.ads.banners.PradoBannerView
import co.prado.ads.fullscreen.interstitial.PradoInterstitialAd
import co.prado.ads.fullscreen.interstitial.PradoInterstitialAdCallback
import co.prado.ads.fullscreen.rewarded.PradoRewardedAd
import co.prado.ads.fullscreen.rewarded.PradoRewardedAdCallback
import co.prado.sdk.Prado
import co.prado.sdk.PradoError
import co.prado.sdk.PradoInitializationListener
import com.kpadplayer.sdk.ads.banner.KPBannerView


class MainActivity : Activity() {

    private val PUBLISHER_ID: String = "15492"
    private val TOKEN: String = "4b4982c7c7429ba2006852c2ef9f684f"

    private var pradoInterstitialAd: PradoInterstitialAd? = null
    private var pradoRewardedAd: PradoRewardedAd? = null
    private var pradoBannerView: PradoBannerView? = null

    protected var loadBannerButton: Button? = null
    protected var closeBannerButton: Button? = null

    // The load interstitial button.
    protected var loadInterstitialButton: Button? = null

    // The show interstitial button.
    protected var showInterstitialButton: Button? = null

    // The load rewarded ad button.
    protected var loadRewardedButton: Button? = null

    // The load rewarded ad button.
    protected var showRewardedButton: Button? = null

    private var feedbackContainer: ScrollView? = null
    private var feedbackTV: TextView? = null

    protected var bannerContainer: ViewGroup? = null


    private
    val LOADED: String = " Loaded"

    private
    val FAILED_TO_LOAD: String = " Failed to Load::"

    private
    val SHOWN: String = " Shown"

    private
    val IMPRESSION: String = " Impression"

    private
    val FAILED_TO_SHOW: String = " Failed to Show::"

    private
    val BUTTON_INTERACTION_PATTERN: String = "----- %s ---"

    private
    val CLOSED: String = " Closed"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        title = getString(R.string.app_name) + " v" + Prado.getSDKVersion()
        setContentView(R.layout.activity_main)

        feedbackContainer = findViewById(R.id.feedbackContainer)
        feedbackTV = findViewById(R.id.feedbackTextView)

        log("App version SDK v" + Prado.getSDKVersion())

        bannerContainer = findViewById(R.id.bannerContainer)

        // Banner Ad
        loadBannerButton = findViewById(R.id.banner_load)
        loadBannerButton?.setOnClickListener(View.OnClickListener { view: View? ->
            log(String.format(BUTTON_INTERACTION_PATTERN, "Load Banner"))
            loadBannerButton?.setEnabled(false)
            closeBannerButton?.isEnabled = true
            loadBanner()
        })

        closeBannerButton = findViewById(R.id.banner_close)
        closeBannerButton?.setOnClickListener(View.OnClickListener { view: View? ->
            hideBanner()
            loadBannerButton?.setEnabled(true)
            closeBannerButton?.setEnabled(false)
            log(String.format(BUTTON_INTERACTION_PATTERN, "Close Banner"))
        })


        // Interstitial Ad
        loadInterstitialButton = findViewById<View>(R.id.interstitial_load) as Button
        loadInterstitialButton?.setOnClickListener { view: View? ->
            log(String.format(BUTTON_INTERACTION_PATTERN, "Load Interstitial"))
            loadInterstitialButton!!.isEnabled = false
            loadInterstitial()
        }
        showInterstitialButton = findViewById<View>(R.id.interstitial_show) as Button
        showInterstitialButton?.setOnClickListener { view: View? ->
            log(String.format(BUTTON_INTERACTION_PATTERN, "Show Interstitial"))
            loadInterstitialButton!!.isEnabled = true
            showInterstitialButton!!.isEnabled = false
            showInterstitial()
        }


        // Rewarded Ad
        loadRewardedButton = findViewById<View>(R.id.rewarded_load) as Button
        loadRewardedButton?.setOnClickListener { view: View? ->
            log(String.format(BUTTON_INTERACTION_PATTERN, "Load Rewarded"))
            loadRewardedButton!!.isEnabled = false
            loadRewarded()
        }
        showRewardedButton = findViewById<View>(R.id.rewarded_show) as Button
        showRewardedButton?.setOnClickListener { view: View? ->
            log(String.format(BUTTON_INTERACTION_PATTERN, "Show Rewarded"))
            loadRewardedButton!!.isEnabled = true
            showRewardedButton!!.isEnabled = false
            showRewarded()
        }

        initSDK()
    }

    private fun initSDK() {
        Prado.initialize(this, PUBLISHER_ID, TOKEN, object : PradoInitializationListener {

            override fun onInitSuccess() {
                onSDKInitSuccess()
                createBanner()
            }

            override fun onInitError(error: PradoError) {
                onSDKInitFailure(error.message)
            }

        })

    }

    protected fun onSDKInitSuccess() {
        runOnUiThread {
            log("SDK Init Success")
            loadBannerButton!!.isEnabled = true
            loadInterstitialButton!!.isEnabled = true
            loadRewardedButton!!.isEnabled = true
        }
    }

    protected fun onSDKInitFailure(error: String) {
        runOnUiThread {
            log("SDK Init Error: $error")
        }
    }

    private fun createBanner() {
        pradoBannerView = PradoBannerView(this)
        pradoBannerView!!.setBannerPosition(KPBannerView.Position.BOTTOM_CENTER)
        pradoBannerView!!.setBannerCallback(object : PradoBannerAdCallback {
            override fun onAdLoaded() {
                onBannerLoaded()
                pradoBannerView!!.show()
            }

            override fun onAdFailedToLoad(error: PradoError) {
                onBannerLoadFailed(error.toString())
            }

            override fun onAdShown() {
                onBannerShown()
            }

            override fun onAdFailedToShow(error: PradoError) {
                onBannerShowFailed(error.toString())
            }

            override fun onAdImpression() {
                onBannerImpression()
            }

            override fun onAdClosed() {
                onBannerClosed()
            }
        })
    }

    private fun loadBanner(){
        pradoBannerView?.load()
    }

    private fun hideBanner(){
        pradoBannerView?.close()
    }

    protected fun onBannerLoaded() {
        runOnUiThread { log("Banner $LOADED") }
    }

    protected fun onBannerLoadFailed(error: String) {
        runOnUiThread {
            log("Banner" + FAILED_TO_LOAD + error)
            loadBannerButton!!.isEnabled = true
            closeBannerButton!!.isEnabled = false
        }
    }

    protected fun onBannerShown() {
        runOnUiThread { log("Banner" + SHOWN) }
    }

    protected fun onBannerShowFailed(error: String) {
        runOnUiThread {
            log("Banner $FAILED_TO_SHOW $error")
            loadBannerButton!!.isEnabled = true
            closeBannerButton!!.isEnabled = false
        }
    }

    protected fun onBannerImpression() {
        runOnUiThread { log("Banner $IMPRESSION") }
    }

    protected fun onBannerClosed() {
        runOnUiThread {
            log("Banner $CLOSED")
            loadBannerButton!!.isEnabled = true
            closeBannerButton!!.isEnabled = false
        }
    }

    private fun loadInterstitial(){
        PradoInterstitialAd.load(this, object : PradoInterstitialAdCallback {
            override fun onAdLoaded(ad: PradoInterstitialAd) {
                pradoInterstitialAd = ad
                onInterstitialLoaded()
            }

            override fun onAdFailedToLoad(error: PradoError) {
                onInterstitialLoadFailed(error.toString())
            }

            override fun onAdShown(ad: PradoInterstitialAd) {
                onInterstitialShown()
            }

            override fun onAdFailedToShow(ad: PradoInterstitialAd, error: PradoError) {
                onInterstitialShowFailed(error.toString())
            }

            override fun onAdImpression(ad: PradoInterstitialAd) {
                onInterstitialImpression()
            }

            override fun onAdClosed(ad: PradoInterstitialAd) {
                pradoInterstitialAd = null
                onInterstitialClosed()
            }

        })
    }

    private fun showInterstitial(){
        pradoInterstitialAd?.show()
    }

    // Interstitial SDK callbacks handler
    protected fun onInterstitialLoaded() {
        runOnUiThread {
            log("Interstitial" + LOADED)
            showInterstitialButton!!.isEnabled = true
        }
    }

    protected fun onInterstitialLoadFailed(error: String) {
        runOnUiThread {
            log("Interstitial" + FAILED_TO_LOAD + error)
            loadInterstitialButton!!.isEnabled = true
            showInterstitialButton!!.isEnabled = false
        }
    }

    protected fun onInterstitialShowFailed(error: String) {
        runOnUiThread {
            log("Interstitial" + FAILED_TO_SHOW + error)
            loadInterstitialButton!!.isEnabled = true
            showInterstitialButton!!.isEnabled = false
        }
    }

    protected fun onInterstitialShown() {
        runOnUiThread { log("Interstitial" + SHOWN) }
    }

    protected fun onInterstitialImpression() {
        runOnUiThread { log("Interstitial" + IMPRESSION) }
    }

    protected fun onInterstitialClosed() {
        runOnUiThread {
            log("Interstitial" + CLOSED)
            loadInterstitialButton!!.isEnabled = true
            showInterstitialButton!!.isEnabled = false
        }
    }

    private fun loadRewarded(){
        PradoRewardedAd.load(this, object : PradoRewardedAdCallback {
            override fun onAdLoaded(ad: PradoRewardedAd) {
                pradoRewardedAd = ad
                onRewardedLoaded()
            }

            override fun onAdFailedToLoad(error: PradoError) {
                onRewardedLoadFailed(error.toString())
            }

            override fun onAdShown(ad: PradoRewardedAd) {
                onRewardedShown()
            }

            override fun onAdFailedToShow(ad: PradoRewardedAd, error: PradoError) {
                onRewardedShowFailed(error.toString())
                pradoRewardedAd = null
            }

            override fun onAdImpression(ad: PradoRewardedAd) {
                onRewardedImpression()
            }

            override fun onRewardReceived(ad: PradoRewardedAd) {
                onRewardAchieved()
            }

            override fun onAdClosed(ad: PradoRewardedAd) {
                pradoRewardedAd = null
                onRewardedClosed()
            }

        })
    }

    private fun showRewarded(){
        pradoRewardedAd?.show()
    }

    // Rewarded SDK callbacks handler
    protected fun onRewardedLoaded() {
        runOnUiThread {
            log("Rewarded $LOADED")
            showRewardedButton!!.isEnabled = true
        }
    }

    protected fun onRewardedLoadFailed(error: String) {
        runOnUiThread {
            log("Rewarded $FAILED_TO_LOAD $error")
            loadRewardedButton!!.isEnabled = true
            showRewardedButton!!.isEnabled = false
        }
    }

    protected fun onRewardedShowFailed(error: String) {
        runOnUiThread {
            log("Rewarded $FAILED_TO_SHOW $error")
            loadRewardedButton!!.isEnabled = true
            showRewardedButton!!.isEnabled = false
        }
    }

    protected fun onRewardedShown() {
        runOnUiThread { log("Rewarded $SHOWN") }
    }

    protected fun onRewardedImpression() {
        runOnUiThread { log("Rewarded $IMPRESSION") }
    }

    protected fun onRewardedClosed() {
        runOnUiThread {
            log("Rewarded $CLOSED")
            loadRewardedButton!!.isEnabled = true
            showRewardedButton!!.isEnabled = false
        }
    }

    protected fun onRewardAchieved() {
        runOnUiThread {
            log("Reward Received")
        }
    }

    protected fun log(message: String) {
        Log.d(MainActivity::class.java.simpleName, message)
        val text = feedbackTV!!.text.toString() + message + "\n"
        feedbackTV!!.text = text
        feedbackContainer!!.post {
            feedbackContainer!!.fullScroll(View.FOCUS_DOWN)
        }
    }
}