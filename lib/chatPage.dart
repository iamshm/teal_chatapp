import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'message.dart';

class Chat extends StatefulWidget {
  static const String id = "CHAT";
  final FirebaseUser user;

  const Chat({Key key, this.user}) : super(key: key);
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  bool viewVisible = false;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  void showMore() {
    setState(() {
      viewVisible = !viewVisible;
    });
  }

  Future<void> callback() async {
    if (messageController.text.length > 0) {
      await _firestore.collection('messages').add({
        'text': messageController.text,
        'from': widget.user.email,
        'date': DateTime.now().toIso8601String().toString(),
      });
      messageController.clear();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Stack(children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //appbar
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                height: 150,
                color: Colors.white,
                child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.chevron_left),
                        color: Colors.black54,
                        iconSize: 32,
                        onPressed: () {
                          _auth.signOut();
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        },
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://www.woolha.com/media/2019/06/buneary.jpg"),
                              radius: 35,
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                    'Nilanjana C',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                    'Verified Nutrionist',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: 70,
                          height: 20,
                          margin: const EdgeInsets.only(right: 10),
                          // color: Color(0xff45e19d),
                          decoration: BoxDecoration(
                            color: Color(0xff45e19d),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 3.0,
                              ),
                            ],
                          ),
                          child: Center(
                            child: FlatButton(
                              child: Text(
                                'Live Call',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontSize: 8),
                              ),
                              onPressed: null,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              ),

              //chatpart
              Expanded(
                flex: 4,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('messages')
                      .orderBy('date')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(
                        child: CircularProgressIndicator(),
                      );

                    List<DocumentSnapshot> docs = snapshot.data.documents;

                    List<Widget> messages = docs
                        .map((doc) => Message(
                              from: doc.data['from'],
                              date: doc.data['date'],
                              text: doc.data['text'],
                              me: widget.user.email == doc.data['from'],
                            ))
                        .toList();

                    return ListView(
                      controller: scrollController,
                      children: <Widget>[
                        ...messages,
                      ],
                    );
                  },
                ),
              ),
              //inputfield

              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 0, 10),
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      onSubmitted: (value) => callback(),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffe7eef4),
                          hintText: "Write a Message...",
                          hintStyle: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'Montserrat',
                              fontSize: 14),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffe7eef4)),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffe7eef4)),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(Icons.send), onPressed: callback),
                          border: InputBorder.none),
                      controller: messageController,
                    )),
                    RawMaterialButton(
                      onPressed: showMore,
                      child: new Icon(
                        Icons.add,
                        color: Colors.blue,
                        size: 20.0,
                      ),
                      shape: new CircleBorder(),
                      fillColor: Color(0xffe7eef4),
                      elevation: 0,
                      padding: const EdgeInsets.all(1.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.width * 0.12,
            left: MediaQuery.of(context).size.width * 0.020,
            child: Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: viewVisible,
                child: Container(
                    height: MediaQuery.of(context).size.width * 0.5,
                    width: MediaQuery.of(context).size.width * 0.96,
                    decoration: BoxDecoration(
                      color: Colors.teal[400],
                      // (0xffa0cef7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.only(top: 50, bottom: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RawMaterialButton(
                                onPressed: () {},
                                child: new Icon(
                                  Icons.add,
                                  color: Colors.blue,
                                  size: 60.0,
                                ),
                                shape: new CircleBorder(),
                                fillColor: Color(0xffe7eef4),
                                elevation: 0,
                                padding: const EdgeInsets.all(1.0),
                              ),
                              RawMaterialButton(
                                onPressed: () {},
                                child: new Icon(
                                  Icons.add,
                                  color: Colors.blue,
                                  size: 60.0,
                                ),
                                shape: new CircleBorder(),
                                fillColor: Color(0xffe7eef4),
                                elevation: 0,
                                padding: const EdgeInsets.all(1.0),
                              ),
                              RawMaterialButton(
                                onPressed: () {},
                                child: new Icon(
                                  Icons.add,
                                  color: Colors.blue,
                                  size: 60.0,
                                ),
                                shape: new CircleBorder(),
                                fillColor: Color(0xffe7eef4),
                                elevation: 0,
                                padding: const EdgeInsets.all(1.0),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RawMaterialButton(
                                onPressed: () {},
                                child: new Icon(
                                  Icons.add,
                                  color: Colors.blue,
                                  size: 60.0,
                                ),
                                shape: new CircleBorder(),
                                fillColor: Color(0xffe7eef4),
                                elevation: 0,
                                padding: const EdgeInsets.all(1.0),
                              ),
                              RawMaterialButton(
                                onPressed: () {},
                                child: new Icon(
                                  Icons.add,
                                  color: Colors.blue,
                                  size: 60.0,
                                ),
                                shape: new CircleBorder(),
                                fillColor: Color(0xffe7eef4),
                                elevation: 0,
                                padding: const EdgeInsets.all(1.0),
                              ),
                              RawMaterialButton(
                                onPressed: () {},
                                child: new Icon(
                                  Icons.add,
                                  color: Colors.blue,
                                  size: 60.0,
                                ),
                                shape: new CircleBorder(),
                                fillColor: Color(0xffe7eef4),
                                elevation: 0,
                                padding: const EdgeInsets.all(1.0),
                              ),
                            ],
                          )
                        ])
                    //  Center(
                    //   child: Text('Show Hide Text View Widget in Flutter',
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(color: Colors.white, fontSize: 23)),
                    // ),
                    )),
          ),
        ]),
      ),
    );
  }
}
