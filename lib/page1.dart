import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DialogueScreen();
  }
}

class DialogueScreen extends StatefulWidget {
  // DialogueScreenに渡したtitleがthis.titleにそのまま渡される
  DialogueScreen({Key key, this.title}) : super(key: key);
  final String title;

  // StatefulWidgetクラスにはcreateStateメソッドを実装する必要がある
  // createStateはステートを作成するためのメソッド
  // これで_DialogueScreenクラスがステートクラスとして扱われるようになる
  @override
  _DialogueScreen createState() => new _DialogueScreen();
}

// ステートクラスはStateクラスを継承して作成
// このときウィジェットクラスを<>で指定しておく
// これで指定したウィジェットクラスで使われるステートクラスが定義できる
// ステートクラスはbuildメソッドを持ち、これはステートを生成する際に呼び出され、ここでステートとして表示するウィジェットが生成して返す
// 言い換えると、ステートが更新されるたび、buildで新たな表示内容を生成して画面に表示する
class _DialogueScreen extends State<DialogueScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  // Controllerはウィジェットの値を管理するクラス
  // TextFieldのような入力を行うウィジェットは自身の中に値を保管するプロパティを持っている訳でなく、
  // 値を管理するControllerクラスを組み込み、これによって値を管理する
  // _textController.textで値を取り出す
  Widget _buildTextComposer() {
    return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        // コンテナ型(自身の中にウィジェットを組み込める)Containerウィジェット
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            // Rowウィジェットは複数のウィジェットを縦に配置するコンテナ型ウィジェット
            child: Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: _textController,
                    onSubmitted: _handleSubmitted,
                    decoration:
                        InputDecoration.collapsed(hintText: "Send a message"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconButton(
                      icon: Icon(Icons.send),
                      // onPressedはイベント処理を設定するためのプロパティ
                      // ボタンをタップすると実行される
                      // ここにステート変更するメソッドを指定する
                      onPressed: () => _handleSubmitted(_textController.text)),
                )
              ],
            )));
  }

  void Response(text) async {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: 'こんなニュースもあるよ！興味あったら見てね！「温暖化により上陸後のハリケーンが勢力維持、関連示す初の研究」',
      name: "Bot",
      type: false,
    );
    // setStateメソッドはステートの更新を、ステートクラスに知らせる働きをする
    // このメソッドに、必要な値を変更する処理を実装する
    // ここでは_messagesプロパティの値を変更し、messageを追加する
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      name: "You",
      type: true,
    );

    setState(() {
      _messages.insert(0, message);
    });
    Response(text);
  }

  // buildで生成されるウィジェットでは、ListViewのitemBuilder(表示部)とitemCount(要素数)に_messagesが使われている
  // _messagesプロパティの値が更新されるとbuildメソッドが再実行され、_messagesの値が変わる
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Columnは複数のウィジェットを縦に配置するコンテナ型ウィジェット
        body: Column(
      children: <Widget>[
        Flexible(
            child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (_, int index) => _messages[index],
          itemCount: _messages.length,
        )),
        Divider(
          height: 1.0,
        ),
        Container(
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
      ],
    ));
  }
}

// dialogue_screen.dart
class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      Container(
        margin: EdgeInsets.only(right: 16.0),
        child: CircleAvatar(child: Image.asset("img/bot.png")),
      ),
      Expanded(
          child: Column(
        // Columnに組み込んだウィジェットの配置場所を指定
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(this.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Text(text),
          ),
        ],
      ))
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(this.name, style: Theme.of(context).textTheme.subhead),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Text(text),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 16.0),
        child: CircleAvatar(child: Text(this.name[0])),
      ),
    ];
  }

//ここで会話のログを表示している
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
