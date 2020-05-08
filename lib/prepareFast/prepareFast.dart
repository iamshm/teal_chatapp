import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class PrepareFast extends StatefulWidget {
  static const String id = "PREPAREFASTS";
  @override
  _PrepareFastState createState() => _PrepareFastState();
}

class _PrepareFastState extends State<PrepareFast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FASTS",
          style: TextStyle(
              color: fastFontColor,
              fontSize: 22,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: MediaQuery.of(context).size.height * 0.0001,
              ),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              // color: Colors.blue,
              child: Text(
                "Based on the Research of scientist Dr. Satchin Panda, this fast emulates the body's natural clock by fasting roughly after sunset to morning",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold),
              )),
          RaisedButton(
            textColor: Colors.white,
            color: preparebtnColor,
            child: Text(
              "Prepare Fast",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400),
            ),
            onPressed: () {},
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.035,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
