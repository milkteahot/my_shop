import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skying/widgets/ItemDetail.dart';
import 'package:skying/utils/StringUtil.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  List<_ItemInfo> _itemInfos;
  final _itemidControllerMap = Map<int, TextEditingController>();

  @override
  void dispose() {
    super.dispose();

    for (final controller in _itemidControllerMap.values)
      controller.dispose();
    _itemidControllerMap.clear();
  }

  @override
  Widget build(BuildContext context) {

    _initItemInfos();

    final widgets = <Widget>[];
    for(final ii in _itemInfos){
      widgets.add(
          Row(
            children: <Widget>[
              Checkbox(
                value: ii.isChecked,
                onChanged: (v)=> setState(()=> ii.isChecked = v),
              ),
              Expanded(
                flex: 3,
                child: FlatButton(
                  child: Container(
                    height: 150.0,
                    margin: EdgeInsets.only(right: 20.0),
                    child: ii.image,
                  ),
                  onPressed: () async{
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> ItemDetail()),
                    );
                  },
                ),
              ),
              Flexible(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      ii.title,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      '${StringUtil.makeCommaedString(ii.price)}원',
                      style: TextStyle(fontSize: 15.0, color: Colors.orange),
                    ),
                    Row(
                      children: <Widget>[
                        Text('개수'),
                        Expanded(child: SizedBox()),
                        Container(
                            width: 25,
                            height: 25,
                            margin: EdgeInsets.only(left:10, right:10),
                            child: FlatButton(
                                padding: EdgeInsets.all(0),
                                child: Icon(Icons.add, size: 20),

                                onPressed: () {
                                  final ctr = _itemidControllerMap[ii.id];
                                  final count = (ctr.text == '') ? 0: int.parse(ctr.text);
                                  ctr.text = '${min(999, count+1)}';
                                },
                            )),
                        SizedBox(
                          height: 25.0,
                          width: 40.0,
                          child: TextField(
                            controller: _itemidControllerMap[ii.id],  // Controller를 등록함
                            keyboardType: TextInputType.numberWithOptions(),
                            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3)
                            ],
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(1),
                            ),
                          ),
                        ),
                        Container(
                            width: 25,
                            height: 25,
                            margin: EdgeInsets.only(left:10, right:10),
                            child: FlatButton(
                                padding: EdgeInsets.all(0),
                                child: Icon(Icons.remove, size: 20),

                                onPressed: () {
                                  final ctr = _itemidControllerMap[ii.id];
                                  final count = (ctr.text == '')? 0: int.parse(ctr.text);
                                  ctr.text = '${max(0, count - 1)}';
                                },
                            )),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('금액'),
                        Text(
                          '${StringUtil.makeCommaedString(ii.price*ii.count)}원',
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        ),
                        SizedBox(width: 15),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
      );
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
          child:ListView(
                children: widgets,
              ),
          ),

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
                Text('총 가격: ', style: TextStyle(fontSize: 18),),
                SizedBox(width: 18),

                Text(
                  '${StringUtil.makeCommaedString(_itemInfos.where((ii) => ii.isChecked).map(
                      (ii)=>ii.price*ii.count
                  ).fold(0, (a, b) => a+b))} 원',
                style: TextStyle(fontSize: 18, color: Colors.orange),),
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
              child: Text('구매하기', style: TextStyle(fontSize: 16),),
              onPressed: () {

              },
            ),
          )
        ]
      ),
    );

  }
    // Item 데이터 초기화
    void _initItemInfos () {
      if (_itemInfos != null)
        return;

      _itemInfos = <_ItemInfo>[
        _ItemInfo(0, Image.network('http://thumbnail.10x10.co.kr/webimage/image/basic600/137/B001377515.jpg'    ), '뼈다귀 모양 베개'  , 10000, 1),
        _ItemInfo(1, Image.network('https://mi6.rightinthebox.com/images/384x384/201704/pqf1493005948537.jpg'   ), '빨간 스웨터'       ,  8000, 2),
        _ItemInfo(2, Image.network('https://seoul-p-studio.bunjang.net/product/81561624_3_1520763876_w640.jpg'  ), '강아지 용 백팩'    , 18000, 3),
        _ItemInfo(3, Image.network('https://mi7.rightinthebox.com/images/384x384/201307/khabye1372647520194.jpg'), '귀여운 강아지 신발', 12000, 1),
      ];

      for (final ii in _itemInfos) { //각 아이템 데이터 당 하나씩 Controller를 만든다
        final controller = TextEditingController(text: '${ii.count}'); //기본값
        _itemidControllerMap[ii.id] = controller; //맵에 등

        controller.addListener(() { // Controller new를 이곳에서 하기 때문에, 특별히 initState 말고 여기서 함
          setState(() {
            ii.count = (controller.text == '') ? 0: int.parse(controller.text);
          });
        });
      }
    }

}



class _ItemInfo {
  int id;
  Image image;
  String title;
  int price;
  int count;
  bool isChecked = true;

  _ItemInfo(this.id, this.image, this.title, this.price, this.count);
}

