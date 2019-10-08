import 'package:flutter/material.dart';

class ContactVO {
  //字母排列值
  String seationKey;
  //名称
  String name;
  //头像url
  String avatarUrl;
  //构造函数
  ContactVO({@required this.seationKey,this.name,this.avatarUrl});
}