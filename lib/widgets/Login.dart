import 'package:flutter/material.dart';
import 'package:skying/widgets/HttpTest.dart';
import 'package:skying/widgets/LoadingWrapper.dart';
import 'package:skying/widgets/MainWidget.dart';
import 'package:skying/widgets/Register.dart';
import 'package:skying/utils/Global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();

    _emailCtrl.dispose();
    _passwordCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://i.pinimg.com/564x/da/e5/17/dae517b6c7100a02eaed47f351d32140.jpg"), fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        body: LoadingWrapper(
          isLoading: _isLoading,
          child: SafeArea(
          child: Center(
            child: Form(
              key: _formKey,
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
                    child: TextFormField( //TODO: textfield, textformfield 차이
                      controller: _emailCtrl,
                      decoration: InputDecoration(
                        hintText: 'Please enter an email',
                      ),
                      validator: (v) => (v.isEmpty)? '내용을 입력해주세요.'
                      : null,
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.5,
                    child: TextFormField(
                      controller: _passwordCtrl,
                      decoration: InputDecoration(
                        hintText: 'Please enter a password'
                      ),
                      validator: (v) => (v.isEmpty) ? '내용을 입력해주세요.'
                      : null,
                      obscureText: true,
                    ),
                  ),
                  Container(width: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        child: Text('sign in'),
                        onPressed: () async {
                          try{
                            if(_formKey.currentState.validate() == false) {
                              return;
                            }
                            setState(() {
                              _isLoading = true;
                            });

                            final res = await http.post(
                              Global.server_address + '/api/login',
                              body: {
                                'type' : 'CUSTOMER',
                                'login_id' : _emailCtrl.text,
                                'password' : _passwordCtrl.text,
                              }
                            );
                            if(res.statusCode ~/100 == 2) {
                              setState(() {
                                _isLoading = false;
                              });
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainWidget()
                                )
                              );
                              return;
                            }

                            //실패시
                            _scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text('로그인 실패\n${json.decode(res.body) ['message']}'),
                              )
                            );
                            setState(() {
                              _isLoading = false;
                            });
                          } catch (e) {
                            _scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text('에러\n${e.toString()}'),
                              ),
                            );
                            setState(() {
                              _isLoading = false;
                            });
                          }

//                          await Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                builder: (context)=>HttpTest()
//                            )
//                          );
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
              ),
            )
          ),
          ),
        )
      ),
    );
  }
}
