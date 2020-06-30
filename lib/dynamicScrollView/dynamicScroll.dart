import 'package:flutter/material.dart';

class DynamicScroll extends StatefulWidget {
  static const String id = "DYNAMICSCROLL";
  DynamicScroll({Key key}) : super(key: key);

  @override
  _DynamicScrollState createState() => _DynamicScrollState();
}

class _DynamicScrollState extends State<DynamicScroll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe2f5fb),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
              child: Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 5),
                  child: Text(
                    "Choose categories that represent what you want to see",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Color(0xff879797),
                        fontSize: 24),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 600,
              width: MediaQuery.of(context).size.width,
              child: ListView(),
            )
          ],
        ),
      ),
    );
  }
}
