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

  addcoursefunction(
      titlecourse, urlcourse, durationcourse, descriptioncourse) async {
    if (titlecourse == '' ||
        urlcourse == '' ||
        durationcourse == '' ||
        descriptioncourse == '') {
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
      var ranfolder = Random().nextInt(1000);

      var url = storageobj
          .uploadFile(pathname, '$ranfolder', filename)
          .then((value) async {
        await FirebaseFirestore.instance.collection("Courses").add({
          'userid': "${_auth.uid}",
          'useremail': "${_auth.email}",
          'coursetitle': "$titlecourse",
          'courseurl': urlcourse,
          'courseduration': durationcourse,
          'coursedescription': descriptioncourse,
          'coursebanner': "$value",
          'datecreation':
              '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}'
        });
      });

      titlecontroller.clear();
      urlcontroller.clear();
      durationcontroller.clear();
      descriptioncontroller.clear();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Course Upload')));
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController urlcontroller = TextEditingController();
  TextEditingController durationcontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
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
                    "Duration",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                TextField(
                  controller: durationcontroller,

                  keyboardType: TextInputType.number,
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
                          addcoursefunction(
                              titlecontroller.text,
                              urlcontroller.text,
                              durationcontroller.text,
                              descriptioncontroller.text);
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
