import 'package:expense_tracker/controller/database_controller.dart';
import 'package:expense_tracker/controller/dialog_controller.dart';
import 'package:expense_tracker/controller/transaction_filtering_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(DialogController());
    Get.put(DatabaseController());
    Get.put(TransactionFilteringController());
  }

}