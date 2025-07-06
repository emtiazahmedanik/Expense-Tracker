import 'package:expense_tracker/localization/localization_service.dart';
import 'package:expense_tracker/screens/home_screen.dart';
import 'package:expense_tracker/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    _moveToNextScreen();
    super.initState();
  }

  Locale? _locale;
  Future<void> _getLocale() async{
    _locale = await LocaleService().getLocale();
    Get.updateLocale(_locale!);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 192,
              width: 192,
              child: Lottie.asset('assets/images/splash-animation.json'),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _moveToNextScreen() async{
    await _getLocale();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context)=>HomeScreen()),
        (predicate) => false
    );
  }
}
