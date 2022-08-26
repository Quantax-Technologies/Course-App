import 'package:courseapp/Theme/color.dart';
import 'package:courseapp/Theme/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar Appbarmain() {
  return AppBar(
    backgroundColor: basecolor,
    leading: InkWell(
      onTap: () {},
      child: Icon(
        Icons.menu,
        color: basecolor1,
      ),
    ),
    title: Center(
      child: Image(
        image: AssetImage(logoimage),
        width: 100,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Icon(
          Icons.search,
          color: basecolor1,
        ),
      )
    ],
  );
}
