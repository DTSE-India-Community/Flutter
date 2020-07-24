import 'package:flutter/material.dart';
import 'package:huawei_ads/hms_ads_lib.dart';

class SplashAds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SplashAd createSplash() => SplashAd(
        adType: SplashAdType.above,
        ownerText: 'Owner Text',
        footerText: 'Footer Text',
        loadListener: (SplashAdLoadEvent event, {int errorCode}) {
          print("SplashAdLoadEvent : $event");
          if (event == SplashAdLoadEvent.dismissed) {
            //Handle Dismiss logic here
            Navigator.pop(context);
          }
        });

    return Align(
      alignment: Alignment.topCenter,
      child: RaisedButton(
        child: Text(
          'Load Splash Ads',
        ),
        onPressed: () {
          SplashAd splashAd = createSplash();
          splashAd
            ..loadAd(
                adUnitId: "testq6zq98hecj",
                orientation: SplashAdOrientation.portrait,
                adParam: AdParam.build(),
                topMargin: 1);
        },
      ),
    );
  }
}


