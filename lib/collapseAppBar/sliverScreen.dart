import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SliverScreen extends StatefulWidget {
  static const String id = "SLIVERSCREEN";

  @override
  _SliverScreenState createState() => _SliverScreenState();
}

class _SliverScreenState extends State<SliverScreen> {
  ScrollController _controller;
  Color color;
  Widget holder;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController()
      ..addListener(
        () => _isAppBarExpanded
            ? holder != CollapsedAction()
                ? setState(
                    () {
                      holder = CollapsedAction();
                      print('setState is called');
                    },
                  )
                : {}
            : holder != ExpandedAction()
                ? setState(() {
                    print('setState is called');
                    holder = ExpandedAction();
                  })
                : {},
      );
  }

  bool get _isAppBarExpanded {
    return _controller.hasClients &&
        _controller.offset >
            (MediaQuery.of(context).size.height * 0.175 - kToolbarHeight);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: MediaQuery.of(context).size.height * 0.25,
            pinned: true,
            leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Color(0xff495057),
                ),
                onPressed: () {}),
            actions: <Widget>[
              Container(

                  // color: Color(0xffe7eef4),
                  child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.shoppingBag,
                  color: Color(0xff495057),
                  size: 18,
                ),
                onPressed: () {},
              )),
            ],
            flexibleSpace: holder,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(color: Colors.red, height: 150.0),
                Container(color: Colors.purple, height: 150.0),
                Container(color: Colors.green, height: 150.0),
                Container(color: Colors.amber, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
                Container(color: Colors.orange, height: 150.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ExpandedAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.height * 0.07,
            MediaQuery.of(context).size.height * 0.01,
            MediaQuery.of(context).size.height * 0.01,
            MediaQuery.of(context).size.height * 0.01,
          ),
          child: Text(
            "Choose your new \n diet plan",
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        // SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.height * 0.07,
                MediaQuery.of(context).size.height * 0.01,
                MediaQuery.of(context).size.height * 0.01,
                MediaQuery.of(context).size.height * 0.01,
              ),
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.7,
              // color: Colors.red,
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffe7eef4),
                    hintText: "Search",
                    hintStyle: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Montserrat',
                        fontSize: 14),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffe7eef4)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffe7eef4)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xff495057),
                    ),
                    border: InputBorder.none),
              ),
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.slidersH,
                color: Color(0xff495057),
              ),
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}

class CollapsedAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.035,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              // color: Color(0xffe7eef4),
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  size: 24,
                  color: Color(0xff495057),
                ),
                onPressed: () {},
              ),
            ),
            Container(
                // color: Color(0xffe7eef4),
                child: IconButton(
              icon: Icon(
                FontAwesomeIcons.slidersH,
                color: Color(0xff495057),
                size: 18,
              ),
              onPressed: () {},
            )),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            )
          ],
        )
      ],
    );
  }
}
