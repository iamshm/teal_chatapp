import 'dart:convert';
import 'package:chat_app/calendar/calendarEvents.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  static const String id = "CALENDAR";
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    initPrefs();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedeefc),
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: IconButton(
                            icon: Icon(Icons.chevron_left),
                            color: Colors.black,
                            iconSize: 24,
                            onPressed: () {
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: IconButton(
                              icon: Icon(Icons.add),
                              color: Colors.black,
                              iconSize: 24,
                              onPressed: _showAddDialog,
                            )),
                      ],
                    )
                  ]),
            ),
          ),
          Column(
            children: <Widget>[
              TableCalendar(
                events: _events,
                initialCalendarFormat: CalendarFormat.month,
                availableGestures: AvailableGestures.horizontalSwipe,
                calendarStyle: CalendarStyle(
                  canEventMarkersOverflow: true,
                ),
                headerStyle: HeaderStyle(
                    leftChevronPadding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.2),
                    rightChevronPadding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.2),
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    centerHeaderTitle: true,
                    formatButtonVisible: false),
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: (date, events) {
                  setState(() {
                    _selectedEvents = events;
                  });
                },
                builders: CalendarBuilders(
                  todayDayBuilder: (context, date, events) => Container(
                      padding: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                  weekendDayBuilder: (context, date, events) => Container(
                      padding: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                        ),
                      )),
                  dayBuilder: (context, date, events) => Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                        ),
                      )),
                  selectedDayBuilder: (context, date, events) => Container(
                      padding: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                  outsideDayBuilder: (context, date, events) => Container(
                      padding: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(
                            color: Colors.black45,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      )),
                  outsideWeekendDayBuilder: (context, date, events) =>
                      Container(
                          padding: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(
                                color: Colors.black45,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          )),
                  dowWeekdayBuilder: (context, weekday) => Container(
                      padding: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      child: Text(
                        weekday.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      )),
                ),
                calendarController: _controller,
              ),
            ],
          ),

          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.height,
                  height: MediaQuery.of(context).size.height * 0.051,
                  decoration: BoxDecoration(
                    color: Color(0xffedeefc),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, -10.0),
                        blurRadius: 7.0,
                      ),
                    ],
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.005,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
                //Saturday date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Saturday",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Montserrat',
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(5)),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "10 April 2018",
                                    style: TextStyle(
                                        color: Colors.black26,
                                        fontFamily: 'Montserrat',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ])
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "1000\$",
                                    style: TextStyle(
                                        color: Colors.green[300],
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(5)),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "500\$",
                                    style: TextStyle(
                                        color: Colors.red[200],
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ])
                      ],
                    ),
                  ],
                ),
                //event list 1
                CalendarEvents(
                  from: "2:00 pm",
                  to: "8:00 pm",
                  color: Colors.blueAccent,
                  eventName: "Guns N' Roses",
                  eventType: "Concert",
                ),
                //event list 2
                CalendarEvents(
                  from: "9:00 pm",
                  to: "1:00 am",
                  color: Color(0xfffa836d),
                  eventName: "The Rolling Stones",
                  eventType: "Concert",
                ),
                //event list 3
                CalendarEvents(
                  from: "2:00 pm",
                  to: "8:00 pm",
                  color: Color(0xffeb4986),
                  eventName: "Linkin Park",
                  eventType: "Concert",
                ),
                //wednesday date
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(padding: EdgeInsets.all(15)),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Wednesday",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Montserrat',
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(5)),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "14 April 2018",
                                    style: TextStyle(
                                        color: Colors.black26,
                                        fontFamily: 'Montserrat',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ])
                      ],
                    ),
                  ],
                ),
                //event list 4
                CalendarEvents(
                  from: "2:00 pm",
                  to: "8:00 pm",
                  color: Color(0xff52577a),
                  eventName: "The Chainsmokers",
                  eventType: "Concert",
                ),

                ..._selectedEvents.map(
                  (event) => ListTile(
                    contentPadding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    title: Text(
                      event,
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.black45,
                        iconSize: 24,
                        onPressed: () {}),
                    // hoverColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ))
          // Drag bar
        ],
      ),
    );
  }

  _showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Add Event"),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: "Enter Event"),
                    controller: _eventController,
                  ),
                ]),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Save"),
                  onPressed: () {
                    if (_eventController.text.isEmpty) return;
                    if (_events[_controller.selectedDay] != null) {
                      _events[_controller.selectedDay]
                          .add(_eventController.text);
                    } else {
                      _events[_controller.selectedDay] = [
                        _eventController.text
                      ];
                    }
                    prefs.setString("events", json.encode(encodeMap(_events)));
                    _eventController.clear();
                    Navigator.pop(context);
                  },
                ),
              ],
            ));
    setState(() {
      _selectedEvents = _events[_controller.selectedDay];
    });
  }
}
