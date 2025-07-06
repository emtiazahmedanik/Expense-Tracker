import 'package:get/get.dart';

class ChartDataController extends GetxController{
  int _incomeToolTipValue = 0;
  set setIncomeToolTipValue(value){
    _incomeToolTipValue = value;
    update();
  }
  get getIncomeToolTipValue => _incomeToolTipValue;
}