import 'package:addkitflutter/RewardedAds.dart';
import 'package:addkitflutter/SplashAds.dart';
import 'package:flutter/material.dart';
import 'BannerAds.dart';
import 'InterstitialAds.dart';
import 'NativeAds.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.shopping_basket)),
                Tab(icon: Icon(Icons.shopping_cart)),
                Tab(icon: Icon(Icons.add_shopping_cart)),
                Tab(icon: Icon(Icons.remove_shopping_cart)),
                Tab(icon: Icon(Icons.view_headline))
              ],
            ),
            title: Text('HMS Ads Kit'),
          ),
          body: TabBarView(
            children: [
              BannerAds(),
              NativeAds(),
              RewardedAds(),
              InterstitialAds(),
              SplashAds()
            ],
          ),
        ),
      ),
    );
  }
}