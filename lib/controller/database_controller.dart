import 'package:expense_tracker/model/transaction_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';


class DatabaseController extends GetxController{
  final _transactionBox = Hive.box<TransactionModel>('transactions');
  //List<TransactionModel> historyList = [];
  Future<void> addTransaction(String type,double amount,DateTime date) async{
    final transaction = TransactionModel(type: type, amount: amount, date: date);
    await _transactionBox.add(transaction);
    update();
  }
  List<TransactionModel> history(){
    return _transactionBox.values.toList();
  }
}