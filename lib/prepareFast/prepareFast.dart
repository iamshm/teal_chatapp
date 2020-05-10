import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        automaticallyImplyLeading: true,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
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
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(width: 10, color: const Color(0xFFb4a8c3)),
            ),
            alignment: Alignment.center,
            child: Text(
              "13:58",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
            ),
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
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "TIPS TO PREPARE FOR THE FAST",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.035,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.tint,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Flexible(
                        child: Text(
                          "Hydrate with water before, during and after the fast.",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.034,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.pizzaSlice,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Flexible(
                        child: Text(
                          "Avoid Processes and Unhealthy foods before and after fasting.",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.034,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.appleAlt,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Flexible(
                        child: Text(
                          "Prepare healthy, fresh foods for your first meal after the fast.",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.034,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
