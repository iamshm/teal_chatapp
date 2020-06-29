import 'package:chat_app/horizontalOptions/optionButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HorizontalList extends StatelessWidget {
  static const String id = "HORIZONTALLIST";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
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
                      color: Colors.black87,
                      fontSize: 24),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //Horizontal List View
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            height: 150,
            // color: Colors.grey,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(
                  width: 50,
                ),
                OptionButton(
                  optionName: "Food",
                  optionIcon: FontAwesomeIcons.pizzaSlice,
                  colorFul: true,
                ),
                OptionButton(
                  optionName: "Retail",
                  optionIcon: FontAwesomeIcons.cartPlus,
                  colorFul: false,
                ),
                OptionButton(
                  optionName: "Travel",
                  optionIcon: FontAwesomeIcons.globeAmericas,
                  colorFul: true,
                ),
                OptionButton(
                  optionName: "Sports",
                  optionIcon: FontAwesomeIcons.dumbbell,
                  colorFul: false,
                ),
                OptionButton(
                  optionName: "Entertainment",
                  optionIcon: FontAwesomeIcons.music,
                  colorFul: true,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
