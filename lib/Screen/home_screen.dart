import 'package:courseapp/Components/appbar.dart';
import 'package:courseapp/Components/widgets.dart';
import 'package:courseapp/Screen/Auth/logout_screen.dart';
import 'package:courseapp/Screen/courses_screen.dart';
import 'package:courseapp/Theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: Appbarmain(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 26,
                              color: basecolor3),
                        ),
                        Text(
                          "View All Topic",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: basecolor3),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Wrap(children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Logout()));
                          },
                          child: cardlabel(
                            context,
                            "Psychology",
                          ),
                        ),
                        cardlabel(
                          context,
                          "Business",
                        ),
                        cardlabel(
                          context,
                          "Design",
                        ),
                        cardlabel(
                          context,
                          "IT & Technology",
                        ),
                        cardlabel(
                          context,
                          "History",
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                      child: Text(
                        "Latest Courses",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                            color: basecolor3),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Courses()));
                      },
                      child: cardcourse(
                        context,
                        "How Black Hole Paradox Can Be Solved",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Courses()));
                      },
                      child: cardcourse(
                        context,
                        "How Black Hole Paradox Can Be Solved",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Courses()));
                      },
                      child: cardcourse(
                        context,
                        "How Black Hole Paradox Can Be Solved",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Courses()));
                      },
                      child: cardcourse(
                        context,
                        "How Black Hole Paradox Can Be Solved",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Courses()));
                      },
                      child: cardcourse(
                        context,
                        "How Black Hole Paradox Can Be Solved",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
