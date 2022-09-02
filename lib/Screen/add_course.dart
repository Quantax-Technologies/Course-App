import 'dart:io';
import 'dart:math';

import 'package:courseapp/Components/appbar.dart';
import 'package:courseapp/Components/drawer.dart';
import 'package:courseapp/Helper/storage_helper.dart';
import 'package:courseapp/Screen/home_screen.dart';
import 'package:courseapp/Theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

class AddCourse extends StatefulWidget {
  const AddCourse({Key? key}) : super(key: key);

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  final _auth = FirebaseAuth.instance.currentUser!;
  addcoursedetailfunction(
      unique, titlecourse, courseurl, courseduration, descriptioncourse) async {
    if (titlecourse == '' ||
        courseurl == '' ||
        courseduration == '' ||
        descriptioncourse == '') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Fill The Field First')));
    } else {
      await FirebaseFirestore.instance.collection("Coursedetail").add({
        'unique': unique,
        'title': titlecourse,
        'url': courseurl,
        'duration': courseduration,
        'description': descriptioncourse,
      });
      print("Details entered");
      titlecontroller1.clear();
      urlcontroller1.clear();
      durationcontroller1.clear();
      descriptioncontroller1.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Course Detail Added'),
        ),
      );
    }
  }

  addcoursefunction(titlecourse, courselevel, descriptioncourse) async {
    if (titlecourse == '' || courselevel == '' || descriptioncourse == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Fill The fields'),
      ));
    } else if (results == '' || results == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Upload image'),
      ));
    } else {
      var folder = 'profile';
      Storage storageobj = Storage();
      var filename = results.files.single.name;
      var pathname = results.files.single.path;
      var ranfolder = Random().nextInt(10000);
      var ranfolder1 = Random().nextInt(10000);

      var url = storageobj
          .uploadFile(pathname, '$ranfolder', filename)
          .then((value) async {
        await FirebaseFirestore.instance.collection("Courses").add({
          'userid': "${_auth.uid}",
          'uniquerand': '${ranfolder + ranfolder1}',
          'useremail': "${_auth.email}",
          'coursetitle': "$titlecourse",
          'courselevel': courselevel,
          'coursedescription': descriptioncourse,
          'coursebanner': "$value",
          'datecreation':
              '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}'
        });
      });

      titlecontroller.clear();
      urlcontroller.clear();
      descriptioncontroller.clear();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Course Upload')));
      showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('AlertDialog Title'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "Title",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextField(
                      controller: titlecontroller1,
                      decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(color: basecolor1)),
                        contentPadding: EdgeInsets.only(
                            top: 0, bottom: 0, right: 5, left: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(color: basecolor2)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "Url",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextField(
                      controller: urlcontroller1,
                      decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(color: basecolor1)),
                        contentPadding: EdgeInsets.only(
                            top: 0, bottom: 0, right: 5, left: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(color: basecolor2)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "Duration",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextField(
                      controller: durationcontroller1,
                      decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(color: basecolor1)),
                        contentPadding: EdgeInsets.only(
                            top: 0, bottom: 0, right: 5, left: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(color: basecolor2)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "Description",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextField(
                      controller: descriptioncontroller1,
                      decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(color: basecolor1)),
                        contentPadding: EdgeInsets.only(
                            top: 0, bottom: 0, right: 5, left: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(color: basecolor2)),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Done'),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Course Completely Added'),
                    ));
                  },
                ),
                TextButton(
                  child: const Text('Add'),
                  onPressed: () {
                    addcoursedetailfunction(
                        '${ranfolder + ranfolder1}',
                        titlecontroller1.text,
                        urlcontroller1.text,
                        durationcontroller1.text,
                        descriptioncontroller1.text);
                  },
                ),
              ],
            );
          });
      // Navigator.of(context)
      //     .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController urlcontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController titlecontroller1 = TextEditingController();
  TextEditingController urlcontroller1 = TextEditingController();
  TextEditingController descriptioncontroller1 = TextEditingController();

  TextEditingController durationcontroller1 = TextEditingController();

  var results;

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: DrawerClass()),
      appBar: Appbarmain(context),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add Course",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    "Title",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                TextField(
                  controller: titlecontroller,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(color: basecolor1)),
                    contentPadding:
                        EdgeInsets.only(top: 0, bottom: 0, right: 5, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(color: basecolor2)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    "Url",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                TextField(
                  controller: urlcontroller,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(color: basecolor1)),
                    contentPadding:
                        EdgeInsets.only(top: 0, bottom: 0, right: 5, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(color: basecolor2)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                TextField(
                  controller: descriptioncontroller,

                  minLines: 3,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  // controller: loginemail,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(color: basecolor1)),
                    contentPadding:
                        EdgeInsets.only(top: 0, bottom: 0, right: 5, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(color: basecolor2)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Stack(alignment: Alignment.center, children: [
                  if (results == null)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(color: primary),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(bottom: 58.0),
                        child: Text(
                          "Add Cover",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                    ),
                  if (results != null)
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(
                              File(results.files.single.path),
                            ),
                            fit: BoxFit.cover,
                          ),
                        )),
                  InkWell(
                    onTap: () async {
                      results = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowMultiple: false,
                          allowedExtensions: ['pdf', 'jpg', 'png', 'jpeg']);
                      setState(() {
                        results = results;
                      });
                      if (results == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("content"),
                          ),
                        );
                      }
                      var pathname = results.files.single.path;
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.add,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ]),
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0XffFD9797),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                          addcoursefunction(titlecontroller.text,
                              urlcontroller.text, descriptioncontroller.text);
                        },
                        child: Text("Add"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
