import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
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

              FractionallySizedBox(
                widthFactor: 0.6,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 20.0),
                          child: Icon(Icons.phone, size: 15.0,),
                        ),
                        Expanded(
                          child: TextField(
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


    );
  }
}
