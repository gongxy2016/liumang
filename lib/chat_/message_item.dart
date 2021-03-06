import 'package:flutter/material.dart';
import './message_data.dart';
import '../common_/touch_callback.dart';
import 'package:date_format/date_format.dart';

//聊天信息项
class MessageItem extends StatelessWidget {
  final MessageData message;

  MessageItem(this.message);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          //仅加一个底部边,这样整个列表的每项信息下面都会有一条边
          border:
          Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9)))),
      height: 64.0,
      //按下回调处理空实现
      child: TouchCallBack(
          child: Row(
            //垂直方向居中显示
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //展示头像
              Container(
                //头像左右留一定的外边距
                margin: const EdgeInsets.only(left: 13.0, right: 13.0),
                child: Image.asset(
                  message.avatar,
                  width: 48.0,
                  height: 48.0,
                ),
              ),
              Expanded(
                //主标题和子标题采用垂直布局
                child: Column(
                  //垂直方向居中对齐
                  mainAxisAlignment: MainAxisAlignment.center,
                  //水平方向靠左对齐
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      message.title,
                      style:
                      TextStyle(fontSize: 16.0, color: Color(0xFF353535)),
                      maxLines: 1,
                    ),
                    Text(
                      message.subTitle,
                      style:
                      TextStyle(fontSize: 14.0, color: Color(0xFFa9a9a9)),
                      maxLines: 1,
                      //显示不完的用省略号显示
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                //时间 顶部对齐
                alignment: AlignmentDirectional.topStart,
                margin: const EdgeInsets.only(right: 12.0,top: 12.0),
                child: Text(
                  //格式化时间
                  formatDate(message.time, [HH,':',nn,':','ss']).toString(),
                  style: TextStyle(fontSize: 14.0,color: Color(0xFFa9a9a9)),
                ),
              ),
            ],
          ),
          onPressed: () {}),
    );
  }
}
