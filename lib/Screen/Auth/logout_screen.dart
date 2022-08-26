import 'package:courseapp/Components/appbar.dart';
import 'package:courseapp/Theme/color.dart';
import 'package:courseapp/Theme/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarmain(),
      body: Column(
        children: [
          Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height * 0.25,
              height: 300,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height * 0.25,
              height: 150,
              decoration: BoxDecoration(
                gradient: backgradColor,
              ),
            ),
            Positioned(
                top: 30,
                right: 20,
                child: Icon(
                  Icons.settings,
                  color: basecolor,
                  size: 35,
                )),
            Positioned(
                bottom: 0,
                left: 20,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(profile),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Monica H.",
                          style: TextStyle(
                              color: basecolor1,
                              fontWeight: FontWeight.w900,
                              fontSize: 20)),
                    ),
                    Text("Learner Expert",
                        style: TextStyle(
                            color: basecolor3,
                            fontWeight: FontWeight.w900,
                            fontSize: 17)),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        children: [
                          Text("Logout",
                              style: TextStyle(
                                  color: basecolor1,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20)),
                          Icon(Icons.home_sharp),
                        ],
                      ),
                    )
                  ],
                ))
          ]),
        ],
      ),
    );
  }
}
