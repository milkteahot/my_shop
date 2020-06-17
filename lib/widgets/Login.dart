import 'package:flutter/material.dart';
import 'package:skying/widgets/HttpTest.dart';
import 'package:skying/widgets/MainWidget.dart';
import 'package:skying/widgets/Register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://i.pinimg.com/564x/da/e5/17/dae517b6c7100a02eaed47f351d32140.jpg"), fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
              'Day log',
              style: TextStyle(fontSize: 50.0, color: Colors.orangeAccent,  ),
              ),
              Container(width: 10.0),
//              Icon(Icons.color_lens, size: 50.0,),
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
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=>HttpTest()
                        )
                      );
                    },
                  ),
                  FlatButton(
                    child: Text('sign up'),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>Register()
                        )
                      );
                    },
                  )
                ],
              )
            ]
          )
        ),
        )
      ),
    );
  }
}
