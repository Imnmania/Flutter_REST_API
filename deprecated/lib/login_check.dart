import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginCheck extends StatefulWidget {
  @override
  _LoginCheckState createState() => _LoginCheckState();
}

class _LoginCheckState extends State<LoginCheck> {
  
  loginCheck(String contact, String password) async {
    Map data = {
      'contact' : contact,
      'password' : password
    };

    var jsonData;
    var response = await http.post("http://api.aros-express.com/api/auth/login", body: data);
    if(response.statusCode == 200) {
      print('It worked');
      jsonData = json.decode(response.body);
      print(jsonData);
    } else {
      print('Something went wrong');
    }
  }

  @override
  void initState() {
    super.initState();
    loginCheck('+8801823282160', '123');
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Check'),
      ),
      body: SafeArea(
        child: Text('Dummmmmy'),
      ),
    );
  }
}
