import 'package:flutter/material.dart';
import 'dart:async';

//加载页面
class LoadingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _LoadingState();
  }
}

class _LoadingState extends State<LoadingPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //在加载页面停顿2秒
    new Future.delayed(Duration(seconds: 3),(){
      print('Flutter即时通讯app界面实现');
      Navigator.of(context).pushReplacementNamed('app');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: Stack(
        children: <Widget>[
          //加载页面居中背景图，使用cover模式
          Image.asset('imgs/loading.png',fit: BoxFit.cover,),
        ],
      ),
    );
  }

}