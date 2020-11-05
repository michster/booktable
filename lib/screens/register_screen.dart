import 'package:flutter/material.dart';
import 'package:booktable/services/auth.dart';
import 'package:booktable/utils/screen_helper.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static String id = "/register";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //todo: Benutzername
              TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: "E-Mail"),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              //todo: Passwort
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: InputDecoration(hintText: "Passwort"),
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              MaterialButton(
                child: Text("Registrieren"),
                onPressed: () {
                  AuthService().registerWithEMail(email, password).then((_) {

                  }).catchError((e) {
                    ScreenHelper().showToast(context, e);
                  });
                  //print("$user $password");
                },
              ),
              SizedBox(
                height: 80,
              ),
              GestureDetector(
                  child: Text(
                    "Bereits ein Konto vorhanden?",
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, LoginScreen.id);
                  })
            ],
          ),
        ),
      ),
    );
  }
}


