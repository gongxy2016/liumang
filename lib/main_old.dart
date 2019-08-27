import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'dart:io';

import 'SecondPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = '自定义主题';

    return MaterialApp(
      title: appName,
      theme: ThemeData(
        brightness: Brightness.light, //应用程序整体主题的亮度
        primaryColor: Colors.lightGreen[600], //App主要部分的背景色
        accentColor: Colors.orange[600], //前景色(文本、按钮等)
      ),
      home: MyHomePage(
        title: "感觉人生已经达到了高潮",
      ),
      routes: {
        '/first' : (BuildContext context) => MyHomePage(),//添加路由
        '/second': (BuildContext context) => SecondPage(),
      },
//      initialRoute: '/first',//初始路由页面为/fitst页面
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key,this.title}):super(key:key);//@required

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;//计数器

  //_counter++
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  //获取天气数据
  void getWeatherData() async {
    try{ //实例化一个HttpClient对象
      HttpClient httpClient = new HttpClient();
      //发起请求
      HttpClientRequest request = await httpClient.getUrl(
          Uri.parse('http://t.weather.sojson.com/api/weather/city/101030100'));
      //等待服务器返回数据
      HttpClientResponse response = await request.close();
      //使用utf8.decoder从response里解析数据
      var result = await response.transform(utf8.decoder).join();
      //输出相应头
      print(result);

      httpClient.close();
    }catch(e) {
      print('请求失败:$e');
    }
  }


  //登录界面
  //全局Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();
  //用户名
  String userName;
  //密码
  String password;

  void login() {
    //读取当前的Form状态
    var loginForm = loginKey.currentState;
    //验证Form表单
    if(loginForm.validate()) {
      loginForm.save();
      print('userName:'+userName+'password:'+password);
      Navigator.pushNamed(context, '/second');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title == null?'':widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: '搜索',
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.add),
            tooltip: '添加',
            onPressed: (){},
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              '$_counter',//绑定计数器的值
              style: Theme.of(context).textTheme.title,
            ),
            RaisedButton(
              onPressed: (){
                //指定url并发起请求
                const url = 'https://www.baidu.com';
                launch(url);
              },
              child: Text('打开百度'),
            ),
            RaisedButton(
              onPressed: getWeatherData,
              child: Text('获取天气数据'),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: loginKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: '请输入用户名'
                      ),
                      validator: (value){
                        return value.length <= 0 ? "请输入用户名" : null;
                      },
                      onSaved: (value){
                        userName = value;
                      },
                      onFieldSubmitted: (value){

                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: '请输入密码',
                      ),
                      obscureText: true,
                      //验证表单方法
                      validator: (value) {
                        return value.length < 6 ? "密码长度不够6位":null;
                      },
                      onSaved: (value) {
                        password = value;
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 340.0,
              height: 42.0,
              child: RaisedButton(
                onPressed: login,
                child: Text(
                  '登录',
                  style: TextStyle(
                      fontSize: 18.0
                  ),
                ),
              ),
            ),
/*            RaisedButton(
              child: Text('这是第一页',style: TextStyle(fontSize: 28.0),),
              onPressed: (){
                //跳转到第二个页面
                Navigator.pushNamed(context, '/second');
              },
            )*/
          ],
        ),
      ),
      floatingActionButton: Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.grey),
          child: FloatingActionButton(
            onPressed: _incrementCounter,
            child:Icon(Icons.add),
          )
      ),
    );
  }
}