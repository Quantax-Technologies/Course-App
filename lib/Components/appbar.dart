import 'package:courseapp/Theme/color.dart';
import 'package:courseapp/Theme/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar Appbarmain(context) {
  return AppBar(
    backgroundColor: basecolor,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(
            Icons.menu,
            color: basecolor1,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
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
