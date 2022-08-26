import 'package:courseapp/Components/appbar.dart';
import 'package:courseapp/Screen/Auth/Signup_screen.dart';
import 'package:courseapp/Screen/Auth/login_screen.dart';
import 'package:courseapp/Theme/color.dart';
import 'package:courseapp/Theme/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginSignupHome extends StatelessWidget {
  const LoginSignupHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarmain(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(booktreepic),
                  scale: 10,
                  alignment: Alignment.bottomRight,
                  fit: BoxFit.contain),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 180,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: primary),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text("Login"))),
                Container(
                  width: 180,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.transparent,
                        side: BorderSide(width: 5, color: primary),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(color: primary),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
