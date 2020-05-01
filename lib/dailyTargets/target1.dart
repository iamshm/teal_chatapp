import 'package:flutter/material.dart';

class Target1 extends StatelessWidget {
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
              height: MediaQuery.of(context).size.height * 0.18,
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
                border: Border.all(width: 2.0, color: Color(0xff20be8b)),
                borderRadius: BorderRadius.all(
                    Radius.circular(MediaQuery.of(context).size.width * 0.025)),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.07, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Workout atleast once a day",
                          style: TextStyle(
                              color: Colors.green[500],
                              fontSize: 20,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        Text(
                          "You workout 10 mins today",
                          style: TextStyle(
                              color: Colors.green[500],
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "View Workouts",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.green[500],
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.075,
          child: Container(
            height: MediaQuery.of(context).size.width * 0.1,
            width: MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(
              color: Color(0xff20be8b),
              border: Border.all(width: 1.0, color: Color(0xff20be8b)),
              borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.width * 0.05)),
            ),
            child: Icon(Icons.check, color: Colors.white),
          ),
        )
      ]),
    );
  }
}
