import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String optionName;
  final IconData optionIcon;
  final bool colorFul;
  final double optionHeight;
  final double optionWidth;

  const OptionButton({
    Key key,
    this.optionName,
    this.optionIcon,
    this.colorFul,
    this.optionHeight,
    this.optionWidth,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: optionHeight,
        width: optionWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.2, 1],
              colors: colorFul
                  ? [Color(0xff18dbcb), Colors.blue]
                  : [Colors.white30, Colors.grey[350]]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  optionIcon,
                  color: colorFul ? Colors.white : Colors.black87,
                ),
                onPressed: null),
            Text(
              optionName,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: colorFul ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
