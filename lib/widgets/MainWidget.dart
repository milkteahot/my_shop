import 'package:flutter/material.dart';
import 'package:skying/widgets/Profile.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.shopping_basket),
                  text: 'Item List',
                ),
                Tab(
                  icon: Icon(Icons.shopping_cart),
                  text: 'Cart',
                ),
                Tab(
                  icon: Icon(Icons.person),
                  text: 'Profile',
                ),
              ]
            ),
          ),
        ),

      body: TabBarView(
        children: <Widget>[
          Text(
          '아이템 리스트입니다',
          style: TextStyle(fontSize: 15.0),
          ),
          Text(
            '카트입니다',
            style: TextStyle(fontSize: 15.0),
          ),
          Profile(),
        ]
        ),
      ),
    );
  }
}
