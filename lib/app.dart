import 'package:flutter/material.dart';
import './chat_/message_page.dart';
import './contacts_/contacts.dart';
import './personal_/personal.dart';
import './pages/home.dart';
import './widgets/cupertino_dialog.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppState();
  }
}

class AppState extends State<App> {
  var _currentIndex = 0;

  HomePage home; //主页
  Contacts contacts; //好友页面
  Personal me; //我的页面

  Widget _currentPage() {
    switch (_currentIndex) {
      case 0:
        //返回聊天页面
        if (home == null) {
          home = new HomePage();
        }
        return home;
      case 1:
        //返回好友页面
        if (contacts == null) {
          contacts = new Contacts();
        }
        return contacts;
      case 2:
        //返回我的页面
        if (me == null) {
          me = new Personal();
        }
        return me;
    }
  }

  @override
  Widget build(BuildContext context) {
    //弹框内容
    Widget dialogContent() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('1、请正确输入垃圾名称'),
          Text(
            '2、本查询系统仅供参考，具体分类要求以属地专业管理部门为准',
            textAlign: TextAlign.start,
          ),
        ],
      );
    }
    //弹框标题
    Widget dialogTitle() {
      return Center(
        child: Text('温馨提示',style: TextStyle(color: Colors.green),),
      );
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '垃圾分类查询',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
//              print('垃圾分类查询,onTap()');
              showDialog(
                  context: context,
                  builder: (context) => widget_cupertinoDialog(context,dialogContent(), dialogTitle()));
            },
            child: Image.asset('images/que(1).png'),
          ),
        ],
      ),
      //底部导航按钮
      bottomNavigationBar: new BottomNavigationBar(
          //通过fixedColor设置选中item的颜色
          type: BottomNavigationBarType.fixed,
          //当前页面索引
          currentIndex: _currentIndex,
          //按下后设置当前页面索引
          onTap: ((index) {
            setState(() {
              _currentIndex = index;
            });
          }),
          //底部导航按钮项
          items: [
            //导航按钮项传入文本及图标
            new BottomNavigationBarItem(
              title: Text(
                '首页',
                style: TextStyle(
                    color: _currentIndex == 0
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              //判断当前索引图片切换显示
              icon: _currentIndex == 0 ? Icon(Icons.home) : Icon(Icons.home),
            ),
            new BottomNavigationBarItem(
                title: Text(
                  '资讯',
                  style: TextStyle(
                      color: _currentIndex == 1
                          ? Color(0xFF46c01b)
                          : Color(0xff999999)),
                ),
                icon: _currentIndex == 1
                    ? Icon(Icons.description)
                    : Icon(Icons.description)),
            new BottomNavigationBarItem(
                title: Text(
                  '我的',
                  style: TextStyle(
                      color: _currentIndex == 2
                          ? Color(0xFF46c01b)
                          : Color(0xff999999)),
                ),
                icon: _currentIndex == 2
                    ? Icon(Icons.person)
                    : Icon(Icons.person))
          ]),
      body: _currentPage(),
    );
  }
}
