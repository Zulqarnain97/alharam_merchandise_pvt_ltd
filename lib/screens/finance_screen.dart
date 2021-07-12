import '../models/finance.dart';
import '../providers/finance_provider.dart';
import '../widgets/finance_category_item.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FinanceScreen extends StatefulWidget {
  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          toolbarHeight: 10.0.h,
          title: Container(
            height: 9.0.h,
            width: 100.0.w,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Modes Of Finance',
                maxLines: 2,
                style: TextStyle(
                    color: const Color(0xff132B5E),
                    fontFamily: 'Zen Dots',
                    fontSize: 16.0.sp),
              ),
            ),
          ),


        ),
        body: ModesOfFinanceGroup(),
      ),
    );
  }
}

class ModesOfFinanceGroup extends StatefulWidget {
  @override
  _ModesOfFinanceGroupState createState() => _ModesOfFinanceGroupState();
}

class _ModesOfFinanceGroupState extends State<ModesOfFinanceGroup> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<FinanceProvider>(context, listen: false)
        .fetchAndSetFinance()
        .then((value) {
      if (value) setState(() {});
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<FinanceProvider>(context, listen: false)
          .fetchAndSetFinance()
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final f = Provider.of<FinanceProvider>(context, listen: false).fin;

    return Container(
              height: 74.0.h,
              

              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: f.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                        // builder: (c) => workOut[i],
                        value: f[i],
                        child: FinanceCategoryItem(),
                      ),
                    ),
            );
  }
}
