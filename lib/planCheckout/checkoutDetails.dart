import 'package:flutter/material.dart';

class CheckoutDetails extends StatelessWidget {
  final String detail, value;

  const CheckoutDetails({Key key, this.detail, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              detail,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat'),
            ),
            Container(
              // color: Colors.red,
              width: 200,
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
