import 'package:flutter/material.dart';

class ItemDetail extends StatefulWidget {
  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  _ItemInfo _itemInfo = null;
  
  @override
  Widget build(BuildContext context) {

    _initItemInfo();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(_itemInfo.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(30),
              width: double.infinity,
              child: _itemInfo.image,
            )
          ],
        ),
      ),
    );
  }
  
  void _initItemInfo() {
    if(_itemInfo != null)
      return;
    
    _itemInfo = _ItemInfo(
        Image.network('http://thumbnail.10x10.co.kr/webimage/image/basic600/137/B001377515.jpg'),
        '뼈다귀 모양 베개',
        '우리 귀여운 강아지에게 꿀잠을!!',
        '10,000원',
        <String>[
          '아이에게 꿀잠을 선사할 수 있는 베개입니다.',
          '뼈다귀 모양이므로 강아지에게 뼈다귀를 뜯는 꿈을 꿀 수 있도록 합니다.',
          '가나다라 마바사 아자차카 타파하',
          '',
          '테스트 라인 입니다',
          '테스트 라인 입니다',
          '테스트 라인 입니다',
          '테스트 라인 입니다',
          '테스트 라인 입니다',
        ]
    );
  }
}

class _ItemInfo {
  Image image;
  String title;
  String description;
  String price;
  List<String> detailContents;

  _ItemInfo(this.image, this.title, this.description, this.price, this.detailContents);
}
