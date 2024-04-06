import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app_test/app/modules/home/views/bottom_nav_bar.dart';
import 'package:food_app_test/constants/constants.dart';
import 'package:food_app_test/constants/utils.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (contextScreen, child) {
          return GetMaterialApp(
            title: 'Food test app',
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.fade,
            locale: const Locale(
              'tm',
            ),
            translations: MyTranslations(),
            theme: ThemeData(
              scaffoldBackgroundColor: kPrimaryColor,
              brightness: Brightness.light,
              fontFamily: gilroyMedium,
              colorSchemeSeed: kPrimaryColor,
              useMaterial3: false,
              appBarTheme: AppBarTheme(
                backgroundColor: kPrimaryColor,
                systemOverlayStyle: const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark, statusBarColor: kPrimaryColor),
                titleTextStyle: TextStyle(color: Colors.white, fontFamily: gilroySemiBold, fontSize: 20.sp),
                elevation: 0,
              ),
              bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent.withOpacity(0)),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: const BottomNavBar(),
          );
        });
  }
}
