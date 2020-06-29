import 'package:chat_app/horizontalOptions/optionButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HorizontalList extends StatelessWidget {
  static const String id = "HORIZONTALLIST";
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
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 50,
                        left: 50,
                        child: OptionButton(
                          optionName: "Food",
                          optionIcon: FontAwesomeIcons.pizzaSlice,
                          colorFul: true,
                          optionHeight: 140,
                          optionWidth: 140,
                        ),
                      ),
                      Positioned(
                        top: 70,
                        right: 70,
                        child: OptionButton(
                          optionName: "Retail",
                          optionIcon: FontAwesomeIcons.cartPlus,
                          colorFul: false,
                          optionHeight: 120,
                          optionWidth: 120,
                        ),
                      ),
                      Positioned(
                        top: 250,
                        left: 20,
                        child: OptionButton(
                          optionName: "Travel",
                          optionIcon: FontAwesomeIcons.globeAmericas,
                          colorFul: false,
                          optionHeight: 120,
                          optionWidth: 120,
                        ),
                      ),
                      Positioned(
                        top: 200,
                        right: 120,
                        child: OptionButton(
                          optionName: "Sports",
                          optionIcon: FontAwesomeIcons.dumbbell,
                          colorFul: true,
                          optionHeight: 130,
                          optionWidth: 130,
                        ),
                      ),
                      Positioned(
                        top: 350,
                        right: 50,
                        child: OptionButton(
                          optionName: "Entertainment",
                          optionIcon: FontAwesomeIcons.music,
                          colorFul: false,
                          optionHeight: 150,
                          optionWidth: 150,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 50,
                        left: 10,
                        child: OptionButton(
                          optionName: "Food",
                          optionIcon: FontAwesomeIcons.pizzaSlice,
                          colorFul: false,
                          optionHeight: 120,
                          optionWidth: 120,
                        ),
                      ),
                      Positioned(
                        top: 70,
                        right: 70,
                        child: OptionButton(
                          optionName: "Retail",
                          optionIcon: FontAwesomeIcons.cartPlus,
                          colorFul: false,
                          optionHeight: 120,
                          optionWidth: 120,
                        ),
                      ),
                      Positioned(
                        top: 250,
                        left: 20,
                        child: OptionButton(
                          optionName: "Travel",
                          optionIcon: FontAwesomeIcons.globeAmericas,
                          colorFul: false,
                          optionHeight: 120,
                          optionWidth: 120,
                        ),
                      ),
                      Positioned(
                        top: 200,
                        right: 120,
                        child: OptionButton(
                          optionName: "Sports",
                          optionIcon: FontAwesomeIcons.dumbbell,
                          colorFul: true,
                          optionHeight: 130,
                          optionWidth: 130,
                        ),
                      ),
                      Positioned(
                        top: 350,
                        right: 50,
                        child: OptionButton(
                          optionName: "Entertainment",
                          optionIcon: FontAwesomeIcons.music,
                          colorFul: false,
                          optionHeight: 150,
                          optionWidth: 150,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 50,
                        left: 10,
                        child: OptionButton(
                          optionName: "Food",
                          optionIcon: FontAwesomeIcons.pizzaSlice,
                          colorFul: true,
                          optionHeight: 120,
                          optionWidth: 120,
                        ),
                      ),
                      Positioned(
                        top: 70,
                        right: 70,
                        child: OptionButton(
                          optionName: "Retail",
                          optionIcon: FontAwesomeIcons.cartPlus,
                          colorFul: true,
                          optionHeight: 120,
                          optionWidth: 120,
                        ),
                      ),
                      Positioned(
                        top: 250,
                        left: 20,
                        child: OptionButton(
                          optionName: "Travel",
                          optionIcon: FontAwesomeIcons.globeAmericas,
                          colorFul: false,
                          optionHeight: 120,
                          optionWidth: 120,
                        ),
                      ),
                      Positioned(
                        top: 200,
                        right: 120,
                        child: OptionButton(
                          optionName: "Sports",
                          optionIcon: FontAwesomeIcons.dumbbell,
                          colorFul: false,
                          optionHeight: 130,
                          optionWidth: 130,
                        ),
                      ),
                      Positioned(
                        top: 350,
                        right: 150,
                        child: OptionButton(
                          optionName: "Entertainment",
                          optionIcon: FontAwesomeIcons.music,
                          colorFul: true,
                          optionHeight: 150,
                          optionWidth: 150,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

//  Positioned(
//                         top: 50,
//                         left: 50,
//                         child: OptionButton(
//                           optionName: "Food",
//                           optionIcon: FontAwesomeIcons.pizzaSlice,
//                           colorFul: true,
//                           optionHeight: 140,
//                           optionWidth: 140,
//                         ),
//                       ),
//                       Positioned(
//                         top: 70,
//                         right: 70,
//                         child:

//                       Positioned(
//                         top: 250,
//                         left: 20,
//                         child:

//                       ),
//                       Positioned(
//                         top: 200,
//                         right: 120,
//                         child: OptionButton(
//                           optionName: "Sports",
//                           optionIcon: FontAwesomeIcons.dumbbell,
//                           colorFul: true,
//                           optionHeight: 130,
//                           optionWidth: 130,
//                         ),
//                       ),
//                       Positioned(
//                         top: 350,
//                         right: 50,
//                         child: OptionButton(
//                           optionName: "Entertainment",
//                           optionIcon: FontAwesomeIcons.music,
//                           colorFul: false,
//                           optionHeight: 150,
//                           optionWidth: 150,
//                         ),
//                       ),

//  Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: <Widget>[
//                           SizedBox(
//                             width: 40,
//                           ),
//                           OptionButton(
//                             optionName: "Food",
//                             optionIcon: FontAwesomeIcons.pizzaSlice,
//                             colorFul: true,
//                             optionHeight: 140,
//                             optionWidth: 140,
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           OptionButton(
//                             optionName: "Retail",
//                             optionIcon: FontAwesomeIcons.cartPlus,
//                             colorFul: false,
//                             optionHeight: 120,
//                             optionWidth: 120,
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           SizedBox(
//                             width: 50,
//                           ),
//                           OptionButton(
//                             optionName: "Travel",
//                             optionIcon: FontAwesomeIcons.globeAmericas,
//                             colorFul: false,
//                             optionHeight: 130,
//                             optionWidth: 130,
//                           ),
//                           SizedBox(
//                             width: 50,
//                           ),
//                           OptionButton(
//                             optionName: "Food",
//                             optionIcon: FontAwesomeIcons.pizzaSlice,
//                             colorFul: true,
//                             optionHeight: 140,
//                             optionWidth: 140,
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: <Widget>[
//                           OptionButton(
//                             optionName: "Food",
//                             optionIcon: FontAwesomeIcons.pizzaSlice,
//                             colorFul: true,
//                             optionHeight: 140,
//                             optionWidth: 140,
//                           ),
//                           OptionButton(
//                             optionName: "Food",
//                             optionIcon: FontAwesomeIcons.pizzaSlice,
//                             colorFul: true,
//                             optionHeight: 140,
//                             optionWidth: 140,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
