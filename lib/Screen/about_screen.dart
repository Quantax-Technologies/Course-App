import 'package:courseapp/Components/appbar.dart';
import 'package:courseapp/Components/drawer.dart';
import 'package:courseapp/Components/widgets.dart';
import 'package:courseapp/Screen/home_screen.dart';
import 'package:courseapp/Theme/color.dart';
import 'package:courseapp/Theme/resources.dart';
import 'package:courseapp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  var checkedValue = false;
  TextEditingController loginemail = TextEditingController();
  TextEditingController loginpassword = TextEditingController();
  loginfunction(emailAddress, password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('No user found for that email.'),
        ));
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Wrong password provided for that user.'),
        ));
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawermain2(context),
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
                  "Welcome",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    "Username/Email",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                TextField(
                  controller: loginemail,
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
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Text(
                    "Password",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                TextField(
                  controller: loginpassword,
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
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(children: [
                        SizedBox(
                          height: 24.0,
                          width: 24.0,
                          child: Checkbox(
                            value: checkedValue,
                            onChanged: (value) {
                              setState(() {
                                checkedValue = value!;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text("Save Setting"),
                        )
                      ]),
                      //C
                      Text(
                        "Forget Password?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Text("Continue with"),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Image(
                                    image: AssetImage(google),
                                    fit: BoxFit.fill,
                                    height: 40,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Image(
                                      height: 60,
                                      image: AssetImage(fb),
                                      fit: BoxFit.fill),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Image.asset(
                                      width: 40, linkedin, fit: BoxFit.fill),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                          width: 120,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: primary),
                              onPressed: () {
                                loginfunction(
                                    loginemail.text, loginpassword.text);
                              },
                              child: Text("Login"))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13.0),
                  child: Text(
                    "First Time Here?",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: Center(
                    child: Text(
                      "Join Us",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cardbutton(context, learner, "Learner", Color(0XffB298C8)),
                    cardbutton(context, expert, "Expert", Color(0Xff2A319E)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: Center(
                    child: Text(
                      "OR",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
                ),
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
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Text("Login"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
