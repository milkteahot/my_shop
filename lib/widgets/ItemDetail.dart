import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      body: Column(
        children: <Widget> [
         Expanded( //exapanded가 아닌 위젯이 먼저 공간을 차지하므로, 위 공간을 exapdned로 감싼다.
           child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //image
                Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    child: _itemInfo.image,
                  ),
                ),
                SizedBox(height: 20.0),

                //title
                Text(
                  _itemInfo.title,
                  style: TextStyle(fontSize: 22.0),
                ),
                SizedBox(height: 10.0),

                //description
                Text(
                  _itemInfo.description,
                  style: TextStyle(fontSize: 15.0, color: Colors.black54),
                ),
                SizedBox(height: 10.0),

                //price
                Text(
                  _itemInfo.price,
                  style: TextStyle(fontSize: 18.0, color: Colors.orange),
                ),

                //detail contents
                Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _itemInfo.detailContents.map<Widget>((content) {
                      return Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(content, style: TextStyle(fontSize: 15.0),),
                      );
                    }).toList(),
                  ),
                ),



              ],
            ),
        ),
         ),

          //space and border top
          Container(
            height: 10.0,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey),
              )
            ),
          ),

          //cart
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 60.0,
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(9),
                    ),
                  ),
                ),
                SizedBox(width: 5.0),
                Text('개', style: TextStyle(fontSize: 16),),
                Expanded(
                  child: SizedBox(),
                ),
                Text(_itemInfo.price, style: TextStyle(fontSize: 18, color: Colors.orange),),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(30, 5, 30, 8),
            child: FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text('장바구니에 넣기', style: TextStyle(fontSize: 16),),
              onPressed: () {

              },
            ),
          )
        ]
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
