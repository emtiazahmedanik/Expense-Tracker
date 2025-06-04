import 'package:expense_tracker/controller%20helper/transaction_controller_helper.dart';
import 'package:expense_tracker/model/transaction_model.dart';
import 'package:get/get.dart';

class TransactionFilteringController extends GetxController{
  List<TransactionModel> monthTransactions = TransactionControllerHelper.getTransactionsForMonth();
  double _totalIncomeOfMonth = 0;
  double _totalExpenseOfMonth = 0;
  double _totalBalanceOfMonth = 0;
  get getIncome => _totalIncomeOfMonth;
  get getExpense => _totalExpenseOfMonth;
  get getBalance => _totalBalanceOfMonth;
  @override
  void onInit() {
    totalBalance();
    totalExpense();
    totalIncome();
    super.onInit();
  }

  void updateAll(){
    monthTransactions = TransactionControllerHelper.getTransactionsForMonth();
    totalIncome();
    totalExpense();
    totalBalance();
    update();
  }
  void totalIncome(){
    final income = _getTotal(monthTransactions, 'income');
    _totalIncomeOfMonth = income;
  }

  void totalExpense(){
    final expense = _getTotal(monthTransactions, 'expense');
    _totalExpenseOfMonth = expense;
  }
  void totalBalance(){
    final balance = _getBalance(monthTransactions);
    _totalBalanceOfMonth = balance;
  }

  double _getTotal(List<TransactionModel> list, String type) {
    return list
        .where((tx) => tx.type == type)
        .fold(0.0, (sum, tx) => sum + tx.amount);
  }

  double _getBalance(List<TransactionModel> list) {
    return _getTotal(list, 'income') - _getTotal(list, 'expense');
  }




}