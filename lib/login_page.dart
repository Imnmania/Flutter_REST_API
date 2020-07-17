import 'package:LoginRegister/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import './login_page2.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () async {
            var sharedPreferences = await SharedPreferences.getInstance();
            sharedPreferences.clear();
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MyHomePage()), (Route<dynamic> route) => false);
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
