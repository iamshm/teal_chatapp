import 'package:chat_app/horizontalOptions/optionButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HorizontalList extends StatelessWidget {
  static const String id = "HORIZONTALLIST";
  @override
  Widget build(BuildContext context) {
    List<double> posY = [50, 70, 250, 200, 350];

    List<double> posX = [50, 230, 20, 170, 220];

    int dataLength = 7;
    int tempLength = (dataLength - dataLength % 5) ~/ 5 + 1;

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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: tempLength,
              itemBuilder: (context, i) => Container(
                height: 600,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    OptionButton(
                      topD: posY[0],
                      leftD: posX[0],
                      optionName: "Food",
                      optionIcon: FontAwesomeIcons.pizzaSlice,
                      colorFul: true,
                      optionHeight: 140,
                      optionWidth: 140,
                    ),
                    OptionButton(
                      topD: posY[1],
                      leftD: posX[1],
                      optionName: "Retail",
                      optionIcon: FontAwesomeIcons.cartPlus,
                      colorFul: false,
                      optionHeight: 120,
                      optionWidth: 120,
                    ),
                    OptionButton(
                      topD: posY[2],
                      leftD: posX[2],
                      optionName: "Travel",
                      optionIcon: FontAwesomeIcons.globeAmericas,
                      colorFul: false,
                      optionHeight: 130,
                      optionWidth: 130,
                    ),
                    OptionButton(
                      topD: posY[3],
                      leftD: posX[3],
                      optionName: "Sports",
                      optionIcon: FontAwesomeIcons.dumbbell,
                      colorFul: true,
                      optionHeight: 130,
                      optionWidth: 130,
                    ),
                    OptionButton(
                      topD: posY[4],
                      leftD: posX[4],
                      optionName: "Entertainment",
                      optionIcon: FontAwesomeIcons.music,
                      colorFul: false,
                      optionHeight: 150,
                      optionWidth: 150,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
