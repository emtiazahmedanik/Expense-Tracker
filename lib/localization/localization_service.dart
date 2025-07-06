import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleService {

  final String defaultLangCode = 'en';
  final _key = 'language';
  Future<void> saveLangCode(String langCode) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, langCode);
  }

  Future<Locale> getLocale() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langCode = prefs.getString(_key) ?? defaultLangCode;
    return Locale(langCode);
  }

}
