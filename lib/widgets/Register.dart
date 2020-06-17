import 'package:flutter/material.dart';
import 'package:skying/widgets/LoadingWrapper.dart';
import 'package:skying/utils/Global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _emailCtr = TextEditingController();
  final _passwordCtr = TextEditingController();
  final _nameCtr = TextEditingController();
  final _addressCtr = TextEditingController();

  var _isSubmitable = true;

  @override
  void dispose() {
    super.dispose();
    _emailCtr.dispose();
    _passwordCtr.dispose();
    _nameCtr.dispose();
    _addressCtr.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final info_list = [
      {
        'name' : '이메일',
        'controller' : _emailCtr,
        'validator' : (v) => (v.isEmpty)?'내용을 입력해주세요.'
            :(v.indexOf('@')<0)?'이메일 형식이 아닙니다.': null,
      },
      {
        'name': '비밀번호',
        'controller': _passwordCtr,
        'validator': (v)=> (v.isEmpty)? '내용을 입력해 주세요.': null,

      },
      {
        'name': '이름',
        'controller': _nameCtr,
        'validator': (v)=> (v.isEmpty)? '내용을 입력해 주세요.': null,
      },
      {
        'name': '주소',
        'controller': _addressCtr,
        'validator': (v)=> (v.isEmpty)? '내용을 입력해 주세요.': null,
      }
    ];

    final inputs = <Widget>[];
    for(final info in info_list) {
      inputs.add(
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 60, //이름칸을 사이즈박스로 똑같은 크기를 줘서 정렬
                child: Text(info['name']),
              ),
              SizedBox(width: 20,),
              Expanded(
                child: TextFormField(
                  controller: info['controller'],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(9),
                  ),
                  validator: info['validator'],
                ),
              )
            ],
          ),
        )
      );
    }
    return Scaffold(
      key: _scaffoldKey, //TODO: 왜 스캐폴드키를 등록하는지
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: LoadingWrapper( //LoadingWrapper 로 감싸기
        isLoading: !_isSubmitable, //활용
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: inputs,
                    ),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text((_isSubmitable)? '회원가입 완료':'요청 중...'),
                      onPressed: (_isSubmitable == false)?null:
                      () async {
                        try {
                          if(_formKey.currentState.validate() == false)
                            return;

//                          _scaffoldKey.currentState
//                            .showSnackBar(SnackBar(content: Text('서버로 전송중입니다'),));

                          this.setState(() {
                            _isSubmitable = false;
                          });

//                          await Future.delayed(Duration(seconds: 5));
                          final res = await http.post(
                            Global.server_address + '/api/customers',
                            body: {
                              'values' : json.encode({
                                'email' : _emailCtr.text,
                                'name' : _nameCtr.text,
                                'address' : _addressCtr.text,
                                'password' : _passwordCtr.text,
                              }),
                            }
                          );
                          if(res.statusCode ~/100 == 2) { //성공 200시 회원가입뷰 닫기
                            Navigator.pop(context, null);
                            return;
                          }

                        _scaffoldKey.currentState
                          .showSnackBar(SnackBar(content: Text('요청이 실패했습니다'),));
                          this.setState(() {
                            _isSubmitable = true;
                          });
                        } catch(e) {
                          _scaffoldKey.currentState
                              .showSnackBar(SnackBar(content: Text('요청이 실패했습니다'),));
                          this.setState(() {
                            _isSubmitable = true;
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20,)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
