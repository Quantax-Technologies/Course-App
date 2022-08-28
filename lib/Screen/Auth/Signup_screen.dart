import 'package:courseapp/Components/appbar.dart';
import 'package:courseapp/Components/widgets.dart';
import 'package:courseapp/Screen/Auth/login_screen.dart';
import 'package:courseapp/Screen/home_screen.dart';
import 'package:courseapp/Theme/color.dart';
import 'package:courseapp/Theme/resources.dart';
import 'package:courseapp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var checkedValue = false;
  TextEditingController signupemail = TextEditingController();
  TextEditingController signuppassword = TextEditingController();
  signupfunction(emailAddress, password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      signupemail.clear();
      signuppassword.clear();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Login()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('The password provided is too weak.'),
        ));
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('The account already exists for that email.'),
        ));
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarmain(),
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
                  controller: signupemail,
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
                  controller: signuppassword,
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
                                signupfunction(
                                    signupemail.text, signuppassword.text);
                              },
                              child: Text("Signup"))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
