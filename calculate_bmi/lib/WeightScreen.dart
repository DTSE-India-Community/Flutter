import 'package:calculatebmi/BmiCalculated.dart';
import 'package:calculatebmi/FlutterSlider.dart';

import 'package:flutter/material.dart';
import 'package:huawei_ads/hms_ads_lib.dart';
import 'User.dart';

class WeightScreen extends StatefulWidget {
  User user;

  WeightScreen({Key key, this.user}) : super(key: key);

  @override
  _WeightScreenState createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  double ImageWeight = 50;
  String imageName = "assets/male.png";
  @override
  Widget build(BuildContext context) {
    if(widget.user.gender.contains("female")) {
      imageName = "assets/female.png";
    }
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          Text(
            "Select Weight",
            style: TextStyle(
              fontSize: 24,
              color: Colors.blueGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Hero(
              tag: 'image',
              child: Image(
                image: AssetImage(imageName),
                height: 300,
                width: ImageWeight+50,
                fit: BoxFit.fill,
              ),
            )
          ),
          SizedBox(
            child: Text(
              '$ImageWeight kg',
              style: TextStyle(
                  backgroundColor: Colors.white,
                  fontSize: 24,
                  color: Colors.blueGrey,),
            ),
          ),
          FlutterSlider(
            values: [50],
            max: 120,
            min: 20,
            selectByTap: false,
            onDragging: (handlerIndex, lowerValue, upperValue) {
              setState(() {
                ImageWeight = lowerValue;
              });
            },
          ),
          ClipOval(
            child: Material(
              color: Colors.blueGrey, // button color
              child: InkWell(
                splashColor: Colors.green, // inkwell color
                child: SizedBox(
                    width: 56, height: 56, child: Icon(Icons.arrow_forward,color: Colors.white,)),
                onTap: () {
                  widget.user.weight = ImageWeight;
                  Navigator.push(
                    context,
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 300),
                          pageBuilder: (_, __, ___) => BmiCalculated(user: widget.user)
                      )
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}