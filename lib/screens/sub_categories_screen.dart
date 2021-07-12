import '../models/subcategories.dart';
import '../providers/subcategories_provider.dart';
import '../widgets/sub_category_item.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SubCategoriesScreen extends StatefulWidget {
  static const routeName = '/sub_categories_screen';

  @override
  _SubCategoriesScreenState createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final CatId = routeArgs['id'];
      Provider.of<SubCategoriesProvider>(context, listen: false)
          .sendCategoryId(CatId)
          .then((_) {
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
    final height = MediaQuery.of(context).size.height;
    print('inside build');

    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final CatId = routeArgs['id'];
    final CatTitle = routeArgs['title'];

    Provider.of<SubCategoriesProvider>(context, listen: false)
        .sendCategoryId(CatId);
    setState(() {});

    var selectedCategory = [];
    selectedCategory =
        Provider.of<SubCategoriesProvider>(context, listen: false).subcat;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xffF7DD00),
          elevation: 0.2,
          toolbarHeight: 10.0.h,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.sp),
                child: Container(
                  height: 08.0.h,
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: const Color(0xff132B5E),
                    size: 20.0.sp,
                  ),
                ),
              )),
          title: Container(
              height: 08.0.h,
              width: 70.0.w,

              child: Padding(
                padding: EdgeInsets.only(left: 10.0.sp),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
            CatTitle,

            style: TextStyle(
                    color: const Color(0xff132B5E),
                    fontFamily: 'Zen Dots',
                    fontSize: 18.0.sp),
          ),
                ),
              )),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
              height: 80.0.h,


              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return SubCategoryItem(
                          id: selectedCategory[index].id,
                          title: selectedCategory[index].title,
                          image: selectedCategory[index].image,
                          price: selectedCategory[index].price,
                          description: selectedCategory[index].description,
                          engine_cap: selectedCategory[index].engine_cap,
                          seat_cap: selectedCategory[index].seat_cap,
                          doors: selectedCategory[index].doors,
                          fuel_type: selectedCategory[index].fuel_type,
                          transm_type: selectedCategory[index].transm_type,
                          version: selectedCategory[index].version,
                          colours: selectedCategory[index].colours,
                        );
                      },
                      itemCount: selectedCategory.length,
                    ),

          ),
        ),
      ),
    );
  }
}
