import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'about_us_screen.dart';
import 'finance_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_screen.dart';
import 'package:sizer/sizer.dart';

class DashBoard extends StatefulWidget {
  static const routeName = '/';

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  void _launchCaller(String number) async {
    var url = 'tel:${number}';
    if (await canLaunch(url)) {
      await launch(url);
    } else
      throw 'could not place call';
  }

  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    AboutUsScreen(),
    FinanceScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex == 0) return true;
        setState(() {
          _currentIndex = 0;
        });
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: _children[_currentIndex],
          bottomNavigationBar: Container(
            height: 12.0.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              child: BottomNavigationBar(
                backgroundColor: const Color(0xfff7dd00),
                currentIndex: _currentIndex,
                iconSize: 18.0.sp,
                selectedIconTheme: IconThemeData(
                  color: const Color(0xff132B5E),
                ),
                selectedLabelStyle:
                    TextStyle(fontSize: 10.0.sp, fontFamily: 'Lato'),
                unselectedLabelStyle:
                    TextStyle(fontSize: 10.0.sp, fontFamily: 'Ubuntu'),
                unselectedIconTheme: IconThemeData(
                  color: const Color(0xff132B5E),
                ),
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.dashboard_outlined,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(
                        color: const Color(0xff132B5E),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.details,
                    ),
                    title: Text(
                      "About",
                      style: TextStyle(
                        color: const Color(0xff132B5E),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.money,
                    ),
                    title: Text(
                      "MOF",
                      style: TextStyle(
                        color: const Color(0xff132B5E),
                      ),
                    ),
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
          floatingActionButton: Container(

            height: 40.0.sp,
            width: 40.0.sp,
            child: FloatingActionButton(
              onPressed: () {
                _launchCaller('+923007757711');
              },
              child: Icon(
                Icons.phone,
                size: 20.0.sp,
                color: const Color(0xff132B5E),
              ),
              backgroundColor: const Color(0xfff7dd00),
            ),
          ),
        ),
      ),
    );
  }
}
