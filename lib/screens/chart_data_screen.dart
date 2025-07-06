import 'package:expense_tracker/controller/chart_data_controller.dart';
import 'package:expense_tracker/model/transaction_model.dart';
import 'package:expense_tracker/widgets/buildBarChart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ChartDataScreen extends StatefulWidget {
  const ChartDataScreen({super.key});

  @override
  State<ChartDataScreen> createState() => _ChartDataScreenState();
}

class _ChartDataScreenState extends State<ChartDataScreen> {

  final box = Hive.box<TransactionModel>('transactions');
  final _chartDataController = Get.find<ChartDataController>();

  @override
  Widget build(BuildContext context) {
    final allTransactions = box.values.toList();

    final Map<int, double> incomeData = getMonthlyTotal(allTransactions, 'income');
    final Map<int, double> expenseData = getMonthlyTotal(allTransactions, 'expense');

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20,),
            Text("Income", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // SizedBox(height: 200, child: buildBarChart(incomeData, 'Income', Colors.green)),
            SizedBox(height: 200, child: buildBarChart(incomeData, 'Income', Colors.green)),
            SizedBox(height: 32),
            Text("Expense", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: buildBarChart(expenseData, 'Expense', Colors.red)),
          ],
        ),
      ),
    );

  }

  Map<int, double> getMonthlyTotal(List<TransactionModel> transactions, String type) {
    Map<int, double> monthlyTotals = {};

    for (int month = 1; month <= 12; month++) {
      monthlyTotals[month] = 0.0;
    }

    for (var tx in transactions) {
      if (tx.type == type) {
        monthlyTotals[tx.date.month] = (monthlyTotals[tx.date.month] ?? 0) + tx.amount;
      }
    }

    print(monthlyTotals);
    return monthlyTotals;
  }

}
