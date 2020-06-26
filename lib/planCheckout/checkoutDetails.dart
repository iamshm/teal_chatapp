import 'package:flutter/material.dart';

class CheckoutDetails extends StatelessWidget {
  final String detail;

  const CheckoutDetails({Key key, this.detail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              detail,
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat'),
            ),
            Container(
              width: 200,
              child: TextField(
                onSubmitted: null,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Montserrat'),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 5.0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal[900], width: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
