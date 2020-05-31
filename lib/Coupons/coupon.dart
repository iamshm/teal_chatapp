import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CouponData extends StatefulWidget {
  static const String id = "COUPON";

  @override
  _CouponDataState createState() => _CouponDataState();
}

class _CouponDataState extends State<CouponData> {
  bool validCoupon = false;
  TextEditingController _controller;

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
          docs.documents[0].reference
              .updateData({'limit': docs.documents[0].data['limit'] - 1});
        }
      });
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
                  onChanged: (val) {
                    validity(val);
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 25.0),
                      hintText: 'Enter coupon',
                      hintStyle: TextStyle(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0))),
                ),
              ),
              Text(
                validCoupon
                    ? "Coupon applied Successfully"
                    : "Enter a valid Coupon",
                style: TextStyle(fontSize: 24),
              ),
            ]));
  }
}
