import 'package:chat_app/BottomTab/screenComponents/fast.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class FastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fasts",
          style: TextStyle(
            color: fastFontColor,
            fontSize: 20,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Fast(
              duration: "13",
              fastColor: Color(0xff67548b),
              fastType: "Circadian Rhythm",
              fastInfo: "This fast starts at sunset and lasts to morning",
            ),
            Fast(
              duration: "16",
              fastColor: Color(0xffe58674),
              fastType: "16:8 Intermittent",
              fastInfo: "A 16 hour fast with an 8 hour feeding window",
            ),
            Fast(
              duration: "18",
              fastColor: Color(0xff438d90),
              fastType: "18:6 Intermittent",
              fastInfo: "A 18 hour fast with an 8 hour feeding window",
            ),
            Fast(
              duration: "20",
              fastColor: Color(0xffe9ae6c),
              fastType: "20:4 Intermittent",
              fastInfo: "A 20 hour fast with an 4 hour feeding window",
            ),
            Fast(
              duration: "36",
              fastColor: Color(0xff7292db),
              fastType: "36 Hour Fast",
              fastInfo:
                  "A single 36 hour fast, otherwise known as \"Monk Fast\"",
            ),
            Fast(
              duration: "1-168",
              fastColor: Color(0xff5d646c),
              fastType: "Custom Fast",
              fastInfo: "Create your own fast upto 7 days long! ",
            ),
          ],
        ),
      ),
    );
  }
}
