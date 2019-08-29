import 'package:flutter/material.dart';
import './chat/message_page.dart';
import './contacts/contacts.dart';
import './personal/personal.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppState();
  }
}

class AppState extends State<App> {
  var _currentIndex = 0;

  MessagePage message; //聊天页面
  Contacts contacts; //好友页面
  Personal me; //我的页面

  currentPage() {
    switch (_currentIndex) {
      case 0:
        //返回聊天页面
        if (message == null) {
          message = new MessagePage();
        }
        return message;
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

  //渲染某个菜单项，传入菜单标题，图片路径或图标
  _popupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          //判断是使用图片路径还是图标
          imagePath != null
              ? Image.asset(
                  imagePath,
                  width: 32.0,
                  height: 32.0,
                )
              : SizedBox(
                  width: 32.0,
                  height: 32.0,
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('即时通讯'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              //跳转至搜索页面
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(
              //搜索图标
              Icons.search,
            ),
          ),
          Padding(
            //左右内边距
            padding: const EdgeInsets.only(left: 30.0, right: 20.0),
            child: GestureDetector(
              onTap: () {
                //弹出菜单
                showMenu(
                    context: context,
                    //定位在界面的右上角
                    position: RelativeRect.fromLTRB(500.0, 76.0, 10.0, 0.0),
                    //展示所有菜单项
                    items: <PopupMenuEntry>[
                      _popupMenuItem('发起会话', imagePath: 'imgs/menu_group.png'),
                      _popupMenuItem('添加好友', imagePath: 'imgs/add_friend.png'),
                      _popupMenuItem('联系客服', icon: Icons.person),
                    ]);
              },
              //菜单按钮
              child: Icon(Icons.add),
            ),
          )
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
                '聊天',
                style: TextStyle(
                    color: _currentIndex == 0
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              //判断当前索引图片切换显示
              icon: _currentIndex == 0
                  ? Image.asset(
                      'imgs/message_pressed',
                      width: 32.0,
                      height: 28.0,
                    )
                  : Image.asset(
                      'imgs/message_normal.png',
                      width: 32.0,
                      height: 28.0,
                    ),
            ),
            new BottomNavigationBarItem(
                title: Text(
                  '好友',
                  style: TextStyle(
                      color: _currentIndex == 1
                          ? Color(0xFF46c01b)
                          : Color(0xff999999)),
                ),
                icon: _currentIndex == 0
                    ? Image.asset(
                        'imgs/contacts_fill',
                        width: 32.0,
                        height: 28.0,
                      )
                    : Image.asset(
                        'imgs/contacts_line',
                        width: 32.0,
                        height: 28.0,
                      )),
            new BottomNavigationBarItem(
                title: Text(
                  '我的',
                  style: TextStyle(
                      color: _currentIndex == 2
                          ? Color(0xFF46c01b)
                          : Color(0xff999999)),
                ),
                icon: _currentIndex == 1
                    ? Image.asset(
                        'imgs/profile_pressed.png',
                        width: 32.0,
                        height: 28.0,
                      )
                    : Image.asset(
                        'imgs/profile_normal.png',
                        width: 32.0,
                        height: 28.0,
                      ))
          ]),
      body: currentPage(),
    );
  }
}
