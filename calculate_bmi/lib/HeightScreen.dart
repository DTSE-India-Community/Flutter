import 'package:calculatebmi/FlutterSlider.dart';
import 'package:calculatebmi/WeightScreen.dart';
import 'package:flutter/material.dart';
import 'package:huawei_ads/hms_ads_lib.dart';
import 'User.dart';

class HeightScreen extends StatefulWidget {
  User user;

  HeightScreen({Key key, this.user}) : super(key: key);

  @override
  _HeightScreenState createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {

  double ImageHeight = 160;
  String imageName = "assets/male.png";

  @override
  Widget build(BuildContext context) {
    if(widget.user.gender.contains("female")) {
      imageName = "assets/female.png";
    }
    return Scaffold(
      backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Select Your Height",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 180,
                      height: 500,
                      child: FlutterSlider(
                        axis: Axis.vertical,
                        values: [160],
                        max: 231,
                        min: 91,
                        rtl: true,
                        onDragging: (handlerIndex, lowerValue, upperValue) {
                          setState(() {
                            ImageHeight = lowerValue;
                          });
                        },
                        selectByTap: false,
                        hatchMark: FlutterSliderHatchMark(
                          density: .6, // means 50 lines, from 0 to 100 percent
                          labels: [
                            FlutterSliderHatchMarkLabel(
                                percent: 0, label: Text('        91 cm')),
                            FlutterSliderHatchMarkLabel(
                                percent: 20, label: Text('        115 cm')),
                            FlutterSliderHatchMarkLabel(
                                percent: 40, label: Text('        140 cm')),
                            FlutterSliderHatchMarkLabel(
                                percent: 60, label: Text('        164 cm')),
                            FlutterSliderHatchMarkLabel(
                                percent: 80, label: Text('        189 cm')),
                            FlutterSliderHatchMarkLabel(
                                percent: 100, label: Text('        213 cm')),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Hero(
                          tag: 'image',
                          child: Image(
                            image: AssetImage(imageName),
                            height: ImageHeight+180,
                            width: 140,
                            fit: BoxFit.fill,
                          ),
                        )
                      ),
                    ),
                  ],
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
                            child: Icon(Icons.arrow_forward,color: Colors.white,)),
                        onTap: () {
                          widget.user.height = ImageHeight;
                          Navigator.push(
                            context,
                              PageRouteBuilder(
                                  transitionDuration: Duration(milliseconds: 500),
                                  pageBuilder: (_, __, ___) => WeightScreen(user: widget.user)
                              )
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}