import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sizer/sizer.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  void _launchEmail(String emailId) async {
    var url = 'mailto: $emailId';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('could not launch $url');
    }
  }

  void _launchUrl(String Url) async {
    if (await canLaunch(Url)) {
      await launch(Url);
    } else {
      print('could not launch $Url');
    }
  }

  void _launchCaller(String number) async {
    var url = 'tel:${number}';
    if (await canLaunch(url)) {
      await launch(url);
    } else
      throw 'could not place call';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: 80.0.h,
          color: Colors.white,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 12.0.h,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'About',
                          maxLines: 1,
                          style: TextStyle(
                              color: const Color(0xff132B5E),
                              fontFamily: 'Zen Dots',
                              fontSize: 20.0.sp),
                        )),
                  ),
                  Container(
                    height: 30.0.h,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.0.sp, horizontal: 20.0.sp),
                          child: Text(
                            "Al-Harram Merchandise Pvt Ltd is a fastest growing Finance company all over Pakistan. We deal in all kinds of Auto / Vehicles, Home Appliances & Construction Loan. Auto & Home Appliances installment plans are available for 1-7 Years at 9 % Markup only.",
                            style: TextStyle(
                                color: const Color(0xff132B5E),
                                fontFamily: 'Lato',
                                fontSize: 12.0.sp),
                            maxLines: 7,
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 15.0.sp, horizontal: 15.0.sp),
                    child: Container(
                      height: 35.0.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                _launchUrl(
                                    'https://www.google.com/maps?q=31.4637392,73.0820241&z=17&hl=en');
                              },
                              child: Container(
                                height: 10.0.h,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.black,
                                      size: 18.0.sp,
                                    ),
                                    SizedBox(
                                      width: 10.0.sp,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Head Office: Office No. 1-C, First Floor, Pearl City Tower, Sargodha Road, Faisalabad ',
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 10.0.sp,
                                            fontFamily: 'Ubuntu'),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              _launchUrl(
                                  'https://www.google.com/maps?q=31.4669012,74.2432394&z=17&hl=en');
                            },
                            child: Container(
                              height: 10.0.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                    size: 18.0.sp,
                                  ),
                                  SizedBox(
                                    width: 10.0.sp,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Second Office: Office No. 1, First Floor, Raffi Plaza, Lalazar Commercial Market, Main Raiwind Road Lahore ',
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 10.0.sp,
                                          fontFamily: 'Ubuntu'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _launchEmail(
                                  'alharammerchandisepvtltd@gmail.com');
                            },
                            child: Container(
                              height: 7.0.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.email,
                                    color: Colors.black,
                                    size: 18.0.sp,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      ' alharammerchandisepvtltd@gmail.com ',
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 12.0.sp,
                                          fontFamily: 'Ubuntu'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _launchCaller('+923007757711');
                            },
                            child: Container(
                              height: 7.0.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: Colors.black,
                                    size: 18.0.sp,
                                  ),
                                  SizedBox(
                                    width: 10.0.sp,
                                  ),
                                  Expanded(
                                    child: Text(
                                      '0300 7757711',
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 12.0.sp,
                                          fontFamily: 'Ubuntu'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
