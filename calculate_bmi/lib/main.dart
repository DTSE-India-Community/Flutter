import 'package:calculatebmi/HeightScreen.dart';
import 'package:calculatebmi/User.dart';
import 'package:flutter/material.dart';
import 'package:huawei_ads/hms_ads_lib.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isSwitched = false;
  String imageName = "assets/male.png";
  String gender = "male";

  changeImage(bool state) {
    setState(() {
      if (state) {
        isSwitched = false;
        gender = "male";
        imageName = "assets/male.png";
      } else {
        isSwitched = true;
        gender = "female";
        imageName = "assets/female.png";
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    BannerAd _bannerAd = createBannerAd();
    _bannerAd
      ..loadAd()
      ..show();

    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 50),
          child: Column(
            children: <Widget>[
              Text(
                "Select Gender",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blueGrey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Hero(
                      tag: 'image',
                      child: Image(
                        image: AssetImage(imageName),
                        height: 400,
                        width: 200,
                      ),
                    )
                  ),
                ],
              ),
              LiteRollingSwitch(
                //initial value
                value: false,
                textOn: 'Female',
                textOff: 'Male',
                colorOn: Colors.pinkAccent[700],
                colorOff: Colors.blueAccent[700],
                iconOn: Icons.pregnant_woman,
                iconOff: Icons.directions_walk,
                textSize: 16.0,
                onTap: () => changeImage(isSwitched),
                onChanged: (bool state) => {
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ClipOval(
                  child: Material(
                    color: Colors.blueGrey, // button color
                    child: InkWell(
                      splashColor: Colors.green, // inkwell color
                      child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )),
                      onTap: () {
                        User user = new User(gender, 0, 0);
                        Navigator.push(
                          context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 500),
                              pageBuilder: (_, __, ___) => HeightScreen(user: user)
                            ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

BannerAd createBannerAd() {
  return BannerAd(
    adUnitId: "testw6vs28auh3",
    size: BannerAdSize(width: 360, height: 57),
    adParam: AdParam.build(),
  );
}
