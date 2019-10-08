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
      print('垃圾分类');
      Navigator.of(context).pushReplacementNamed('app');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: MaterialApp(
        home: Image.asset('images/loading.png',fit: BoxFit.fill),
      )
    );
  }
}