import 'package:flutter/material.dart';
import 'package:skying/widgets/ItemList.dart';
import 'package:skying/widgets/Profile.dart';
import 'package:skying/widgets/Cart.dart';
import 'package:skying/utils/Global.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() { //오버라이드
    super.initState();

    _tabController = TabController(length: 3, vsync: this); //vsync에 this를 넣어 초기
  }

  @override
  void dispose() { //오버라이드
    super.dispose();

    _tabController.dispose(); // TextEdittingController와 마찬가지로, 꼭 dispose 해줘야 함
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final appBar = AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: TabBar(
          controller: _tabController,
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
    );


    Global.statusBarHeight = mq.padding.top;
    Global.appBarHeight = appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,

      body: TabBarView(
        controller: _tabController,
      children: <Widget>[
        ItemList(
          onAddToCart: () {
            _tabController.animateTo(1);
          },
        ),
        Cart(),
        Profile(),
      ]
      ),
    );
  }
}
