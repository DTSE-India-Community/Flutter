import 'package:flutter/material.dart';
import 'package:huawei_ads/hms_ads_lib.dart';

class BannerAds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: RaisedButton(
        child: Text(
          'Load Banner Ads',
        ),
        onPressed: () {
          BannerAd _bannerAd = createBannerAd();
          _bannerAd
            ..loadAd()
            ..show();
        },
      ),
    );
  }
}

BannerAd createBannerAd() {
  return BannerAd(
    adUnitId: "testw6vs28auh3",
    size: BannerAdSize(width: 360, height: 57),
    adParam: AdParam.build(),
  );
}
