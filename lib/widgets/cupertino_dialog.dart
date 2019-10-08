import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget widget_cupertinoDialog(@required context,@required content,@required title) {
  return CupertinoAlertDialog(
    content: content,
    title: title,
    actions: <Widget>[
      CupertinoButton(
        child: Text('确定',style: TextStyle(color: Colors.green),),
        onPressed: (){
          Navigator.of(context).pop();
//        Navigator.pop(context);
        },
      ),
    ],
  );
}