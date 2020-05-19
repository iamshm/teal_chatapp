import 'package:flutter/material.dart';

class Fast extends StatelessWidget {
  final String duration;
  final String fastType;
  final String fastInfo;
  final Color fastColor;

  const Fast(
      {Key key, this.duration, this.fastType, this.fastInfo, this.fastColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.2,
          vertical: screenHeight * 0.01,
        ),
        child: Container(
          constraints:
              BoxConstraints(minHeight: screenHeight * 0.11, minWidth: 220),
          decoration: BoxDecoration(
              color: fastColor,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10.0,
                ),
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.07,
              vertical: screenHeight * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      duration,
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: screenWidth * 0.01,
                    ),
                    Text(
                      "HOURS",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenWidth * 0.005,
                ),
                Text(
                  fastType,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: screenWidth * 0.011,
                ),
                Wrap(
                  children: <Widget>[
                    Text(
                      fastInfo,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        print("tapped");
      },
    );
  }
}
