import 'package:flutter/material.dart';
import './message_data.dart';
import './message_item.dart';

class MessagePage extends StatefulWidget {
  List<MessageData> _setMessageData() {
    List<MessageData> messageData = [
      new MessageData(
          'imgs/code.png',
          '一休哥',
          "突然想到的",
          DateTime.now(),
          MessageType().CHAT),
      new MessageData(
          'imgs/public.png',
          '哆啦A梦',
          '嗯呢',
          DateTime.now(),
          MessageType().CHAT)
    ];

    return messageData;
  }

  @override
  State<StatefulWidget> createState() {
    return MessageState(_setMessageData());
  }
}

class MessageState extends State<MessagePage> {
  MessageState(this.messageData);

  final List<MessageData> messageData;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //构造列表
      body: ListView.builder(
          //传入数据长度
          itemCount: messageData.length,
          itemBuilder: (BuildContext context,int index){
            //传入messageData返回列表项
            return new MessageItem(messageData[index]);
          }),
    );
  }
}
