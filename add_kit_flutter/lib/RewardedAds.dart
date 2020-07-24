import 'package:flutter/material.dart';
import 'package:huawei_ads/hms_ads_lib.dart';

import 'package:huawei_ads/adslite/ad_param.dart';
import 'package:huawei_ads/adslite/reward/reward_verify_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:huawei_ads/hms_ads.dart';

typedef void RewardAdListener(RewardAdEvent event,
    {Reward reward, int errorCode});

class RewardedAds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.topCenter,
      child: RaisedButton(
        child: Text(
          'Load Rewarded Ads',
        ),
        onPressed: () {

          RewardAd.instance
              .loadAd(adUnitId: "testx9dtjwj8hp", adParam: AdParam.build());
          RewardAd.instance.isLoaded().then((isLoaded) {
            if (isLoaded) {
              RewardAd.instance.show();
            }
          });

          RewardAd.instance.setRewardAdListener =
              (RewardAdEvent event, {Reward reward, int errorCode}) {
            print("RewardedVideoAd event $event");
            if (event == RewardAdEvent.rewarded) {
              print('Received reward : ');
            }
          };
        },
      ),
    );
  }
}
