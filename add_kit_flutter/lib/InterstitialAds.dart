import 'package:flutter/material.dart';
import 'package:huawei_ads/adslite/interstitial/interstitial_ad.dart';

class InterstitialAds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: RaisedButton(
        child: Text(
          'Load Interstitial Ads',
        ),
        onPressed: () {
          InterstitialAd _interstitialAd = createInterstitialAd();
          _interstitialAd
            ..loadAd()
            ..show();
        },
      ),
    );
  }
}

InterstitialAd createInterstitialAd() {
  return InterstitialAd(
    adUnitId: "teste9ih9j0rc3",
  );
}

