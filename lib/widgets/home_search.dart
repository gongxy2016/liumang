import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';

TextEditingController controller = TextEditingController();

Widget widget_homeSearch() {

  Future getResult() async {
    try {
      Map paras = {'key':'bd152e08623a2c493fa5a3dd46e63c21','q':controller.text};
      Response response;
      Dio dio = Dio();
      response = await dio.get('http://apis.juhe.cn/rubbish/search',queryParameters: {'key':'bd152e08623a2c493fa5a3dd46e63c21','q':'卫生纸'});
      print('请求完成');
      print('返回的垃圾数据：'+response.toString());
      return response;
    }catch(e) {
      print(e);
    }
  }

  return Container(
    width: double.infinity,
    height: 150.0,
    color: Colors.green,
    child: Center(
        child: Container(
//          decoration: BoxDecoration(color: Colors.white,borderRadius:BorderRadius.all(Radius.circular(0.5))),
            padding: EdgeInsets.only(left: 50.0, right: 60.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(80)),
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    icon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        print('点击了查询按钮');
                        getResult();
                      },
                    ),
                    hintText: '请输入垃圾名称',
                    border: InputBorder.none),
              ),
            ),
        ),
    ),
  );
}
