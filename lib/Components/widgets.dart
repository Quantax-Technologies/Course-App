import 'package:courseapp/Theme/color.dart';
import 'package:courseapp/Theme/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget cardbutton(context, imagename, headingtext, headingtextcolor) {
  return Container(
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.only(top: 30, bottom: 10),
    width: MediaQuery.of(context).size.width * 0.37,
    decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
    child: Column(
      children: [
        Text(
          headingtext,
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: headingtextcolor),
        ),
        SizedBox(
          height: 10,
        ),
        Image.asset(imagename)
      ],
    ),
  );
}
