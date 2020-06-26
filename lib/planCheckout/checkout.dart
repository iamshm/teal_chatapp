import 'package:chat_app/planCheckout/checkoutDetails.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  static const String id = "CHECKOUT";

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  FocusNode _focus = new FocusNode();
  bool isfocus = false;
  bool isfilled = false;
  TextEditingController _controller = new TextEditingController();
  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
    _controller.addListener(onTextChange);
  }

  void onTextChange() {
    setState(() {
      isfilled = _controller.text.isNotEmpty;
    });
  }

  void _onFocusChange() {
    setState(() {
      isfocus = _focus.hasFocus;
    });
  }

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
              value: " 1 month",
            ),
            CheckoutDetails(
              detail: "Amount : ",
              value: "Rs. 10000",
            ),
            CheckoutDetails(
              detail: "Discount : ",
              value: " 20 %",
            ),
            CheckoutDetails(
              detail: "Monthly Cost : ",
              value: " Rs 1350",
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Plan Description",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat'),
                ),
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
                  focusNode: _focus,
                  controller: _controller,
                  onSubmitted: null,
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 25.0),
                    hintText: 'Enter coupon',
                    labelText: "Coupon",
                    labelStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                    ),
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
                    suffixIcon: (isfocus && isfilled)
                        ? IconButton(
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.teal,
                            ),
                            onPressed: () => _controller.clear(),
                          )
                        : null,
                  )),
            ),
          ],
        )),
      ),
    );
  }
}
