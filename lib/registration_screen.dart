import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:studifyy/home_Screen.dart';
import 'package:studifyy/ui_helper.dart';

import 'login_screen.dart';
class Registration extends StatefulWidget {
  const Registration({super.key});
  @override
  State<StatefulWidget> createState() => RegistrationScreenState();
}
class RegistrationScreenState extends State<Registration>{
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  signUp(String email, String password) async {
    if (email == "" && password == "") {
      Fluttertoast.showToast(
          msg: "Please Enter required Credential!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16);
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        });
      } on FirebaseAuthException catch (exp) {
       Fluttertoast.showToast(
            msg: "$exp",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          child: Column(
            children: [
              UiHelper.customTextFeild(email, "Enter Email",false),
              UiHelper.customTextFeild(
                  password, "Enter Password", false),
              const SizedBox(
                height: 30,
              ),
              UiHelper.customButton(() {
                signUp(email.text.toString(), password.text.toString());
              }, "SignUp"),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an Account??",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "SignUp",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
