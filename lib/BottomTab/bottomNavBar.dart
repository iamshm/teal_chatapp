import 'package:chat_app/BottomTab/bottomScreens/fastScreen.dart';
import 'package:chat_app/BottomTab/bottomScreens/historyScreen.dart';
import 'package:chat_app/BottomTab/bottomScreens/learnScreen.dart';
import 'package:chat_app/BottomTab/bottomScreens/timerScreen.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatefulWidget {
  static const String id = "BOTTOMNAVBAR";
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 1;
  static List<Widget> _widgetOptions = <Widget>[
    TimerScreen(),
    FastScreen(),
    HistoryScreen(),
    LearnScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.clock),
            title: Text(
              'Timer',
              style: TextStyle(

                  // fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.box),
            title: Text(
              'Fasts',
              style: TextStyle(

                  // fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.chartBar),
            title: Text(
              'History',
              style: TextStyle(
                  // fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.book),
            title: Text(
              'Learn',
              style: TextStyle(

                  // fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: bottomTab,
        onTap: _onItemTapped,
        iconSize: 18,
      ),
    );
  }
}
