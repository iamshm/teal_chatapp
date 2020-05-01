import 'package:flutter/material.dart';

class DailyTarget extends StatelessWidget {
  static const String id = "DAILYTARGET";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
          )
        ]),
      ),
    );
  }
}
