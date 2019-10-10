import 'package:flutter/material.dart';
import '../widgets/home_search.dart';
import '../widgets/home_text.dart';
import 'package:dio/dio.dart';
import '../interf/on_home_search_listener.dart';
import '../bean/bean_home_search.dart';
import 'package:json_serializable/json_serializable.dart';
import '../widgets/home_intro.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements OnHomeSearchListener{

  var text0 = '如何区分日常生活垃圾';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Column(
            children: <Widget>[
              widget_homeSearch(this),
              widget_homeText(text0),
//              Text('1111111',style: TextStyle(color: Colors.pink),),
//              widget_homeIntro(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onViewClick(val) {
    // TODO: implement onViewClick
    setState(() {
      //todo json解析
      text0 = '';
      /*List<Map> textList = (val['data'] as List).cast();
      for(int i = 0;i < textList.length;i++) {
        text0 += textList[i]['itemName']+' : '+textList[i]['itemCategory']+'\n';
      }*/
      /*HomeSearchBean homeSearchBean = val;
      List<Result> resultList = homeSearchBean.result;
      for(int i = 0;i < resultList.length;i++) {
        text0 += resultList[i].itemName+" : "+resultList[i].itemCategory+"\n";
      }*/
      /*
      var homeSearchBean = HomeSearchBean.fromJson(val);
      List<Result> resultList = homeSearchBean.result;
      for(int i = 0;i < resultList.length;i++) {
        text0 += resultList[i].itemName+" : "+resultList[i].itemCategory+"\n";
      }*/
//      print('重绘page text0 = '+text0);
    });
  }
}
