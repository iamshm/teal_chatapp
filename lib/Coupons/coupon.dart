import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CouponData extends StatefulWidget {
  static const String id = "COUPON";

  @override
  _CouponDataState createState() => _CouponDataState();
}

class _CouponDataState extends State<CouponData> {
  final Firestore _firestore = Firestore.instance;

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Coupons"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('coupons')
                    .orderBy('limit')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  List<DocumentSnapshot> docs = snapshot.data.documents;

                  List<Widget> coupons = docs
                      .map((doc) => Coupon(
                            amount: doc.data['amount'],
                            name: doc.data['name'],
                            percentage: doc.data['percentage'],
                            limit: doc.data['limit'],
                          ))
                      .toList();

                  return ListView(
                    controller: scrollController,
                    // reverse: true,
                    children: <Widget>[
                      ...coupons,
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
}

class Coupon extends StatefulWidget {
  final String amount, name;
  final bool percentage;
  final int limit;

  const Coupon({Key key, this.amount, this.name, this.percentage, this.limit})
      : super(key: key);

  @override
  _CouponState createState() => _CouponState();
}

class _CouponState extends State<Coupon> {
  couponCount() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01,
          horizontal: MediaQuery.of(context).size.width * 0.1,
        ),
        height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: Colors.amberAccent[100],
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "${widget.limit}",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    Text(
                      " coupon left",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      widget.amount,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    Text(
                      widget.percentage ? "%" : "Rs",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
                IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    onPressed: null)
              ],
            )
          ],
        ),
      ),
    );
  }
}
