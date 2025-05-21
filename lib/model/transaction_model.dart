import 'package:hive/hive.dart';

part 'transaction_model.g.dart'; // This is needed for code generation

@HiveType(typeId: 0)
class TransactionModel {
  @HiveField(0)
  final String type; // 'income' or 'expense'

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final String? note;

  TransactionModel({
    required this.type,
    required this.amount,
    required this.date,
    this.note,
  }); // Optional
}
