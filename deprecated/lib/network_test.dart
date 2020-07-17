import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class NetworkTest extends StatefulWidget {
  @override
  _NetworkTestState createState() => _NetworkTestState();
}

class _NetworkTestState extends State<NetworkTest> {

  loginCheck(String contact) async {
    Map data = {
      'contact' : contact
    };

    var jsonData;
    var response = await http.post("http://api.aros-express.com/api/auth/userExistByPhone", body: data);
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
    loginCheck('+8801823282160');
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Test'),
      ),
      body: Center(
        child: Container(
          child: Text('Dum DUm'),
        ),
      ),

    );
  }
}