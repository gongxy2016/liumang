import 'package:flutter/material.dart';
import '../common_/im_item.dart';
import '../common_/touch_callback.dart';

class Personal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //列表
      body: ListView(
        children: <Widget>[
          //头像部分实现
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            height: 80.0,
            child: TouchCallBack(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //添加头像
                  Container(
                    margin: const EdgeInsets.only(left: 12.0, right: 15.0),
                    child: Image.asset(
                      'images/gjg.png',
                      width: 70.0,
                      height: 70.0,
                    ),
                  ),
                  //用户名及账号显示
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '钢筋锅',
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xFF353535)),
                        ),
                        Text(
                          '账号 penggang',
                          style: TextStyle(
                              fontSize: 14.0, color: Color(0xFFa9a9a9)),
                        ),
                      ],
                    ),
                  ),
                  //二维码图片显示
                  Container(
                    margin: const EdgeInsets.only(left: 12.0,right: 15.0),
                    child: Image.asset('images/code.png',width: 24.0,height: 24.0,),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
          //列表项  使用ImItem渲染
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: ImItem(title: '好友动态',imagePath: 'images/me_friends.png',),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ImItem(
                  imagePath: 'images/me_message.png',
                  title: '消息管理',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xFFd9d9d9),
                  ),
                ),
                ImItem(
                  imagePath: 'images/me_photo.png',
                  title: '我的相册',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xFFd9d9d9),
                  ),
                ),
                ImItem(
                  imagePath: 'images/me_file.png',
                  title: '我的文件',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xFFd9d9d9),
                  ),
                ),
                ImItem(
                  imagePath: 'images/me_service.png',
                  title: '联系客服',
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: ImItem(title: '清理缓存',imagePath: 'images/me_clear.png',),
          ),
        ],
      ),
    );
  }
}
