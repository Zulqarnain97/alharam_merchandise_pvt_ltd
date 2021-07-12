import '../models/categories.dart';
import '../providers/categories_provider.dart';
import '../widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.4,
          toolbarHeight: 10.0.h,
          title: Container(
            child: Image.asset(
              'assets/logo.png',
              height: 8.0.h,
              width: 50.0.w,
            ),
          ),
        ),
        body: CategoriesGroup(),
      ),
    );
  }
}

class CategoriesGroup extends StatefulWidget {
  @override
  _CategoriesGroupState createState() => _CategoriesGroupState();
}

class _CategoriesGroupState extends State<CategoriesGroup> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CategoriesProvider>(context, listen: false)
        .fetchAndSetCategories()
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

      Provider.of<CategoriesProvider>(context, listen: false)
          .fetchAndSetCategories()
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
    final wat = Provider.of<CategoriesProvider>(context, listen: false).cats;

    return Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 72.0.h,
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: wat.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                    // builder: (c) => workOut[i],
                    value: wat[i],
                    child: CategoryItem(),
                  ),
                ),
        ));
  }
}
