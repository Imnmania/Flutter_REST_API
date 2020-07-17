import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupCheck extends StatefulWidget {
  @override
  _SignupCheckState createState() => _SignupCheckState();
}

class _SignupCheckState extends State<SignupCheck> {
  loginCheck(
    String contact,
    String password,
    String otptoken,
    String name,
    String businessname,
    String businesstype
  ) async {
    Map data = {
      "contact": contact,
      "password": password,
      "otp_token": otptoken,
      "name": name,
      "business_name": businessname,
      "business_type": businesstype
    };

    var jsonData;
    var response = await http.post("http://api.aros-express.com/api/auth/signup", body: data);
    if (response.statusCode == 200) {
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
    loginCheck('+8801823282160', '123', '123','','','');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up check'),
      ),
      body: SafeArea(
        child: Text('DOOOM'),
      ),
    );
  }
}
