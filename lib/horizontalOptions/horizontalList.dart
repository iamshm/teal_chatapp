import 'package:chat_app/horizontalOptions/optionButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class HorizontalList extends StatefulWidget {
  static const String id = "HORIZONTALLIST";

  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  void initState() {
    super.initState();
    _loadAsset();
    loadData();
  }

  List<double> posY = [50, 70, 250, 210, 350];
  List<double> posX = [50, 40, 40, 10, 20];
  int dataLength;
  var chunks = [];
  Future<String> _loadAsset() async {
    return await rootBundle.loadString('lib/horizontalOptions/optionData.json');
  }

  Future<String> loadData() async {
    String jsonString = await _loadAsset();
    final data = json.decode(jsonString);
    dataLength = data.length;
    print(dataLength);
    for (int i = 0; i < dataLength; i++) {
      if (i % 5 == 0) {
        var end = (i + 2 < dataLength) ? i + 2 : dataLength;
        chunks.add(data.sublist(i, end));
        i = i + 1;
      }
      if (i % 5 == 2) {
        var end = (i + 3 < dataLength) ? i + 3 : dataLength;
        chunks.add(data.sublist(i, end));
        i = i + 2;
      }
    }
  }

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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: chunks.length,
              itemBuilder: (context, i) => (i % 2 == 0)
                  ? Container(
                      height: 600,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Stack(
                        children: <Widget>[
                          OptionButton(
                            topD: posY[0],
                            leftD: posX[0],
                            optionName: chunks[i][0]['name'],
                            optionIcon: FontAwesomeIcons.pizzaSlice,
                            colorFul: true,
                            optionHeight: 140,
                            optionWidth: 140,
                          ),
                          OptionButton(
                            topD: posY[2],
                            leftD: posX[2],
                            optionName: chunks[i][1]['name'],
                            optionIcon: FontAwesomeIcons.globeAmericas,
                            colorFul: false,
                            optionHeight: 130,
                            optionWidth: 130,
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: 600,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Stack(
                        children: <Widget>[
                          OptionButton(
                            topD: posY[1],
                            leftD: posX[1],
                            optionName: chunks[i][0]['name'],
                            optionIcon: FontAwesomeIcons.cartPlus,
                            colorFul: false,
                            optionHeight: 120,
                            optionWidth: 120,
                          ),
                          OptionButton(
                            topD: posY[3],
                            leftD: posX[3],
                            optionName: chunks[i][1]['name'],
                            optionIcon: FontAwesomeIcons.dumbbell,
                            colorFul: true,
                            optionHeight: 130,
                            optionWidth: 130,
                          ),
                          OptionButton(
                            topD: posY[4],
                            leftD: posX[4],
                            optionName: chunks[i][2]['name'],
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
