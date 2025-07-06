import 'package:expense_tracker/controller/chart_data_controller.dart';
import 'package:expense_tracker/controller/database_controller.dart';
import 'package:expense_tracker/controller/dialog_controller.dart';
import 'package:expense_tracker/controller/home_screen_controller.dart';
import 'package:expense_tracker/controller/name_database_controller.dart';
import 'package:expense_tracker/controller/transaction_filtering_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(DialogController());
    Get.put(DatabaseController());
    Get.put(TransactionFilteringController());
    Get.put(ChartDataController());
    Get.put(HomeScreenController());
    Get.put(NameDatabaseController());
  }

}