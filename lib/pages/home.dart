import 'package:flutter/material.dart';
import '../widgets/home_search.dart';
import '../widgets/home_text.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var text0 = '如何区分日常生活垃圾';

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: MaterialApp(
          home: Column(
            children: <Widget>[
              widget_homeSearch(),
              widget_homeText(text0),
            ],
          ),
        ),
      ),
    );
  }
}
