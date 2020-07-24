import 'package:flutter/material.dart';
import 'package:huawei_ads/adslite/nativead/native_ad.dart';
import 'package:huawei_ads/adslite/nativead/native_ad_configuration.dart';
import 'package:huawei_ads/adslite/nativead/native_ad_controller.dart';
import 'package:huawei_ads/adslite/nativead/native_styles.dart';
import 'package:huawei_ads/utils/constants.dart';

class NativeAds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NativeStyles stylesSmall = NativeStyles();
    stylesSmall.setCallToAction(fontSize: 8);
    stylesSmall.setFlag(fontSize: 10);
    stylesSmall.setSource(fontSize: 11);

    NativeAdConfiguration configuration = NativeAdConfiguration.build();
    configuration.setChoicesPosition = NativeAdChoicesPosition.bottomRight;

    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            margin: EdgeInsets.only(bottom: 20.0),
            child: NativeAd(
              adUnitId: "testu7m3hc4gvm",
              controller: NativeAdController(
                  adConfiguration: configuration,
                  listener: (AdEvent event, {int errorCode}) {
                    print("NativeAd event $event");
                  }),
              type: NativeAdType.small,
              styles: stylesSmall,
            ),
          ),
        ],
      ),
    );
  }
}