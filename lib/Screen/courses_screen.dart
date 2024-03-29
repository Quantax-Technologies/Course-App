import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courseapp/Components/appbar.dart';
import 'package:courseapp/Components/drawer.dart';
import 'package:courseapp/Components/widgets.dart';
import 'package:courseapp/Theme/color.dart';
import 'package:courseapp/Theme/resources.dart';
import 'package:courseapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Courses extends StatefulWidget {
  final coursedescription;
  final image;
  final title;
  final courseunique;
  const Courses(
      {Key? key,
      @required this.image,
      @required this.title,
      @required this.coursedescription,
      @required this.courseunique})
      : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> with SingleTickerProviderStateMixin {
  @override
  TabController? _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: DrawerClass()),
      appBar: Appbarmain(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: basecolor,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.arrow_back),
                    ),
                  )
                ],
              ),
            ),
            Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height * 0.25,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.image),
                      scale: 10,
                      alignment: Alignment.bottomRight,
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding:
                      EdgeInsets.only(top: 4, bottom: 4, right: 6, left: 6),
                  color: basecolor,
                  child: Text(
                    "Bill Jones",
                    style: TextStyle(
                        color: basecolor1,
                        fontWeight: FontWeight.w900,
                        fontSize: 16),
                  ),
                ),
              )
            ]),
            Container(
              color: basecolor,
              width: MediaQuery.of(context).size.width,
              padding:
                  EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 30),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .8,
                    child: Text(
                      "${widget.title}",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: basecolor1),
                    ),
                  ),
                  Container(width: 20, child: Icon(Icons.more_vert)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text("12 Pieces"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text("12 Pieces"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0.0),
                        child: Text("Advanced"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "${widget.coursedescription}",
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: primary,
              tabs: [
                Tab(
                  text: 'Bundle',
                ),
                Tab(
                  text: 'Details',
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            SizedBox(
              height: 600,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    height: 300,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Coursedetail')
                            .where('unique',
                                isEqualTo: '${widget.courseunique}')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text("Error");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: Text(""));
                          }
                          return ListView(
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              return ExpansionTile(
                                  title: Text("${data['title']}"),
                                  children: [
                                    Text("${data['description']}"),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 20, right: 20, left: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Duration: ${data['duration']}"),
                                          Text("Url: ${data['url']}"),
                                        ],
                                      ),
                                    ),
                                  ]);
                            }).toList(),
                          );
                        }),
                  ),
                  Container(
                      child: Column(
                    children: [
                      ExpansionTile(title: Text("Question 1"), children: [
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                      ]),
                      ExpansionTile(title: Text("Question 2"), children: [
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                      ]),
                      ExpansionTile(title: Text("Question 3"), children: [
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                      ]),
                      ExpansionTile(title: Text("Question 4"), children: [
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                      ]),
                      ExpansionTile(title: Text("Question 5"), children: [
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                        Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum "),
                      ]),
                    ],
                  )),
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
