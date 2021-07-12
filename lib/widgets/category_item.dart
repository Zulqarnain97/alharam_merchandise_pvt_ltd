import '../models/categories.dart';
import '../screens/sub_categories_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CategoryItem extends StatelessWidget {
  // final Categories categories;
  //
  // const CategoryItem({Key key, this.categories}) : super(key: key);

  Widget ImageTitleContainer(String image, String title) {
    return Container(
      height: 20.0.h,
      width: 80.0.w,
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20.0.sp)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 5,
              child: Container(
                width: 100.0.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20.0.sp)),
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 2.0.sp, horizontal: 10.0.sp),
                      child: Text(
                        title,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Zen Dots',
                          fontSize: 12.0.sp,
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.0.sp),
                        bottomLeft: Radius.circular(20.0.sp),
                      )),
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Categories>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(SubCategoriesScreen.routeName,
            arguments: {'id': categories.id, 'title': categories.title});
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 768 && constraints.maxWidth <= 1440) {
            return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10.0.sp, horizontal: 25.0.sp),
                child: ImageTitleContainer(categories.image, categories.title));
          } else {
            return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10.0.sp, horizontal: 20.0.sp),
                child: ImageTitleContainer(categories.image, categories.title));
          }
        },
      ),
    );
  }
}
