import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LogoutCheck extends StatefulWidget {
  @override
  _LogoutCheckState createState() => _LogoutCheckState();
}

class _LogoutCheckState extends State<LogoutCheck> {
  loginCheck() async {
    // Map data = {
    //   'contact' : contact,
    //   'password' : password
    // };
    // String headers = 'Bearer ' + "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjgwMDJkNzE5OTI2Nzk5MzIwNTlhYzI1MWFiMTI1OGFmMzgyODRjNjg1MTE2NDk1MTNlYjBlZDU2ZWVjNWFjODdhNDJmNzE0OWFmMjZkZmQzIn0.eyJhdWQiOiIxIiwianRpIjoiODAwMmQ3MTk5MjY3OTkzMjA1OWFjMjUxYWIxMjU4YWYzODI4NGM2ODUxMTY0OTUxM2ViMGVkNTZlZWM1YWM4N2E0MmY3MTQ5YWYyNmRmZDMiLCJpYXQiOjE1OTQ5MzAxMDcsIm5iZiI6MTU5NDkzMDEwNywiZXhwIjoxNjI2NDY2MTA3LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.tRZm_beMVVLrD2D3Gbl5Gi5r6V14_6ZLc642A4wIK1JixfSfQkIAEB8TKcyWiVrcY1VNXiw6LaoW048yEOf5QbH786vN-AAICzviaBZIhuxaw7o4uPcn0TmJtke-pdDo5MyKvAdyRszn77L7gxvU2Z-Q5vAkD70z6Te6I_TFQihAWOSQkr9V5yl7C_II2RM3bYRSwK_cMeVSCbRVl7PX3j9P2B7Wmxq7JalYpFzzhsUyZdn7bF0xZ_57to7-oX4ZxJfVBMaTgO95a8huV_ETbmNLFMg4W3gIFCGjqCCfVeAYUu7V43bDyTzysmfWupujYUjA8xzYz1uxiU1lpyBedfzkFZGzGTl54hB4bOyEnZ1em4552C6IjNTBNctNV09cm9j-WSqZXsgfkZNV4VJ8u9KCIZsooc-PquXHdEAn-HgOduA6l49zKA464wxOD_15Ut0xuQhR8knmtJGX4hsNT7n_vDkrfp_w0qkqZv1QReMGUsbO8PMCQRY30NaXtax6ChVx9lQq6WE2lDQYrisRZJSqk5WA15Hqz99DWoPPlqzxtslN4oIdhJgsqy83uTZe-lkt4Fyk-ByZ9TlL9HPoOwpAUxs4JWZ8_qXDLhIlgxPHDsL2HrhLaUGBlbAlrxRjUonmLL9cX6loqYkBdco0LIImW6gzk3qB_mtdRH797jI";

    const headers = {
      'apikey':
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjRiN2E1MTNjYzY1MWE2ODc3ZGY0ZWE5N2YzMWJlMDU2ZjEzZWMxODcxMWMyYTAwYTVkODZhMDNiMTRmMmNkMTEyM2U1MjA1ZTE4MTFhYWNiIn0.eyJhdWQiOiIxIiwianRpIjoiNGI3YTUxM2NjNjUxYTY4NzdkZjRlYTk3ZjMxYmUwNTZmMTNlYzE4NzExYzJhMDBhNWQ4NmEwM2IxNGYyY2QxMTIzZTUyMDVlMTgxMWFhY2IiLCJpYXQiOjE1OTQ5MzA5MzMsIm5iZiI6MTU5NDkzMDkzMywiZXhwIjoxNjI2NDY2OTMzLCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.kGRZvpZS_Va5pWZqiWRqd4szKSoMcDy0-lwyLvWEFLuOiJVJyr9CsMx49Ojt9G1In1ioXvcpI0KSsZ--4xGrFtPMlWGRGN9sKRJMbWd5ibtcOLCZYoNX0zS3deXhaeNqx_qLcJVTilsPIzLXTQhBUQ935WK6Dyqwgdyrq3v-UaTMSCuFd39HZOJQ2eNPobwQDS8rjj8YuhWsWjb0MvRNeTvAA0tJfiX2b0DBQEluR0iTLRi62eMZN8vT9xjKDaBOrknzw1naO0HfQGZt-QVy5KpkO38yrsyz5Rald1P-s6V_krAWOty18d2VT_0Ivl0_8XeC4JLN1mG3f3XnQgcoe63t84nG9qTtBiGSWW3GvVBBhTZxBqOoBmWonbMKviuYqLnHVHfYSem6NnrvTXZnSjmDDPzw4c_LO-x7QEEl8DNMF_mnwz8-CrXwhXypaXW-dmFfuR6dW321CpWvTeyjftdaxzwQbYZSPbtZVIjz-XBNlQIktN_kqM0TRHOw7DI4IBMX2wOFPP69mGhQNJtN7mYrjLx4PkbCNKq5O48Kf91sWYqsKrQIgVeTF-nge-lTKOy3SvUxdMXY5ONkmGPtv8AcCxd6Qbxs7EOYfS87hVIe',
      'Content-Type': 'Bearer'
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
