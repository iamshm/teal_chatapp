import 'package:chat_app/BottomTab/bottomScreens/fastScreen.dart';
import 'package:chat_app/BottomTab/bottomScreens/historyScreen.dart';
import 'package:chat_app/BottomTab/bottomScreens/learnScreen.dart';
import 'package:chat_app/BottomTab/bottomScreens/timerScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotchBottom extends StatefulWidget {
  static const String id = "NOTCHBOTTOM";
  @override
  _NotchBottomState createState() => _NotchBottomState();
}

class _NotchBottomState extends State<NotchBottom> {
  // Properties & Variables needed
  bool popUp = false;
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    TimerScreen(),
    FastScreen(),
    HistoryScreen(),
    LearnScreen(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HistoryScreen(); // Our first view in viewport
  void popUpFn() {
    setState(() {
      popUp = !popUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageStorage(
            child: currentScreen,
            bucket: bucket,
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.3,
            bottom: -MediaQuery.of(context).size.width * 0.2,
            child: Visibility(
              visible: popUp,
              child: Container(
                child: Column(
                  children: <Widget>[
                    ClipPath(
                      clipper: CustomHalfCircleClipper(),
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.height * 0.2,
                          decoration: new BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height * 0.1,
                            ),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                // bottom: 0,
                                left: MediaQuery.of(context).size.width * 0.14,
                                child: IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.tape,
                                    size: 18,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Positioned(
                                top: MediaQuery.of(context).size.height * 0.05,
                                left: MediaQuery.of(context).size.width * 0.02,
                                child: IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.glassWhiskey,
                                    size: 18,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Positioned(
                                top: MediaQuery.of(context).size.height * 0.05,
                                left: MediaQuery.of(context).size.width * 0.28,
                                child: IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.pencilAlt,
                                    size: 18,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: popUpFn,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            FastScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.dumbbell,
                          color: currentTab == 0 ? Colors.blue : Colors.grey,
                          size: 20,
                        ),
                        Text(
                          'Workouts',
                          style: TextStyle(
                              color:
                                  currentTab == 0 ? Colors.blue : Colors.grey,
                              fontFamily: 'Montserrat',
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            TimerScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.utensilSpoon,
                          color: currentTab == 1 ? Colors.blue : Colors.grey,
                          size: 20,
                        ),
                        Text(
                          'Nutrition',
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.blue : Colors.grey,
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            HistoryScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.home,
                          color: currentTab == 2 ? Colors.blue : Colors.grey,
                          size: 20,
                        ),
                        Text(
                          'Dashboard',
                          style: TextStyle(
                              color:
                                  currentTab == 2 ? Colors.blue : Colors.grey,
                              fontFamily: 'Montserrat',
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            LearnScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.facebookMessenger,
                          color: currentTab == 3 ? Colors.blue : Colors.grey,
                          size: 20,
                        ),
                        Text(
                          'Community',
                          style: TextStyle(
                              color:
                                  currentTab == 3 ? Colors.blue : Colors.grey,
                              fontFamily: 'Montserrat',
                              fontSize: 12),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomHalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = new Path();
    path.lineTo(0.0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
