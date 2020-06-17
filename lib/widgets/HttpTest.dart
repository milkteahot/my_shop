import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //추가해야 json decode 가능

class HttpTest extends StatefulWidget {
  @override
  _HttpTestState createState() => _HttpTestState();
}

class _HttpTestState extends State<HttpTest> {
//  String _response = '';
  _Data _data = _Data(0, 0, '', '');

//  Future<_Data> _dataFuture;
//
//  Future<_Data> _fetchData() async {
//    final res = await http.get('https://jsonplaceholder.typicode.com/posts/1');
//
//    final json_body = json.decode(res.body);
//    return _Data.fromJson(json_body);
//  }
//
//  @override
//  void initState() {
//    super.initState();
//
//    _dataFuture = _fetchData();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Test'),
      ),
      body: Stack(
        children:<Widget> [
          SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('테스트'),
                  onPressed: () async {
                    final res = await http.get('https://jsonplaceholder.typicode.com/posts/1');

                    final json_body = json.decode(res.body);
                    this.setState(() {
//                    _response = 'status: ${res.statusCode}\n\n${res.body}';
                      _data = _Data.fromJson(json_body);
                    });

                  },
                ),
              ),
              SizedBox(height: 20,),

//              FutureBuilder<_Data> (
//              future: _dataFuture,
//                builder: (context, snapshot) {
//                  if(snapshot.hasData) {
//                    return _makeDataWidget(snapshot.data);
//                  } else if (snapshot.hasError) {
//                    return Text("${snapshot.error}");
//                  }
//                  return CircularProgressIndicator();
//                },
//              )
//            Text(_response),
            SizedBox(height: 20,),
            _makeDataWidget(_data),
            ],
          ),
        ),
          Column(
            children:<Widget> [
              Expanded(
              child: Container(
                decoration: BoxDecoration( //이 부분으로 로딩중 입력 방지
                  color: Colors.black38,
                ),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
              ),
            ),
            ],
          ),
      ],
      ),
    );
  }

  Widget _makeDataWidget (data) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(flex:1, child: Text('userId'),),
              SizedBox(width: 20,),
              Expanded(flex:4, child: Text(data.userId.toString())),
            ],
          ),
          SizedBox(height: 20,),

          Row(
            children: <Widget>[
              Expanded(flex: 1, child: Text('id')),
              SizedBox(width: 20),
              Expanded(flex: 4, child: Text(data.id.toString())),
            ],
          ),
          SizedBox(height: 20),

          Row(
            children: <Widget>[
              Expanded(flex: 1, child: Text('id')),
              SizedBox(width: 20),
              Expanded(flex: 4, child: Text(data.title)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Expanded(flex: 1, child: Text('body')),
              SizedBox(width: 20),
              Expanded(flex: 4, child: Text(data.body.toString())),
            ],
          ),

        ],
      ),
    );
  }
}



class _Data {
  int userId;
  int id;
  String title;
  String body;

  _Data(this.userId, this.id, this.title, this.body); //생성자

  factory _Data.fromJson (Map<String, dynamic> json) { // 팩토리. 나중에 _Data.fromJson()으로 호출
    return _Data(
      json['userId'],
      json['id'],
      json['title'],
      json['body'],
    );
  }
}