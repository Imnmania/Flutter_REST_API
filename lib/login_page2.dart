import 'package:LoginRegister/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage2 extends StatefulWidget {
  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {

  final numberTxtController = new TextEditingController();
  final passwordTxtController = new TextEditingController();

  var isLoading = false;
  // bool _isDone = false;

  SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 200),
                  child: Text(
                    'Login Page',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                //## USER INPUT FIELD
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: numberTxtController,
                    decoration: InputDecoration(
                      labelText: 'Phone no',
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                ),
                //## USER INPUT FIELD
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    obscureText: true,
                    controller: passwordTxtController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                //## SUBMIT BUTTON
                FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  color: Colors.black87,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    signIn(numberTxtController.text, passwordTxtController.text);
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  signIn(String contact, String password) async{

    Map data = {
      'contact' : contact,
      'password' : password
    };

    var jsonData;

    var sharedPreferences = await SharedPreferences.getInstance();

    var response = await http.post("http://api.aros-express.com/api/auth/login", body: data);
    if(response.statusCode == 200) {
      print('It worked');
      jsonData = json.decode(response.body);
      sharedPreferences.setString('access_token', jsonData['access_token']);
      print(sharedPreferences.getString('access_token'));
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
    } else {
      print('Something went wrong');
      print(response.body);
    }
  }


   checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString('access_token') == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
    }
  }


}
