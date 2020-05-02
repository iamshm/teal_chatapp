import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Target6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.08,
          MediaQuery.of(context).size.height * 0.015,
          MediaQuery.of(context).size.width * 0.08,
          MediaQuery.of(context).size.height * 0.015),
      child: Stack(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Container(
            // height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1.0, color: Colors.white),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400],
                  blurRadius: 5.0,
                  offset: Offset(
                    0,
                    5.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.width * 0.025)),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.07, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Track your Lifestyle",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                        "You checked off 0 activities today",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Icon(
                        Icons.expand_more,
                        size: 28,
                        color: Colors.grey,
                      )),
                      IconButton(
                          icon: Icon(
                            Icons.info,
                            size: 18,
                          ),
                          onPressed: null)
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.030,
                          5,
                          MediaQuery.of(context).size.width * 0.030,
                          MediaQuery.of(context).size.width * 0.030,
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.10,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[400],
                                blurRadius: 5.0,
                                offset: Offset(
                                  0,
                                  5.0,
                                ),
                              )
                            ],
                            border: Border.all(width: 2.0, color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(
                                MediaQuery.of(context).size.width * 0.025)),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.02),
                                Icon(
                                  FontAwesomeIcons.laptop,
                                  size: 20,
                                  color: Color(0xff20be8b),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.02),
                                Expanded(
                                  child: Text(
                                    "Did you take a break from the screens to avoid eye strain ?",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ),
                                Icon(Icons.info, size: 20, color: Colors.grey),
                                SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.02),
                              ]),
                        ),
                      ),
                      Positioned(
                        bottom: -MediaQuery.of(context).size.height * 0.001,
                        left: MediaQuery.of(context).size.width * 0.16,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.4,
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                splashColor: Color(0xff20be8b), // inkwell color
                                child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1.0, color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.black87,
                                    )),
                                onTap: () {},
                              ),
                              InkWell(
                                splashColor: Color(0xff20be8b), // inkwell color
                                child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1.0, color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.clear,
                                      color: Colors.black87,
                                    )),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.030,
                          5,
                          MediaQuery.of(context).size.width * 0.030,
                          MediaQuery.of(context).size.width * 0.030,
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.10,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0xffe0fbf2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[400],
                                blurRadius: 5.0,
                                offset: Offset(
                                  0,
                                  5.0,
                                ),
                              )
                            ],
                            border: Border.all(
                                width: 2.0, color: Color(0xff20be8b)),
                            borderRadius: BorderRadius.all(Radius.circular(
                                MediaQuery.of(context).size.width * 0.025)),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.02),
                                Icon(
                                  FontAwesomeIcons.iceCream,
                                  size: 20,
                                  color: Color(0xff20be8b),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.02),
                                Expanded(
                                  child: Text(
                                    "Did you avoid eating desert today ?",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.info,
                                  size: 20,
                                  color: Color(0xff20be8b),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.02),
                              ]),
                        ),
                      ),
                      Positioned(
                        bottom: -MediaQuery.of(context).size.height * 0.001,
                        left: MediaQuery.of(context).size.width * 0.16,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.4,
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                splashColor: Colors.white, // inkwell color
                                child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xff20be8b),
                                      border: Border.all(
                                          width: 1.0, color: Color(0xff20be8b)),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.030,
                          5,
                          MediaQuery.of(context).size.width * 0.030,
                          MediaQuery.of(context).size.width * 0.030,
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.10,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[400],
                                blurRadius: 5.0,
                                offset: Offset(
                                  0,
                                  5.0,
                                ),
                              )
                            ],
                            border: Border.all(width: 2.0, color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(
                                MediaQuery.of(context).size.width * 0.025)),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.02),
                                Icon(
                                  FontAwesomeIcons.bookOpen,
                                  size: 20,
                                  color: Color(0xff20be8b),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.02),
                                Expanded(
                                  child: Text(
                                    "Do you have any happiness goal for today ?",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ),
                                Icon(Icons.info, size: 20, color: Colors.grey),
                                SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.02),
                              ]),
                        ),
                      ),
                      Positioned(
                        bottom: -MediaQuery.of(context).size.height * 0.001,
                        left: MediaQuery.of(context).size.width * 0.16,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.4,
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                splashColor: Color(0xff20be8b), // inkwell color
                                child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1.0, color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.black87,
                                    )),
                                onTap: () {},
                              ),
                              InkWell(
                                splashColor: Color(0xff20be8b), // inkwell color
                                child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1.0, color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.clear,
                                      color: Colors.black87,
                                    )),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.030,
                          5,
                          MediaQuery.of(context).size.width * 0.030,
                          MediaQuery.of(context).size.width * 0.030,
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.10,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[400],
                                blurRadius: 5.0,
                                offset: Offset(
                                  0,
                                  5.0,
                                ),
                              )
                            ],
                            border: Border.all(
                              width: 2.0,
                              color: Colors.red[300],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(
                                MediaQuery.of(context).size.width * 0.025)),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.02),
                                Icon(
                                  FontAwesomeIcons.umbrellaBeach,
                                  size: 20,
                                  color: Colors.red[300],
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.02),
                                Expanded(
                                  child: Text(
                                    "Did you enjoy atleast one activity today ?",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.info,
                                  size: 20,
                                  color: Colors.red[300],
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.02),
                              ]),
                        ),
                      ),
                      Positioned(
                        bottom: -MediaQuery.of(context).size.height * 0.001,
                        left: MediaQuery.of(context).size.width * 0.16,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.4,
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                splashColor: Colors.white, // inkwell color
                                child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.red[300],
                                      border: Border.all(
                                        width: 1.0,
                                        color: Colors.red[300],
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.clear,
                                      color: Colors.white,
                                    )),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.030,
                          5,
                          MediaQuery.of(context).size.width * 0.030,
                          MediaQuery.of(context).size.width * 0.030,
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.10,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[400],
                                blurRadius: 5.0,
                                offset: Offset(
                                  0,
                                  5.0,
                                ),
                              )
                            ],
                            border: Border.all(width: 2.0, color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(
                                MediaQuery.of(context).size.width * 0.025)),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.02),
                                Icon(
                                  FontAwesomeIcons.prayingHands,
                                  size: 20,
                                  color: Color(0xff20be8b),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.02),
                                Expanded(
                                  child: Text(
                                    "Did you meditate for atleast 30 mins today ?",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ),
                                Icon(Icons.info, size: 20, color: Colors.grey),
                                SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.02),
                              ]),
                        ),
                      ),
                      Positioned(
                        bottom: -MediaQuery.of(context).size.height * 0.001,
                        left: MediaQuery.of(context).size.width * 0.16,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.4,
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                splashColor: Color(0xff20be8b), // inkwell color
                                child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1.0, color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.black87,
                                    )),
                                onTap: () {},
                              ),
                              InkWell(
                                splashColor: Color(0xff20be8b), // inkwell color
                                child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1.0, color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.clear,
                                      color: Colors.black87,
                                    )),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
        //count button
        Positioned(
          top: MediaQuery.of(context).size.height * 0.075,
          child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.width * 0.1,
              width: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1.0, color: Colors.black26),
                borderRadius: BorderRadius.all(
                    Radius.circular(MediaQuery.of(context).size.width * 0.05)),
              ),
              child: Text(
                "6",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              )),
        )
      ]),
    );
  }
}
