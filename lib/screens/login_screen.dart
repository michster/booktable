import 'package:booktable/screens/register_screen.dart';
import 'package:booktable/screens/restaurants_screen.dart';
import 'package:booktable/services/auth.dart';
import 'package:booktable/utils/screen_helper.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anmelden"),
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
              MaterialButton(child: Text("Anmelden"), onPressed: () {
                  AuthService().loginWithEMail(email, password).then((_) {
                    Navigator.pushReplacementNamed(context, RestaurantsScreen.id);
                  }).catchError((error) {
                    ScreenHelper().showToast(context, error);
                  });
              }),
              SizedBox(
                height: 80,
              ),
              GestureDetector(
                  child: Text(
                    "Noch kein Konto vorhanden?",
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, RegisterScreen.id);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
