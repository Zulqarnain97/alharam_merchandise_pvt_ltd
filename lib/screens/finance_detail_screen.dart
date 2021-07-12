import 'package:alharam_merchandise_pvt_ltd/screens/apply_for_finance_screen.dart';

import '../providers/finance_provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FinanceDetailScreen extends StatefulWidget {
  static const routeName = '/finance_detail_screen';

  @override
  _FinanceDetailScreenState createState() => _FinanceDetailScreenState();
}

class _FinanceDetailScreenState extends State<FinanceDetailScreen> {
  Widget FinanceSpecs(String columnName, String columnDetail) {
    return Container(
      height: 6.0.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              columnName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontFamily: 'Lato',
                fontSize: 12.0.sp,
              ),
            ),
            Text(
              columnDetail,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Ubuntu',
                fontSize: 12.0.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final finacecatId = ModalRoute.of(context).settings.arguments as String;
    final selectedFinance = Provider.of<FinanceProvider>(context, listen: false)
        .fin
        .singleWhere((element) => element.id == finacecatId);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: const Color(0xffF7DD00),
            automaticallyImplyLeading: false,
            elevation: 0.2,
            toolbarHeight: 10.0.h,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0.sp),
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: const Color(0xff132B5E),
                    size: 20.0.sp,
                  ),
                )),
            title: Container(
              height: 9.0.h,
              width: 95.0.w,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  selectedFinance.title,
                  maxLines: 2,
                  style: TextStyle(
                      color: const Color(0xff132B5E),
                      fontFamily: 'Zen Dots',
                      fontSize: 14.0.sp),
                ),
              ),
            ),
          ),
          body: Container(
            height: 82.0.h,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 5.0.h,
                  ),
                  FinanceSpecs(
                    'Tenure Years:',
                    selectedFinance.tenure_years.toString(),
                  ),
                  FinanceSpecs(
                    'Total Amount:',
                    'Rs. ' + selectedFinance.total_amount.toString(),
                  ),
                  FinanceSpecs(
                    'No. Of Installments:',
                    selectedFinance.no_of_installments.toString(),
                  ),
                  FinanceSpecs(
                    'Installment Duration:',
                    selectedFinance.installment_duration.toString() + ' months',
                  ),
                  Container(

                    height: 40.0.h,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.0.h, horizontal: 4.0.h),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Description:',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: 'Lato',
                                  fontSize: 12.0.sp,
                                ),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0.sp, horizontal: 6.0.sp),
                                child: SingleChildScrollView(
                                  child: Text(
                                    selectedFinance.description,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Ubuntu',
                                      fontSize: 12.0.sp,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            ApplyForFinanceScreen.routeName,
                            arguments: selectedFinance.id);
                        print(selectedFinance.id);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff132B5E),
                            border: Border.all(
                                color: const Color(0xffF7DD00), width: 1.0.sp),
                            borderRadius: BorderRadius.circular(15.0.sp)),
                        height: 10.0.h,
                        width: 50.0.w,
                        child: Center(
                          child: Text(
                            'Apply',
                            style: TextStyle(
                                color: const Color(0xffF7DD00),
                                fontFamily: 'Zen Dots',
                                fontSize: 14.0.sp),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
