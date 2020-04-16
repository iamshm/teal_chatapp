import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

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
        child: Column(
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
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.woolha.com/media/2019/06/buneary.jpg"),
                        radius: 35,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 80, 0),
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
                            margin: const EdgeInsets.fromLTRB(10, 0, 80, 0),
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
                      Container(
                        width: 70,
                        height: 20,
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
            //Inputfield
            Container(
              padding: const EdgeInsets.fromLTRB(20, 4, 10, 10),
              height: 60,
              child: Row(
                children: <Widget>[
                  Container(
                    child: Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 12),
                        decoration: BoxDecoration(
                            color: Color(0xff45e19d),
                            borderRadius: BorderRadius.circular(35),
                            gradient: LinearGradient(colors: [
                              Color(0xffe7eef4),
                              Color(0xffeffaf2),
                              Color(0xffeffaf2),
                              Color(0xffe3fdf9),
                            ])),
                        child: TextField(
                          onSubmitted: (value) => callback(),
                          decoration: InputDecoration(
                              hintText: "Write a Message...",
                              hintStyle: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'Montserrat',
                                  fontSize: 14
                                  // fontStyle: FontStyle.italic,
                                  ),
                              border: InputBorder.none),
                          controller: messageController,
                        ),
                      ),
                    ),
                  ),
                  SendButton(
                    text: "Send",
                    callback: callback,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  const SendButton({Key key, this.text, this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.teal,
      onPressed: callback,
      icon: Icon(
        Icons.arrow_forward,
      ),
      iconSize: 28,
    );
  }
}

class Message extends StatelessWidget {
  final String from;
  final String text;
  final String date;
  final double round = 20;
  final bool me;

  const Message({Key key, this.from, this.text, this.date, this.me})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment:
              me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: me
              ? <Widget>[
                  Text(
                    from,
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black54,
                        fontFamily: 'Montserrat'),
                  ),
                  Material(
                    color: Color(0xff00777e),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(round),
                      topRight: Radius.circular(round),
                      bottomLeft: Radius.circular(round),
                      bottomRight: Radius.zero,
                    ),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 300),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      child: Text(
                        text,
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Montserrat'),
                      ),
                    ),
                  )
                ]
              : <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.woolha.com/media/2019/06/buneary.jpg"),
                        radius: 10,
                      ),
                      SizedBox(width: 10),
                      Text(
                        from,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black54,
                            fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                  Row(children: <Widget>[
                    SizedBox(width: 35),
                    Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.circular(round),
                        bottomLeft: Radius.circular(round),
                        bottomRight: Radius.circular(round),
                      ),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 300),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Text(
                          text,
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'Montserrat'),
                        ),
                      ),
                    )
                  ]),
                ],
        ),
      ),
    );
  }
}
