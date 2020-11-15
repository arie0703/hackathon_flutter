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



