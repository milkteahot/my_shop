import 'package:flutter/material.dart';
import 'package:skying/widgets/ItemDetail.dart';

class ItemList extends StatefulWidget {
  Function onAddToCart;

  ItemList({Key key, @required this.onAddToCart}): super(key:key);
  //@required 가 매개변수 앞에 붙으면, 해당 매개변수를 꼭 넣어줘야 한다.

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {

  List<_ItemInfo> _item_infos = null;

  @override
  Widget build(BuildContext context) {

    _initItemInfos();

    final widgets = <Widget>[];
    for(final ii in _item_infos) {
      widgets.add(
        FlatButton(
          onPressed: () async {
            final result = await Navigator.push<ItemDetailResult>(
              context,
              MaterialPageRoute(builder: (context) => ItemDetail()),
            );
            if(result == ItemDetailResult.ADD_TO_CART) //"장바구니에 넣기"로 종료된 경우
              widget.onAddToCart(); //위젯에 등록된 리스너를 호출

//            await Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context)=>ItemDetail())
//              );
            },
            child: Row(
              children: <Widget>[
                Container(
                  height: 150.0,
                  margin: EdgeInsets.only(right: 20.0),
                  child: ii.image,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        ii.title,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                        ii.description,
                        style: TextStyle(fontSize: 15.0, color: Colors.black54),
                      ),
                      Text(
                        ii.price,
                        style: TextStyle(fontSize: 15.0, color: Colors.orange),
                      )
                    ],
                  ),
                )
              ],
            )
        )

      );
    }

    return Scaffold(
      body: ListView(
        children: widgets,
      ),
    );
  }


  void _initItemInfos() {
  if(_item_infos != null)
    return;

  _item_infos = <_ItemInfo>[
    _ItemInfo(
        Image.network('http://thumbnail.10x10.co.kr/webimage/image/basic600/137/B001377515.jpg'),
        '뼈다귀 모양 베개', '우리 귀여운 강아지에게 꿀잠을!!', '10,000원'),
    _ItemInfo(
        Image.network('https://mi6.rightinthebox.com/images/384x384/201704/pqf1493005948537.jpg'),
        '빨간 스웨터', '추운 겨울에도 식지 않는 정열의 레드', '8,000원'),
    _ItemInfo(
        Image.network('http://mblogthumb4.phinf.naver.net/20120901_223/dogtalk__1346433364891VL4Am_JPEG/0003-MMF0017_s.jpg?type=w2'),
        '말랑말랑 입마개', '부드럽고 엣지 있는 입마개', '6,000원'),
    _ItemInfo(
        Image.network('http://yogipet.co.kr/web/product/big/201706/yogi_main_500.jpg'),
        '소형견용 애견 화장실', '배변 교육이 쉬운 마법의 화장실', '20,000원'),
    _ItemInfo(
        Image.network('https://seoul-p-studio.bunjang.net/product/81561624_3_1520763876_w640.jpg'),
        '강아지 용 백팩', '이제 네 짐은 네가 지도록 하여라~', '18,000원'),
    _ItemInfo(
        Image.network('https://mi7.rightinthebox.com/images/384x384/201307/khabye1372647520194.jpg'),
        '귀여운 강아지 신발', '소중한 아기의 발바닥을 보호합시다', '12,000원'),
    ];
  }
}

class _ItemInfo {
  Image image;
  String title;
  String description;
  String price;

  _ItemInfo(this.image, this.title, this.description, this.price);
}