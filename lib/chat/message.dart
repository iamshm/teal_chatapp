import 'package:flutter/material.dart';

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
                      SizedBox(
                        width: 8.0,
                      ),
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
                      ),
                    ],
                  ),
                ],
        ),
      ),
    );
  }
}
