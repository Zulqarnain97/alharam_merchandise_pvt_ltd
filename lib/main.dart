import 'package:alharam_merchandise_pvt_ltd/screens/apply_for_finance_screen.dart';
import 'package:alharam_merchandise_pvt_ltd/screens/responsiveness_test.dart';
import 'package:sizer/sizer_util.dart';

import './providers/categories_provider.dart';
import './providers/finance_provider.dart';
import './providers/subcategories_provider.dart';
import './screens/dashboard.dart';
import './screens/finance_detail_screen.dart';
import './screens/finance_screen.dart';
import './screens/home_screen.dart';
import './screens/product_details_screen.dart';
import './screens/splash_screen.dart';
import './screens/sub_categories_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => MyApp(),
    enabled: !kReleaseMode,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (ctx) => CategoriesProvider(),
              ),
              ChangeNotifierProvider(
                create: (ctx) => SubCategoriesProvider(),
              ),
              ChangeNotifierProvider(
                create: (ctx) => FinanceProvider(),
              ),
            ],
            child: LayoutBuilder(//return LayoutBuilder
        builder: (context, constraints) {
      return OrientationBuilder(//return OrientationBuilder
          builder: (context, orientation) {
        //initialize SizerUtil()
        SizerUtil().init(constraints, orientation); //initialize SizerUtil
        return MaterialApp(
              title: "Al-Haram Merchandise",
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.deepPurple,
              ),
              initialRoute: '/',
              routes: {
                '/': (BuildContext context) => SplashScreen(),
                '/sub_categories_screen': (BuildContext context) =>
                    SubCategoriesScreen(),
                '/product_details_screen': (BuildContext context) =>
                    ProductDetailsScreen(),
                '/finance_detail_screen': (BuildContext context) =>
                    FinanceDetailScreen(),
                '/apply_for_finance_screen': (BuildContext context) =>
                    ApplyForFinanceScreen(),
              },
            );});})
    );

  }
}
