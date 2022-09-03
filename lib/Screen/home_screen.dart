import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courseapp/Components/appbar.dart';
import 'package:courseapp/Components/drawer.dart';
import 'package:courseapp/Components/widgets.dart';
import 'package:courseapp/Screen/Auth/logout_screen.dart';
import 'package:courseapp/Screen/add_course.dart';
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
        drawer: Drawer(child: DrawerClass()),
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
              Container(
                height: 300,
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Courses')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Error");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: Text(""));
                      }
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Courses(
                                        image: '${data['coursebanner']}',
                                        title: '${data['coursetitle']}',
                                        coursedescription:
                                            '${data['coursedescription']}',
                                        courseunique: '${data['uniquerand']}',
                                      )));
                            },
                            child: cardcourse(context, "${data['coursetitle']}",
                                'Bill', '${data['coursebanner']}'),
                          );
                        }).toList(),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
