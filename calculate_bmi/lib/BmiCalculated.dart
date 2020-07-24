import 'package:flutter/material.dart';
import 'package:huawei_ads/adslite/interstitial/interstitial_ad.dart';
import 'User.dart';

class BmiCalculated extends StatefulWidget {
  User user;

  BmiCalculated({Key key, this.user}) : super(key: key);

  @override
  _BmiCalculatedState createState() => _BmiCalculatedState();
}

class _BmiCalculatedState extends State<BmiCalculated> {
  double bmi;
  String status = "Fit";
  String imageAsset = "assets/level4.jpg";

  @override
  Widget build(BuildContext context) {
    InterstitialAd _interstitialAd = createInterstitialAd();
    _interstitialAd
      ..loadAd()
      ..show();

    bmi = (widget.user.weight * 10000) /
        (widget.user.height * widget.user.height);
    if (bmi < 16) {
      status = "Severely Underweight";
      imageAsset = "assets/level1.jpg";
    } else if (bmi >= 16 && bmi < 18.5) {
      status = "Underweight";
      imageAsset = "assets/level2.jpg";
    } else if (bmi >= 18.5 && bmi < 25) {
      status = "Normal";
      imageAsset = "assets/level3.jpg";
    } else if (bmi >= 25 && bmi < 30) {
      status = "Overweight";
      imageAsset = "assets/level4.jpg";
    } else if (bmi >= 30 && bmi < 35) {
      status = "Moderately Obese";
      imageAsset = "assets/level5.jpg";
    } else if (bmi >= 35 && bmi < 40) {
      status = "Severely Obese";
      imageAsset = "assets/level6.jpg";
    } else if (bmi >= 40) {
      status = "Very Severely Obese";
      imageAsset = "assets/level7.jpg";
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "Your BMI is",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Hero(
                tag: 'image',
                child: Image(
                  image: AssetImage(imageAsset),
                  height: 200,
                  width: 100,
                  fit: BoxFit.fill,
                ),
              )
            ),
            Container(
              height: 200,
              child: Card(
                margin: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.blueGrey,
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bmi.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Height ${widget.user.height}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "    Weight ${widget.user.weight}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "You are $status",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

InterstitialAd createInterstitialAd() {
  return InterstitialAd(
    adUnitId: "teste9ih9j0rc3",
  );
}
