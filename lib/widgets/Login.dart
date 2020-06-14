import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
            'My Shop',
            style: TextStyle(fontSize: 50.0),
            ),
            Container(width: 10.0),
            Icon(Icons.color_lens, size: 50.0,),
            ]
            ),
            Container(width: 30.0),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Please enter an email',
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Please enter a password'
                ),
              ),
            ),
            Container(width: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('sign in'),
                  onPressed: () async {
                    await Navigator.pushNamed(context, '/main');
                  },
                ),
                FlatButton(
                  child: Text('sign up'),
                  onPressed: (){
                  },
                )
              ],
            )
          ]
        )
      ),
      )
    );
  }
}
