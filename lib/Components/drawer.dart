import 'package:courseapp/Screen/Auth/logout_screen.dart';
import 'package:courseapp/Screen/add_course.dart';
import 'package:courseapp/Screen/about_screen.dart';
import 'package:courseapp/Theme/color.dart';
import 'package:courseapp/Theme/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Drawer Drawermain(context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('Add Course'),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddCourse()));
          },
        ),
        ListTile(
          title: Text('Profile'),
          onTap: () {
            // Update the state of the app.
            // ...
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Logout()));
          },
        ),
      ],
    ),
  );
}

Drawer Drawermain2(context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('About'),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => About()));
          },
        ),
      ],
    ),
  );
}
