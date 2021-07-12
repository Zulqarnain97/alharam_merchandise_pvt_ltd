import 'package:flutter/cupertino.dart';

import '../models/categories.dart';
import '../models/finance.dart';
import '../screens/finance_detail_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FinanceCategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final financeCategories = Provider.of<Finance>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(FinanceDetailScreen.routeName,
            arguments: financeCategories.id);
      },
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.sp, horizontal: 10.0.sp),
          child: Container(
            color: Colors.white,
            height: 18.0.h,
            width: 80.0.w,
            margin: EdgeInsets.symmetric(horizontal: 15.0.sp, vertical: 5.0.sp),
            child: Material(
              borderRadius: BorderRadius.circular(15.0.sp),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 5,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15.0.sp)),
                        child: Container(
                            color: Colors.white,
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(5.0.sp),
                                child: Text(
                                  financeCategories.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Lato',
                                    fontSize: 12.0.sp,
                                  ),
                                ),
                              ),
                            ))),
                  ),
                  Flexible(
                      fit: FlexFit.tight,
                      flex: 3,
                      child: Container(


                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.0.sp, horizontal: 2.0.sp),
                            child: Text(
                              financeCategories.title,

                              textAlign: TextAlign.center,
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Zen Dots',
                                fontSize: 10.0.sp,
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15.0.sp),
                              bottomLeft: Radius.circular(15.0.sp),
                            )),
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
