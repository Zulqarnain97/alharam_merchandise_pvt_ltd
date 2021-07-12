import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ResponsivenessTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints){
        if(constraints.maxWidth>=768 && constraints.maxWidth <=1440 ){
          return Container(
            color: Colors.purple,
            height: 50.0.h,
            width: 50.0.w,
          );
        }
        else if( constraints.maxWidth > constraints.maxHeight ){
          return Container(
            color: Colors.red,
            height: 70.0.h,
            width: 70.0.w,
          );
        }
        else return Container(
          color: Colors.greenAccent,
          height: 100.0.h,
          width: 100.0.w,
        );
      }),
    );
  }

}