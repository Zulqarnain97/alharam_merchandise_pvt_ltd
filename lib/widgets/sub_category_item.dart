
import '../screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SubCategoryItem extends StatelessWidget {

  final String id, title, image, description, engine_cap, fuel_type, transm_type, version, colours;
  final int price, seat_cap, doors;

  const SubCategoryItem({Key key, this.id, this.title, this.image, this.description, this.engine_cap, this.fuel_type, this.transm_type, this.version, this.colours, this.price, this.seat_cap, this.doors}) : super(key: key);
  // final SubCategories subcategories;
  //
  // const SubCategoryItem({Key key, this.subcategories}) : super(key: key);
  
  Widget SubCategoryMaterialBox(String image, String title){
    return Material(
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
                borderRadius:
                BorderRadius.all(Radius.circular(20.0.sp)),
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
              child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(

                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0.sp, horizontal: 10.0.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            softWrap: false,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Zen Dots',
                              fontSize: 12.0.sp,
                            ),
                          ),
                          SizedBox(width: 2.0.sp,),
                          Text(
                            'Rs. '+price.toString() + ' Lacs',
                            softWrap: false,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Ubuntu',
                              fontSize: 12.0.sp,
                            ),
                          ),

                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20.0.sp),
                          bottomLeft: Radius.circular(20.0.sp),
                        )),
                  )))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(ProductDetailsScreen.routeName, arguments: id);
      },
      child:
      LayoutBuilder(
        builder: (context, constraints){
          if(constraints.maxWidth >= 768 && constraints.maxWidth <= 1440){
          return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.sp, horizontal: 25.0.sp),
              child: Container(

                height: 22.0.h,
                width: 60.0.w,

                child: SubCategoryMaterialBox(image, title),
              ));}
          else {
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0.sp, horizontal: 20.0.sp),
                child: Container(

                  height: 20.0.h,
                  width: 60.0.w,

                  child: SubCategoryMaterialBox(image, title),
                ));
          }
        },

      ),
    );
  }
}
