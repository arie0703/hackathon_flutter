import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      });
    }
  }
}