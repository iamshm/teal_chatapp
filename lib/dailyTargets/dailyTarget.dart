import 'package:chat_app/dailyTargets/target3.dart';
import 'package:chat_app/dailyTargets/target4.dart';
import 'package:chat_app/dailyTargets/target5.dart';
import 'package:chat_app/dailyTargets/target6.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/dailyTargets/target1.dart';
import 'package:chat_app/dailyTargets/target2.dart';

class DailyTarget extends StatelessWidget {
  static const String id = "DAILYTARGET";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Image.asset(
                  "assets/images/dart.png",
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.06,
                  vertical: MediaQuery.of(context).size.height * 0.01),
              child: Text("Hi Arshad, Let's go through your Daily Targets",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 26,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  )),
            ),
            Target1(),
            Target2(),
            Target3(),
            Target4(),
            Target5(),
            Target6(),
          ],
        ),
      ),
    );
  }
}
