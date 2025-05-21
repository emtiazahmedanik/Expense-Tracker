import 'package:expense_tracker/utils/app_color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  child: ListView.builder(
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('2/05/25'), Text('400')],
                          ),
                        ),
                      );
                    },
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
              'January',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
        Text('৳ 2000', style: TextStyle(color: Colors.white, fontSize: 30)),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('৳ 2000', style: TextStyle(color: Colors.white, fontSize: 20)),
            Text('৳ 2000', style: TextStyle(color: Colors.white, fontSize: 20)),
          ],
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            DropdownButton(
              value: 1,
                iconDisabledColor: AppColor.balanceColor,
                iconEnabledColor: AppColor.balanceColor,
                elevation: 14,
                items: [
                  DropdownMenuItem(
                    value: 1,
                    child: Text(
                      "Income",
                      style: TextStyle(color: AppColor.backgroundColor),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text(
                      "Expense",
                      style: TextStyle(color: AppColor.backgroundColor),
                    ),
                  ),
                ],
                onChanged: (value){}
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('Cancel',style: TextStyle(color: Colors.red),)
          ),
          TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('Done')
          ),
        ],
      );
    });
  }

}
