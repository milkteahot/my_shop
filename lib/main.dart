import 'package:flutter/material.dart';
import 'package:skying/widgets/Login.dart';
import 'package:skying/widgets/MainWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/main': (context) => MainWidget(),
      },
    );
  }
}
