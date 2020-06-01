import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CouponData extends StatefulWidget {
  static const String id = "COUPON";

  @override
  _CouponDataState createState() => _CouponDataState();
}

class _CouponDataState extends State<CouponData> {
  bool validCoupon = false;

  DocumentSnapshot docref;

  validity(value) {
    if (value.length == 0) {
      setState(() {
        validCoupon = false;
      });
    } else {
      Firestore.instance
          .collection("coupons")
          .where('name', isEqualTo: value)
          .getDocuments()
          .then((QuerySnapshot docs) {
        if (docs.documents.isNotEmpty) {
          setState(() {
            validCoupon = true;
          });
          docref = docs.documents[0];
        } else {
          setState(() {
            validCoupon = false;
          });
        }
      });
    }
  }

  useCoupon() {
    if (validCoupon) {
      if (docref.data['limit'] > 0 && docref.data['perUserLimit'] > 0) {
        docref.reference.updateData({'limit': docref.data['limit'] - 1});
        docref.reference
            .updateData({'perUserLimit': docref.data['perUserLimit'] - 1});
      } else {
        validCoupon = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Coupons '),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onSubmitted: (value) => {validity(value)},
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 25.0),
                hintText: 'Enter coupon',
                hintStyle: TextStyle(),
                suffixIcon:
                    IconButton(icon: Icon(Icons.send), onPressed: useCoupon()),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ),
          Text(
            validCoupon ? "Coupon is Valid" : "Enter a valid Coupon",
            style: TextStyle(fontSize: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                validCoupon
                    ? (docref.data["limit"] - 1).toString()
                    : "Not a valid",
                style: TextStyle(fontSize: 24),
              ),
              Text(
                " Coupon ",
                style: TextStyle(fontSize: 24),
              ),
            ],
          )
        ],
      ),
    );
  }
}
