import 'package:courseapp/Screen/Auth/login_screen.dart';
import 'package:courseapp/Screen/Auth/logout_screen.dart';
import 'package:courseapp/Screen/add_course.dart';
import 'package:courseapp/Screen/home_screen.dart';
import 'package:courseapp/Theme/color.dart';
import 'package:courseapp/Theme/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerClass extends StatefulWidget {
  const DrawerClass({Key? key}) : super(key: key);

  @override
  State<DrawerClass> createState() => _DrawerClassState();
}

var switchvalue = false;

class _DrawerClassState extends State<DrawerClass> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(''),
            decoration: BoxDecoration(
              gradient: backgradColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          ListTile(
            leading: Icon(Icons.bookmark),
            title: Text('Add Course'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AddCourse()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Logout()));
            },
          ),
          ListTile(
            leading: Switch(
              value: switchvalue,
              onChanged: (val) {
                setState(() {
                  switchvalue = val;
                });
              },
            ),
            title: Text('Switching between Learner and Expert'),
          )
        ],
      ),
    );
  }
}

Drawer Drawermain2(context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text(''),
          decoration: BoxDecoration(
            gradient: backgradColor,
          ),
        ),
        ListTile(
          title: Text('Login'),
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Login()));
          },
        ),
      ],
    ),
  );
}
