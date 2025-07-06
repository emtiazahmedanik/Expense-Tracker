import 'package:expense_tracker/localization/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildLanguageDialog extends StatelessWidget {
  BuildLanguageDialog({super.key, required this.context});

  final BuildContext context;

  final List locale = [
    {'name': 'English', 'locale': 'en'},
    {'name': 'हिंदी', 'locale': 'hi'},
    {'name': 'বাংলা', 'locale': 'be'},
  ];

  void updateLanguage(String lang){
    Get.back();
    LocaleService().saveLangCode(lang);
    Get.updateLocale(Locale(lang));
  }

  @override
  Widget build(context) {
    return AlertDialog(
      title: Text('Choose a language'),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  updateLanguage(locale[index]['locale']);
                },
                child: Container(
                  color: Colors.grey.shade300,
                  child: ListTile(
                    title: Text(locale[index]['name']),

                  ),
                ),
              ),
            );
          },
          itemCount: locale.length,
        ),
      ),
    );
  }
}
