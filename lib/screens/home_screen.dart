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
        child: Stack(
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
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                  child: Column(
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
                      Text(
                        '৳ 2000',
                        style: TextStyle(color: Colors.white, fontSize: 30),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '৳ 2000',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            '৳ 2000',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Icon(Icons.add),
        shape: const CircleBorder(),
        foregroundColor: Colors.white,
        backgroundColor: AppColor.floatingButtonColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
