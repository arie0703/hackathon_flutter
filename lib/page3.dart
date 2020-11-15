import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Page3 extends StatefulWidget {

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  var _status = 'Ready';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            '南山大学',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
          ),
          Image(image:NetworkImage('https://www.nanzan-u.ac.jp/img/index/pick_05.jpg'),),
          RaisedButton(
            child: Text('School'),
            onPressed: () {
              var url = 'https://www.nanzan-u.ac.jp';
              _launchUrl('$url');
            },
          ),
          Text(
            '奥村研究室',
            style: TextStyle(fontWeight:FontWeight.bold,fontSize: 30),
          ),
          Image(image:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSQ1ue2lOyCMDE6rn0hlQWvKS9IyzcaOfQLag&usqp=CAU'),),
          RaisedButton(
            child: Text('Lab'),
            onPressed: () {
              var url = 'http://www.st.nanzan-u.ac.jp/info/okumura_fujii_lab/index.html';
              _launchUrl('$url');
            },
          ),
          Text(_status)
        ],

void main() => runApp(
  MaterialApp(
    home: Page3(),
  ),
);

class Page3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<Page3> {
  var _status = 'Ready';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
              child: Text('Website'),
              onPressed: () {
                var url = 'https://flutter.keicode.com/';
                _launchUrl('$url');
              },
            ),
            RaisedButton(
              child: Text('Email'),
              onPressed: () {
                var email = 'test@example.com';
                var subject = Uri.encodeComponent('Hello');
                var body = Uri.encodeComponent('This is a test.');
                var url = 'mailto:$email?subject=$subject&body=$body';
                print(url);
                _launchUrl(url);
              },
            ),
            RaisedButton(
              child: Text('Phone'),
              onPressed: () {
                var tel = '+123456789';
                _launchUrl('tel:$tel');
              },
            ),
            RaisedButton(
                child: Text('SMS'),
                onPressed: () {
                  var tel = '2345678901';
                  _launchUrl('sms:$tel');
                }),
            Text(_status)
          ],
        ),

      ),
    );

  }
  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      setState(() {
        _status = 'Unable to launch url $url';
      }
      );
    }
  }

}





  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      setState(() {
        _status = 'Unable to launch url $url';
      });
    }
  }
}

