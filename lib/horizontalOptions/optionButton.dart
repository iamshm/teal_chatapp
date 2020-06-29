import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String optionName;
  final IconData optionIcon;
  final bool colorFul;

  const OptionButton({Key key, this.optionName, this.optionIcon, this.colorFul})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        width: 120,
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorFul ? Colors.blue[400] : Colors.white70,
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
                color: colorFul ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
