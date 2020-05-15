import 'package:chat_app/BottomTab/bottomNavBar.dart';
import 'package:chat_app/calendar/calendar.dart';
import 'package:chat_app/collapseAppBar/sliverScreen.dart';
import 'package:chat_app/healthProfile/healthProfile.dart';
import 'package:chat_app/homePage.dart';
import 'package:chat_app/dailyTargets/dailyTarget.dart';
import 'package:chat_app/notchedBottomTab/notchbottom.dart';
import 'package:chat_app/prepareFast/prepareFast.dart';
import 'chat/chatPage.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Raleway'),
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        Registration.id: (context) => Registration(),
        Login.id: (context) => Login(),
        Chat.id: (context) => Chat(),
        Calendar.id: (context) => Calendar(),
        DailyTarget.id: (context) => DailyTarget(),
        HealthProfile.id: (context) => HealthProfile(),
        BottomNavBar.id: (context) => BottomNavBar(),
        PrepareFast.id: (context) => PrepareFast(),
        SliverScreen.id: (context) => SliverScreen(),
        NotchBottom.id: (context) => NotchBottom(),
      },
    );
  }
}
