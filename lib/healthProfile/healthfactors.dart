import 'package:flutter/material.dart';

class HealthFactor extends StatelessWidget {
  final IconData icon;
  final String healthFactorTitle;
  final String valueOfFactor;
  final String unitOfFactor;
 

  const HealthFactor(
      {Key key,
      this.icon,
      this.healthFactorTitle,
      this.valueOfFactor,
      this.unitOfFactor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: MediaQuery.of(context).size.height * 0.2,
      height: MediaQuery.of(context).size.height * 0.09,
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.height * 0.01,
          MediaQuery.of(context).size.height * 0.01,
          MediaQuery.of(context).size.height * 0.01,
          MediaQuery.of(context).size.height * 0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
            Radius.circular(MediaQuery.of(context).size.width * 0.025)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            blurRadius: 5.0,
            offset: Offset(
              0,
              5.0,
            ),
          )
        ],
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              healthFactorTitle,
              style: TextStyle(
                  color: Color(0xff00777f),
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              icon,
              size: 14,
              color: Color(0xff20be8b),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              valueOfFactor,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
            ),
            Text(
              unitOfFactor,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ]),
    );
  }
}
