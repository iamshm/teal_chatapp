import 'package:chat_app/BottomTab/bottomNavBar.dart';
import 'package:chat_app/Coupons/coupon.dart';
import 'package:chat_app/calendar/calendar.dart';
import 'package:chat_app/chat/chatPage.dart';
import 'package:chat_app/collapseAppBar/sliverScreen.dart';
import 'package:chat_app/dailyTargets/dailyTarget.dart';
import 'package:chat_app/fatSecret/recipe.dart';
import 'package:chat_app/healthProfile/healthProfile.dart';
import 'package:chat_app/notchedBottomTab/notchbottom.dart';
import 'package:chat_app/planCheckout/checkout.dart';
import 'package:chat_app/prepareFast/prepareFast.dart';
import 'package:chat_app/videoPlayer/videoPages.dart';
import 'package:chat_app/webviewYoutube/webviewYT.dart';
import 'package:chat_app/youtubeVideos/screens/ytHomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  static const String id = "HOMESCREEN";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Teal WellNess",
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomButton(
              text: "Log In",
              buttoncolor: Colors.blue,
              callback: () {
                Navigator.of(context).pushNamed(Login.id);
              },
            ),
            CustomButton(
              text: "Register",
              buttoncolor: Colors.green,
              callback: () {
                Navigator.of(context).pushNamed(Registration.id);
              },
            ),
            CustomButton(
              text: "Calendar",
              buttoncolor: Colors.red[400],
              callback: () {
                Navigator.of(context).pushNamed(Calendar.id);
              },
            ),
            CustomButton(
              text: "Daily Targets",
              buttoncolor: Colors.yellow,
              callback: () {
                Navigator.of(context).pushNamed(DailyTarget.id);
              },
            ),
            CustomButton(
              text: "Health Profile",
              buttoncolor: Colors.orange,
              callback: () {
                Navigator.of(context).pushNamed(HealthProfile.id);
              },
            ),
            CustomButton(
              text: "Fast NavBar ",
              buttoncolor: Colors.pink[200],
              callback: () {
                Navigator.of(context).pushNamed(BottomNavBar.id);
              },
            ),
            CustomButton(
              text: "Prepare Fast ",
              buttoncolor: Colors.blue[200],
              callback: () {
                Navigator.of(context).pushNamed(PrepareFast.id);
              },
            ),
            CustomButton(
              text: "Collapse Appbar ",
              buttoncolor: Colors.orange[700],
              callback: () {
                Navigator.of(context).pushNamed(SliverScreen.id);
              },
            ),
            CustomButton(
              text: "Notched BottomBAr ",
              buttoncolor: Colors.green[700],
              callback: () {
                Navigator.of(context).pushNamed(NotchBottom.id);
              },
            ),
            CustomButton(
              text: "Coupons ",
              buttoncolor: Colors.blue[700],
              callback: () {
                Navigator.of(context).pushNamed(CouponData.id);
              },
            ),
            CustomButton(
              text: "WebViewYouTube ",
              buttoncolor: Colors.green[700],
              callback: () {
                Navigator.of(context).pushNamed(WebViewYoutube.id);
              },
            ),
            CustomButton(
              text: "VideoPlayer ",
              buttoncolor: Colors.blue[700],
              callback: () {
                Navigator.of(context).pushNamed(VideoPages.id);
              },
            ),
            CustomButton(
              text: "Recipe ",
              buttoncolor: Colors.blue[700],
              callback: () {
                Navigator.of(context).pushNamed(Recipe.id);
              },
            ),
            CustomButton(
              text: "Check Out ",
              buttoncolor: Colors.orange[700],
              callback: () {
                Navigator.of(context).pushNamed(Checkout.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;
  final Color buttoncolor;

  const CustomButton({Key key, this.callback, this.text, this.buttoncolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: buttoncolor,
        elevation: 6.0,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200.0,
          height: 45.0,
          child: Text(text),
        ),
      ),
    );
  }
}

class Registration extends StatefulWidget {
  static const String id = "REGISTRATION";

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String email;
  String password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser() async {
    FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Chat(
          user: user,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Chat"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => email = value,
            decoration: InputDecoration(
              hintText: "Enter Your Email...",
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextField(
            autocorrect: false,
            obscureText: true,
            onChanged: (value) => password = value,
            decoration: InputDecoration(
              hintText: "Enter Your Password...",
              border: const OutlineInputBorder(),
            ),
          ),
          CustomButton(
            text: "Register",
            callback: () async {
              await registerUser();
            },
          )
        ],
      ),
    );
  }
}

class Login extends StatefulWidget {
  static const String id = "LOGIN";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser() async {
    FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: "test@test.com",
      password: "testtest",
    ))
        .user;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Chat(
          user: user,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teal Chat"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => email = value,
            decoration: InputDecoration(
              hintText: "Enter Your Email...",
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextField(
            autocorrect: false,
            obscureText: true,
            onChanged: (value) => password = value,
            decoration: InputDecoration(
              hintText: "Enter Your Password...",
              border: const OutlineInputBorder(),
            ),
          ),
          CustomButton(
            text: "Log In",
            callback: () async {
              await loginUser();
            },
          )
        ],
      ),
    );
  }
}
