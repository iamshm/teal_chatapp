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
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
              ),
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
