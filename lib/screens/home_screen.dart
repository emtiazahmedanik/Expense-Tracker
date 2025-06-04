import 'package:expense_tracker/controller/database_controller.dart';
import 'package:expense_tracker/controller/dialog_controller.dart';
import 'package:expense_tracker/controller/transaction_filtering_controller.dart';
import 'package:expense_tracker/model/transaction_model.dart';
import 'package:expense_tracker/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _dialogController = Get.find<DialogController>();
  final _databaseController = Get.find<DatabaseController>();
  final _transactionFilteringController = Get.find<TransactionFilteringController>();

  final TextEditingController _amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String type = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;


    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 287,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: AppColor.backgroundColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(22.0),
                      bottomRight: Radius.circular(22.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Good afternoon',
                          style: TextStyle(color: Colors.white),
                        ),
                        const Text(
                          'Emtiaz ahmed',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -50,
                  child: Container(
                    height: 200,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: AppColor.balanceColor,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.backgroundColor,
                          offset: const Offset(1.0, 1.0),
                          blurRadius: 18.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 5.0,
                      ),
                      child: buildBalanceCard(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Text(
                'History',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 62.0),
                child: SizedBox(
                  child: GetBuilder<DatabaseController>(
                    builder: (context) {
                      final List<TransactionModel> transactions = _databaseController.history();
                      return ListView.builder(
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          TransactionModel model = transactions[index];
                          type = model.type;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(DateFormat('MMMM d').format(model.date)),
                                  Text('${addPlusMinus()}${model.amount.toStringAsFixed(0)}',style: historyStyle(),)
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _dialog(context),
        label: const Icon(Icons.add),
        shape: const CircleBorder(),
        foregroundColor: Colors.white,
        backgroundColor: AppColor.floatingButtonColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Column buildBalanceCard() {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total Balance',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              DateFormat('MMMM d').format(_dialogController.getDate),
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
        GetBuilder<TransactionFilteringController>(
          builder: (context) {
            return Text('৳ ${_transactionFilteringController.getBalance}', style: TextStyle(color: Colors.white, fontSize: 30));
          }
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_circle_down_sharp,
                  size: 18,
                  color: AppColor.iconBackgroundColor,
                ),
                Text(
                  'Income',
                  style: TextStyle(
                    color: AppColor.iconBackgroundColor,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.arrow_circle_up_sharp,
                  size: 18,
                  color: AppColor.iconBackgroundColor,
                ),
                Text(
                  'Expenses',
                  style: TextStyle(
                    color: AppColor.iconBackgroundColor,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
        GetBuilder<TransactionFilteringController>(
          builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('৳ ${_transactionFilteringController.getIncome}', style: TextStyle(color: Colors.white, fontSize: 20)),
                Text('৳ ${_transactionFilteringController.getExpense}', style: TextStyle(color: Colors.white, fontSize: 20)),
              ],
            );
          }
        ),
      ],
    );
  }
  
  void _dialog(BuildContext ctx){
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
      return AlertDialog(
        title: GetBuilder<DialogController>(
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 10,
              children: [
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    controller: _amountController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(onPressed:()=> _dialogController.selectDate(ctx), icon: Icon(Icons.date_range_rounded))
                    ),
                    validator: (value){
                      if(value==null || value.isEmpty){
                        return 'Enter amount';
                      }
                      return null;
                    },
                  ),
                ),
                Text(DateFormat('MMMM d').format(_dialogController.getDate),style: TextStyle(fontSize: 12),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(24.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Row(
                          children: [
                            Radio(
                                value: 'income',
                                groupValue: _dialogController.getRadioValue,
                                onChanged: (value){
                                  _dialogController.setRadioValue = value;
                                }
                            ),
                            Text('Income',style: TextStyle(fontSize: 12),)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 110,
                      decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(24.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio(
                                value: 'expense',
                                groupValue: _dialogController.getRadioValue,
                                onChanged: (value){
                                  _dialogController.setRadioValue = value;
                                }
                            ),
                            Text('Expense',style: TextStyle(fontSize: 12))
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            );
          }
        ),
        actions: [
          TextButton(
              onPressed: (){
                _amountController.clear();
                _dialogController.setDate();
                Navigator.pop(context);
              },
              child: Text('Cancel',style: TextStyle(color: Colors.red),)
          ),
          TextButton(
              onPressed: (){
                _onTapDone();
              },
              child: Text('Done')
          ),
        ],
      );
    });
  }

  void _onTapDone(){
    if(_formKey.currentState!.validate()){
      double amount = double.parse(_amountController.text.trim());
      String type = _dialogController.getRadioValue;
      DateTime date = _dialogController.getDate;
      _databaseController.addTransaction(type, amount, date);
      _dialogController.setDate();
    }
    _amountController.clear();
    _transactionFilteringController.updateAll();
    Navigator.pop(context);
  }

  TextStyle historyStyle(){
    return type=='income'
        ?TextStyle(color: Colors.green)
        :TextStyle(color: Colors.red);
  }
  String addPlusMinus(){
    return type=='income'
        ?'+'
        :'-';
  }

}
