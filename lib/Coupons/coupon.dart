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

  Widget _couponList(BuildContext context, DocumentSnapshot document) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool couponAvailable = true;
    updateCount() async {
      setState(() {
        if (document['limit'] < 1) {
          couponAvailable = false;
        } else {
          document.reference.updateData({'limit': document['limit'] - 1});
          couponAvailable = true;
        }
      });
    }

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 0,
        horizontal: screenWidth * 0.1,
      ),
      // decoration: BoxDecoration(
      //     color: Colors.amberAccent[100],
      //     borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                document["name"],
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Row(
                children: <Widget>[
                  Text(
                    document['limit'].toString(),
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
                    document['amount'],
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  Text(
                    document['percentage'] ? "%" : "Rs",
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
                onPressed: () => updateCount(),
              ),
            ],
          ),
        ],
      ),
    );
  }

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
              stream: _firestore.collection('coupons').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                return ListView.builder(
                  itemExtent: 80,
                  itemCount: snapshot.data.documents.length,
                  controller: scrollController,
                  // reverse: true,
                  itemBuilder: (context, index) =>
                      _couponList(context, snapshot.data.documents[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
