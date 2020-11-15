import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // タブバーを操作すると変数が変化する
  int _selectedIndex = 0;

  // 表示する Widget の一覧
  // デフォルトだと_selectedIndexが0のpage1が表示される。
  static List<Widget> _pageList = [
    Page1(),
    Page2(),
    Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsUni'),
      ),
      body: _pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.android),
            title: Text('ChatBot'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            title: Text('News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_outlined),
            title: Text('Analysis'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
