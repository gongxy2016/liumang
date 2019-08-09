import 'package:flutter/material.dart';
import 'main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: SecondPage(),
      title: '第二页',
      routes: {
        '/first': (BuildContext context) => MyHomePage(),
        '/second': (BuildContext context) => SecondPage(),
      },
//      initialRoute: '/second',
    );
  }
}

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SecondPageState();
  }
}

class _SecondPageState extends State<SecondPage> {
  int _selectedIndex = 1;//当前选中项的索引
  final _widgetOptions = [
    Text('Intex 0:信息'),
    Text('Index 1:通讯录'),
    Text('Index 2:发现'),
  ];

  //选择按下处理 设置当前索引值为index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('这是第二页'),
      ),
      body: Center(
        child: RaisedButton(onPressed: () {
          //跳转到第一页
          Navigator.pushNamed(context, '/first');
        },
          child: _widgetOptions.elementAt(_selectedIndex),//居中显示某一个文本
        ),
      ),
      //都不导航按钮  包含图标及文本
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.chat),title: Text('信息')),
            BottomNavigationBarItem(icon: Icon(Icons.contacts),title: Text('通讯录')),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle),title: Text('发现')),
          ],
        currentIndex: _selectedIndex,//当前选中索引
        fixedColor: Colors.deepPurple,//选项中项的颜色
        onTap: _onItemTapped,//选择按下处理
      ),
    );
  }
}