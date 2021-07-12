import '../providers/subcategories_provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/product_details_screen';

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  Widget CarSpecs(String name, String detail) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 35.0.w,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0.sp, horizontal: 5.0.sp),
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.black87, fontSize: 10.0.sp, fontFamily: 'Lato'),
            ),
          ),
        ),
        Container(
            width: 55.0.w,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 5.0.sp, horizontal: 5.0.sp),
                  child: Text(
                    detail,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0.sp,
                        fontFamily: 'Ubuntu'),
                  )),
            ))
      ],
    );
  }

  Widget CarDescription(String name, String description) {
    return Container(
        height: 20.0.h,
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 10.0.sp,
                    fontFamily: 'Lato'),
              ),
              SizedBox(
                height: 2.0.sp,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 5.0.sp, horizontal: 10.0.sp),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 10.0.sp,
                        fontFamily: 'Ubuntu'),
                  )),
            ])));
  }

  @override
  Widget build(BuildContext context) {
    final subcatId = ModalRoute.of(context).settings.arguments as String;
    final selectedProduct =
        Provider.of<SubCategoriesProvider>(context, listen: false)
            .subcat
            .singleWhere((element) => element.id == subcatId);

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Stack(
                children: [
                  Material(
                    elevation: 4,
                    child: Container(
                      height: 40.0.h,
                      width: 100.0.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25.0.sp),
                            bottomRight: Radius.circular(25.0.sp)),
                        child: Image.network(
                          selectedProduct.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    top: 0,
                    child: Container(
                      height: 40.0.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25.0.sp),
                            bottomRight: Radius.circular(25.0.sp)),
                        color: Colors.black.withOpacity(0.4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0.sp, horizontal: 10.0.sp),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 26.0.sp,
                              ),
                            ),
                          ),
                          Spacer(
                            flex: 6,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
                            child: Text(
                              selectedProduct.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Zen Dots',
                                  fontSize: 20.0.sp),
                            ),
                          ),
                          SizedBox(
                            height: 2.0.sp,
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 10.0.sp),
                              child: Text(
                                selectedProduct.price.toString() + ' Lacs',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12.0.sp,
                                    fontFamily: 'Ubuntu'),
                              )),
                          Spacer(
                            flex: 1,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 52.0.h,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 14.0.sp, vertical: 10.0.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CarSpecs(
                          'Available Colors:',
                          selectedProduct.colours,
                        ),
                        CarDescription(
                          'Description:',
                          selectedProduct.description,
                        ),
                        CarSpecs(
                          'Versions:',
                          selectedProduct.version,
                        ),
                        CarSpecs(
                          'Engine Capacity:',
                          selectedProduct.engine_cap,
                        ),
                        CarSpecs(
                          'Seat Capacity:',
                          selectedProduct.seat_cap.toString(),
                        ),
                        CarSpecs(
                          'Doors:',
                          selectedProduct.doors.toString(),
                        ),
                        CarSpecs(
                          'Fuel_Type:',
                          selectedProduct.fuel_type,
                        ),
                        CarSpecs(
                          'Transmission_Type:',
                          selectedProduct.transm_type,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
