import 'dart:async';
import 'dart:convert';

import 'package:alharam_merchandise_pvt_ltd/providers/finance_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class ApplyForFinanceScreen extends StatefulWidget {
  static const routeName = '/apply_for_finance_screen';

  @override
  _ApplyForFinanceScreenState createState() => _ApplyForFinanceScreenState();
}

class _ApplyForFinanceScreenState extends State<ApplyForFinanceScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final financeId = ModalRoute.of(context).settings.arguments as String;
    final selectedFinance = Provider.of<FinanceProvider>(context, listen: false)
        .fin
        .singleWhere((element) => element.id == financeId);

    print(selectedFinance.id);

    final node = FocusScope.of(context);

    Widget NamePhoneTextField(
      String hint,
      TextInputType type,
      String error,
      TextEditingController controller,
      FormFieldValidator validator,
      Function moveFocus,
    ) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0.sp, horizontal: 20.0.sp),
        child: Container(
          height: 8.0.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0.sp),
              border: Border.all(
                color: const Color(0xff132B5E),
              )),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0.sp),
              child: TextFormField(
                keyboardType: type,
                controller: controller,
                onEditingComplete: moveFocus,
                validator: validator,
                style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 14.0.sp,
                  color: const Color(0xff132B5E),
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: 12.0.sp,
                      color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget MessageTextField(
      String hint,
      String error,
      TextInputType type,
      TextEditingController controller,
    ) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0.sp, horizontal: 20.0.sp),
        child: Container(
          height: 20.0.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0.sp),
              border: Border.all(
                color: const Color(0xff132B5E),
              )),
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0.sp),
              child: TextFormField(
                keyboardType: type,
                controller: controller,
                style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 14.0.sp,
                  color: const Color(0xff132B5E),
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: 12.0.sp,
                      color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
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
              padding: EdgeInsets.only(left: 1.0.sp),
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: const Color(0xff132B5E),
                size: 20.0.sp,
              ),
            )),
        title: Container(
          height: 9.0.h,
          width: 100.0.w,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Apply For Finance',
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
          height: 80.0.h,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.0.h,
                  ),
                  NamePhoneTextField(
                    'Enter Name',
                    TextInputType.name,
                    'Name cannot be empty',
                    name,
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name cannot be empty';
                      }
                      return null;
                    },
                    () => node.nextFocus(),
                  ),
                  SizedBox(
                    height: 1.0.sp,
                  ),
                  NamePhoneTextField(
                    'Enter Phone',
                    TextInputType.phone,
                    'Phone cannot be empty',
                    phone,
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone cannot be empty';
                      }
                      return null;
                    },
                    () => node.nextFocus(),
                  ),
                  SizedBox(
                    height: 1.0.sp,
                  ),
                  MessageTextField(
                    'Message (Optional)',
                    'Enter any message',
                    TextInputType.multiline,
                    message,
                  ),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        if (formkey.currentState.validate()) {
                          print('Sending message');
                          SendingMessage(name.text, phone.text, message.text,
                              selectedFinance.id);
                          Timer(const Duration(milliseconds: 4000), () {
                            Navigator.pop(context);
                          });
                          Fluttertoast.showToast(
                            msg: "Thanks for applying....."
                                "We will contact you on your phone number",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 4,
                            backgroundColor: Colors.grey,
                            textColor: Colors.black,
                            fontSize: 16.0.sp,
                          );
                          // Navigator.pop(context);

                        } else {
                          print("Not Validated");
                        }
                        ;
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
                            'Apply Now',
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

Future<void> SendingMessage(
    String name, String phone, String message, String id) async {
  const url =
      'https://admin.alharammerchandisepvtltd.com/api/financeuser/store';

  print('name= $name and phone = $phone and message = $message and id=$id');
  final response = await http.post(url,
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({
        'username': name,
        'mobile': phone,
        'notes': message,
        'financeid': id,
      }));
  var data = json.decode(response.body);
  print('printing post');
  print(data);
}
