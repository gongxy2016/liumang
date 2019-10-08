import 'package:flutter/material.dart';

Widget widget_homeText(@required text) {
  return Container(
    width: double.infinity,
    color: Colors.green,
    padding: EdgeInsets.only(bottom: 40.0),
    child: Center(
      child: Text(
        text,
        style: TextStyle(color:Colors.white,fontSize: 25,decoration: TextDecoration.none),
      ),
    ),
  );
}
