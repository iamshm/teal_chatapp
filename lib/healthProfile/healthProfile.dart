import 'package:chat_app/healthProfile/healthfactors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HealthProfile extends StatelessWidget {
  static const String id = "HEALTHPROFILE";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    0,
                    0,
                    MediaQuery.of(context).size.width * 0.075,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xffeeeeee),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "HEALTH SCORE : ",
                                style: TextStyle(
                                    color: Color(0xff00777f),
                                    fontSize: 24,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "70%",
                                style: TextStyle(
                                    color: Color(0xff00777f),
                                    fontSize: 24,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.20,
                            width: MediaQuery.of(context).size.height * 0.20,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                "assets/images/userImage.jpg",
                              )),
                            ),
                          )
                        ]),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: MediaQuery.of(context).size.width * 0.1,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(
                          MediaQuery.of(context).size.width * 0.025)),
                      color: Color(0xff00777f),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 5.0,
                          offset: Offset(
                            0,
                            5.0,
                          ),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "WEIGHT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "65",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width *
                                            0.005)),
                                Text(
                                  "KGS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.055,
                          width: MediaQuery.of(context).size.height * 0.001,
                          color: Colors.white70,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "BMI",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "22.34",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.055,
                          width: MediaQuery.of(context).size.height * 0.001,
                          color: Colors.white70,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "HABITS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "3/5",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width *
                                            0.005)),
                                Text(
                                  "ADHERED",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.32,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HealthFactor(
                        healthFactorTitle: "WorkOut Time",
                        icon: FontAwesomeIcons.dumbbell,
                        valueOfFactor: "45",
                        unitOfFactor: "MINS",
                      ),
                      HealthFactor(
                        healthFactorTitle: "Calories Burnt",
                        icon: FontAwesomeIcons.fire,
                        valueOfFactor: "120",
                        unitOfFactor: "KCAL",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HealthFactor(
                        healthFactorTitle: "Calories Eaten",
                        icon: FontAwesomeIcons.hamburger,
                        valueOfFactor: "1800",
                        unitOfFactor: "KCAL",
                      ),
                      HealthFactor(
                        healthFactorTitle: "Steps Walked",
                        icon: FontAwesomeIcons.shoePrints,
                        valueOfFactor: "8700",
                        unitOfFactor: "",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HealthFactor(
                        healthFactorTitle: "Water Consumed",
                        icon: FontAwesomeIcons.glassWhiskey,
                        valueOfFactor: "45",
                        unitOfFactor: "LITRES",
                      ),
                      HealthFactor(
                        healthFactorTitle: "Extra Activity Time",
                        icon: FontAwesomeIcons.running,
                        valueOfFactor: "0.0",
                        unitOfFactor: "MINS",
                      ),
                    ],
                  ),
                ],
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.21,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: 0),
            decoration: BoxDecoration(
                // color: Colors.red[100],
                ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      5,
                      MediaQuery.of(context).size.height * 0.002,
                      5,
                      MediaQuery.of(context).size.height * 0.001,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Workout Titles :",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.6),
                          child: Wrap(
                            children: [
                              GestureDetector(
                                child: Text(
                                  "Daily Plan, ",
                                  style: TextStyle(
                                      color: Color(0xff00777f),
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {},
                              ),
                              GestureDetector(
                                child: Text(
                                  "Personalized Plan, ",
                                  style: TextStyle(
                                      color: Color(0xff00777f),
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {},
                              ),
                              GestureDetector(
                                child: Text(
                                  "Daily Plaan ,",
                                  style: TextStyle(
                                      color: Color(0xff00777f),
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {},
                              ),
                              GestureDetector(
                                child: Text(
                                  "Personalized Plan",
                                  style: TextStyle(
                                      color: Color(0xff00777f),
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: MediaQuery.of(context).size.height * 0.02,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.001,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      5,
                      MediaQuery.of(context).size.height * 0.001,
                      5,
                      MediaQuery.of(context).size.height * 0.002,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Food Consumed :",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.6),
                          child: Wrap(
                            children: [
                              GestureDetector(
                                child: Text(
                                  "Palak Paneer,",
                                  style: TextStyle(
                                      color: Color(0xff00777f),
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {},
                              ),
                              GestureDetector(
                                child: Text(
                                  "Cheese Vada ,",
                                  style: TextStyle(
                                      color: Color(0xff00777f),
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {},
                              ),
                              GestureDetector(
                                child: Text(
                                  "Paneer Burji ,",
                                  style: TextStyle(
                                      color: Color(0xff00777f),
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
