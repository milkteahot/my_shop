import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center( //가운데 정렬
      child: SingleChildScrollView(
        child: Column(//컬럼을 리턴한다 -> 스크롤 가능하게 하기 위해 Singlechildscrollview 추가
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: Image(
                      image: NetworkImage(
                        "https://lh3.googleusercontent.com/proxy/A7kL4In7ZausPxYjeuriMyTLC5i9nYod2tXEhtT4I_dXHrmEuBm4oIGMkVBCF5idDJUigOL_eqK74ZfPn-jXYrIdrj2Eg1CuoNjbRlLy3lS9uMqWJsgIkXOmIgvJsHNpyX04Dwz7HHl4ySxhvMSu8hamQD-uGQa2"
                      ),
                    ),
                  ),
                ),
                  Container(height: 10.0,),
                  Text('쇼핑할고양', style: TextStyle(fontSize: 20.0),),
                  Text('VIP Cutsonmer', style: TextStyle(fontSize: 15.0, color: Colors.blue),),
                  Container(height: 50.0,),

                  FractionallySizedBox(//가장 바깥에 크기를 지정해주는 사이즈박스
                    widthFactor: 0.6,
                    child: Column(//컬럼 안에 로우
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(//아이콘이 바로 오지 않고 컨테이너로 감싼다
                              margin: EdgeInsets.only(right: 20.0),
                              child: Icon(Icons.phone, size: 15.0,),
                            ),
                            Expanded(//이 부분에서 exapanded 위젯을 추가해줘야 에러안남
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '010-0000-0000'
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 20.0),
                              child: Icon(Icons.mail, size: 15.0,),
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'email@gmail.com'
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 20.0),
                              child: Icon(Icons.flag, size: 15.0,),
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Please enter an address'
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

              ],


        ),
      ),
    );
  }
}
