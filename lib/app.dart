import 'package:expense_tracker/controllerBinding.dart';
import 'package:expense_tracker/localization/locale_string.dart';
import 'package:expense_tracker/screens/splash_screen.dart';
import 'package:expense_tracker/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatefulWidget {


  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocaleString(),
      locale: Locale('en','US'),
      fallbackLocale: Locale('en','US'),
      initialBinding: ControllerBinder(),
      title: 'Expense Meter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.backgroundColor),
        fontFamily: 'inter',
      ),

      home: const SplashScreen(),
    );
  }
}
