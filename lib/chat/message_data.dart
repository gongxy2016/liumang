import 'package:flutter/material.dart';

class MessageData {
  //头像
  String avatar;

  //主标题
  String title;

//子标题
  String subTitle;

//消息时间
  DateTime time;

//消息类型
  String type;

  MessageData(this.avatar, this.title, this.subTitle, this.time, this.type);
}

class MessageType {
  final String SYSTEM = "MESSAGE_TYPE_SYSTEM";
  final String PUBLIC = "MESSAGE_TYPE_PUBLIC";
  final String CHAT = "MESSAGE_TYPE_CHAT";
  final String GROUP = "MESSAGE_TYPE_GROUP";
}

