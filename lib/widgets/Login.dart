import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Text(
      '로그인 뷰입니다.',
      style: TextStyle(fontSize: 15.0),
    );
  }
}
