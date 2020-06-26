import 'package:chat_app/planCheckout/checkoutDetails.dart';
import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  static const String id = "CHECKOUT";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Checkout",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat'),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: <Widget>[
            CheckoutDetails(
              detail: "Plan Duration : ",
            ),
            CheckoutDetails(
              detail: "Amount : ",
            ),
            CheckoutDetails(
              detail: "Discount : ",
            ),
            CheckoutDetails(
              detail: "Monthly Cost : ",
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Text(
                "Plan Description",
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Flexible(
                child: Text(
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontFamily: 'Montserrat'),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //Coupon Text Field
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onSubmitted: null,
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 25.0),
                  hintText: 'Enter coupon',
                  hintStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                      fontFamily: 'Montserrat'),
                  // suffixIcon: IconButton(icon: Icon(Icons.send), onPressed: null),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal[600], width: 2),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
