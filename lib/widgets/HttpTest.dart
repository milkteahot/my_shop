import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpTest extends StatefulWidget {
  @override
  _HttpTestState createState() => _HttpTestState();
}

class _HttpTestState extends State<HttpTest> {
  String _response = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Test'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('테스트'),
                onPressed: () async {
                  final res = await http.get('https://jsonplaceholder.typicode.com/posts/1');

                  this.setState(() {
                    _response = 'status: ${res.statusCode}\n\n${res.body}';
                  });

                },
              ),
            ),
            SizedBox(height: 20,),
            Text(_response),
          ],
        ),
      ),
    );
  }
}
