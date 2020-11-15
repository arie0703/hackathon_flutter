import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Page2(),
      ),
    );

class Page2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatePage2();
  }
}

class _StatePage2 extends State<Page2> {
  final List<Map<String, dynamic>> items = [
    {"image": "images/news_1.jpg", "body": "温暖化により上陸後のハリケーンが勢力維持、関連示す初の研究"},
    {
      "image": "images/news_2.jpeg",
      "body": "人工知能主導のクルマ革命〜自動運転車の普及で自動車業界と社会はどうなる？"
    },
    {
      "image": "images/news_3.jpg",
      "body": "コロナ渦で3割を超える人が「料理をする頻度が増えた」、料理をする際に重視することは「栄養バランス・健康効果」"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffdedede),
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];

            return Dismissible(
              // KeyはFlutterが要素を一意に特定できるようにするための値を設定する。
              key: Key(item["image"]),

              // directionにはスワイプの方向が入るため、方向によって処理を分けることができる。
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });
                // スワイプ方向がendToStart（画面左から右）の場合の処理
                if (direction == DismissDirection.endToStart) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("気に入らない・・")));
                  // スワイプ方向がstartToEnd（画面右から左）の場合の処理
                } else {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("興味ある！")));
                }
              },
              // スワイプ方向がendToStart（画面左から右）の場合のバックグラウンドの設定
              background: Container(
                color: Colors.green,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Icon(Icons.done, color: Colors.white),
                ),
              ),

              // スワイプ方向がstartToEnd（画面右から左）の場合のバックグラウンドの設定
              secondaryBackground: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Icon(Icons.close, color: Colors.white),
                ),
              ),

              // ListViewの各要素の定義
              child: Column(
                children: <Widget>[
                  new Image.asset(
                    item['image'],
                    width: double.infinity,
                  ),
                  Container(
                    height: 170.0,
                    padding: EdgeInsets.all(20.0),
                    width: double.infinity,
                    color: Colors.white,
                    child: Text(
                      item['body'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
