import 'package:chat_app/MessageOptions.dart';
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
  bool hidePopUp = false;
  bool bottomMenu = false;
  bool viewOptionsClicked = false;
  double _optionsHeight = 0.0;

  // double kheight = MediaQuery.of(context).view
  TextEditingController messageController = TextEditingController();
  FocusNode _messageFocus = new FocusNode();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    _optionsHeight = 200;
    _messageFocus.addListener(() {
      if (MediaQuery.of(context).viewInsets.bottom == 0) {
        setState(() {
          bottomMenu = false;
        });
      } else if (viewOptionsClicked) {
        Future.delayed(Duration(milliseconds: 100), () {
          setState(() {
            bottomMenu = true;
            viewOptionsClicked = false;
          });
        });
      } else {
        setState(() {
          bottomMenu = false;
          viewOptionsClicked = false;
        });
      }
    });
    super.initState();
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
    return GestureDetector(
      onTap: () {
        if (hidePopUp) {
          setState(() {
            hidePopUp = false;
          });
        }
        if (bottomMenu) {
          setState(() {
            bottomMenu = false;
            viewOptionsClicked = false;
          });
        }
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SafeArea(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                                top: 8.0,
                                bottom: 16.0),
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
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            'Nilanjana C',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            'Verified Nutrionist',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                RaisedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Live Call',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                  color: Color(0xff00777e),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0))),
                                )
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
                Expanded(
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
                        // reverse: true,
                        children: <Widget>[
                          ...messages,
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
                  child: Container(
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            focusNode: _messageFocus,
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
                                  borderSide:
                                      BorderSide(color: Color(0xffe7eef4)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffe7eef4)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.send),
                                    onPressed: callback),
                                border: InputBorder.none),
                            controller: messageController,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (!bottomMenu) {
                              if (MediaQuery.of(context).viewInsets.bottom ==
                                  0) {
                                setState(() {
                                  hidePopUp = true;
                                });
                              } else {
                                _optionsHeight =
                                    MediaQuery.of(context).viewInsets.bottom;
                                viewOptionsClicked = true;
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              }
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffe7eef4),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.add),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                bottomMenu
                    ? MessageOptions(
                        height: _optionsHeight,
                      )
                    : SizedBox.shrink()
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: hidePopUp,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: MessageOptions(
                        showBorders: true,
                        height: MediaQuery.of(context).size.height * 0.22,
                      ),
                    ),
                    Container(
                      height: 72,
                      color: Colors.transparent,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
