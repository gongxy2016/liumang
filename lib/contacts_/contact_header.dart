import 'package:flutter/material.dart';
import './contact_item.dart';

//好友列表头部
class ContactHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ContactItem(titleName: '添加好友',imgName: 'images/add_friend.png',),
        ContactItem(titleName: '公共聊天室',imgName: 'images/groupchat.png',)
      ],
    );
  }

}