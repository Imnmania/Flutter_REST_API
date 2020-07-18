import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetReq extends StatefulWidget {
  @override
  _GetReqState createState() => _GetReqState();
}

class _GetReqState extends State<GetReq> {
  loginCheck() async {
    // Map data = {
    //   'contact' : contact,
    //   'password' : password
    // };
    // String headers = 'Bearer ' + "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjgwMDJkNzE5OTI2Nzk5MzIwNTlhYzI1MWFiMTI1OGFmMzgyODRjNjg1MTE2NDk1MTNlYjBlZDU2ZWVjNWFjODdhNDJmNzE0OWFmMjZkZmQzIn0.eyJhdWQiOiIxIiwianRpIjoiODAwMmQ3MTk5MjY3OTkzMjA1OWFjMjUxYWIxMjU4YWYzODI4NGM2ODUxMTY0OTUxM2ViMGVkNTZlZWM1YWM4N2E0MmY3MTQ5YWYyNmRmZDMiLCJpYXQiOjE1OTQ5MzAxMDcsIm5iZiI6MTU5NDkzMDEwNywiZXhwIjoxNjI2NDY2MTA3LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.tRZm_beMVVLrD2D3Gbl5Gi5r6V14_6ZLc642A4wIK1JixfSfQkIAEB8TKcyWiVrcY1VNXiw6LaoW048yEOf5QbH786vN-AAICzviaBZIhuxaw7o4uPcn0TmJtke-pdDo5MyKvAdyRszn77L7gxvU2Z-Q5vAkD70z6Te6I_TFQihAWOSQkr9V5yl7C_II2RM3bYRSwK_cMeVSCbRVl7PX3j9P2B7Wmxq7JalYpFzzhsUyZdn7bF0xZ_57to7-oX4ZxJfVBMaTgO95a8huV_ETbmNLFMg4W3gIFCGjqCCfVeAYUu7V43bDyTzysmfWupujYUjA8xzYz1uxiU1lpyBedfzkFZGzGTl54hB4bOyEnZ1em4552C6IjNTBNctNV09cm9j-WSqZXsgfkZNV4VJ8u9KCIZsooc-PquXHdEAn-HgOduA6l49zKA464wxOD_15Ut0xuQhR8knmtJGX4hsNT7n_vDkrfp_w0qkqZv1QReMGUsbO8PMCQRY30NaXtax6ChVx9lQq6WE2lDQYrisRZJSqk5WA15Hqz99DWoPPlqzxtslN4oIdhJgsqy83uTZe-lkt4Fyk-ByZ9TlL9HPoOwpAUxs4JWZ8_qXDLhIlgxPHDsL2HrhLaUGBlbAlrxRjUonmLL9cX6loqYkBdco0LIImW6gzk3qB_mtdRH797jI";

    const headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImUxYTY1ZWE2ZDA5YzVlYzM1NjlkNWU3Y2RkZjIyMTdiNWZhZDdmZTdmZTE1YTAxMDNmZDJlYzc2ZTRlNDdmNzVhMmY4YWZlYjM2MDAxZjc5In0.eyJhdWQiOiIxIiwianRpIjoiZTFhNjVlYTZkMDljNWVjMzU2OWQ1ZTdjZGRmMjIxN2I1ZmFkN2ZlN2ZlMTVhMDEwM2ZkMmVjNzZlNGU0N2Y3NWEyZjhhZmViMzYwMDFmNzkiLCJpYXQiOjE1OTUwNjY1NDEsIm5iZiI6MTU5NTA2NjU0MSwiZXhwIjoxNjI2NjAyNTQxLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.fahvomSrJhBzY4kG02rizoWY7lB6qW7tsvZNIv4g-BrzSPlTN-cDSv5BTareMWedVMxrgrKWxv0Fxdxq4Kc0y4WxBzgqP-Xpj_e8utawDYIQwEzQLpRcycdQrxN6u0z-z2GwbTHlNUMQUL4buV_ksXR2pYTcUD7NS4NcaYxk2vuYB8AIphk21fDaotJ63CVbmuDAzHKbt6bEvuEA2OJ9MDkKMzIC308djGqJ3vifDoWYWLmkv7A5uffAw7VULcLciEWexuURCNnnv5dxHp0xhTc2Hrq-euFAMT1JZP1XPYusYahBxIlo3K2uzLH7Ft-FjsPPP5NXU-2vpOAlu8cQiCpfmwpYm4I_zXN9hvttuuM_H8F-fxounoA-QwHVOpjNcLEFoUc1yhnqcek1MZsWx_2Sukzynz5bDjIQSPI1qB-YM4RQZStu0Dm3X4skQI-XlULBp5trqwFk4Ywwdkb6qp5o2fhhj4dPrZEMRsKmmXmwC1Gdn9jU5NMLFz3vDA1VMiY1qkefFrXj8SHjt8isK9Hpfg3hLur464XaQSEsEPmDtNr8-UEsfkc7lPRP2NB5dS9TinS0YF0UiBfVNx_wg0YPmDCJIinhUvZsIYP46Rpmct2CeMTwj4cljBLe0he4nm88X5rtNbloDZazUjsZxKJgprpHgvBxNLQaTw3WFGg'
    };

    var jsonData;
    var response = await http.get('http://api.aros-express.com/api/auth/logout',
        headers: headers);
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
    loginCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout Test'),
      ),
      body: Container(
        child: Text('Test for logout'),
      ),
    );
  }
}
