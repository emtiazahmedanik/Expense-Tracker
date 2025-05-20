import 'package:expense_tracker/screens/home_screen.dart';
import 'package:expense_tracker/utils/app_color.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.backgroundColor),
        fontFamily: 'inter',
      ),

      home: const HomeScreen(),
    );
  }
}
