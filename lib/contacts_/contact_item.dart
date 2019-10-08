import 'package:flutter/material.dart';
import './contact_vo.dart';

//好友列表项
class ContactItem extends StatelessWidget {

  //好友数据VO
  final ContactVO item;

  //标题名
  final String titleName;

  //图片路径
  final String imgName;

  //构造方法
  ContactItem({this.item, this.titleName, this.imgName});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        //每条列表下底部加一个边框
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
      ),
      height: 52.0,
      child: FlatButton(
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //展示头像或图片
              Image.asset(imgName,width: 36.0,height: 36.0,),
              Container(
                margin: const EdgeInsets.only(left: 12.0),
                child: Text(
                    titleName == null?item.name??'暂时':titleName,
                    style: TextStyle(fontSize: 18.0,color: Color(0xFF353535)),
                    maxLines: 1,
                ),
              ),
            ],
          )),
    );
  }
}
