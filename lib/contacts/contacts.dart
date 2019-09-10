import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './contact_header.dart';
import './contact_item.dart';
import './contact_sider_list.dart';
import './contact_vo.dart';

class Contacts extends StatefulWidget {
  List<ContactVO> _setContactData() {
    List<ContactVO> contactData = [
      new ContactVO(seationKey: "A", name: 'A钢筋锅', avatarUrl: 'imgs/glg.png'),
      new ContactVO(seationKey: 'X', name: '熊三', avatarUrl: 'imgs/saner.png'),
      new ContactVO(seationKey: 'L', name: '流氓', avatarUrl: 'imgs/liumang.png')
    ];
    return contactData;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContactsState(_setContactData());
  }
}

class ContactsState extends State<Contacts> {
  final List<ContactVO> contactData;

  ContactsState(this.contactData);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //主体实现
      body: ContactSiderList(
        //好友列表数据
        items: contactData,
        //好友列表头构造器
        headerBuilder: (BuildContext context, int index) {
          return Container(
            //好友列表头
            child: ContactHeader(),
          );
        },
        //好友列表项构造器
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            //好友列表项
            child: ContactItem(
              item: contactData[index],
            ),
          );
        },
        sectionBuilder: (BuildContext context, int index) {
          return Container(
            height: 32.0,
            padding: const EdgeInsets.only(left: 14.0),
            color: Colors.grey[300],
            alignment: Alignment.centerLeft,
            //显示字母
            child: Text(
              contactData[index].seationKey,
              style: TextStyle(fontSize: 14.0, color: Color(0xff909090)),
            ),
          );
        },
      ),
    );
  }
}
