import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogController extends GetxController {
  String _selectRadio = 'income';

  get getRadioValue => _selectRadio;

  set setRadioValue(value) {
    _selectRadio = value;
    update();
  }

  DateTime _selectedDate = DateTime.now();

  get getDate => _selectedDate;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2025),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;
    }
    update();
  }
}
