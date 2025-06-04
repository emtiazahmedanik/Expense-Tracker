import 'package:expense_tracker/model/transaction_model.dart';
import 'package:hive/hive.dart';

class TransactionControllerHelper{
  static final DateTime now = DateTime.now();
  static List<TransactionModel> getTransactionsForMonth() {
    final transactionBox = Hive.box<TransactionModel>('transactions');
    final allTransactions = transactionBox.values.toList();
    return allTransactions.where((tx) =>
    tx.date.year == now.year && tx.date.month == now.month).toList();
  }
}