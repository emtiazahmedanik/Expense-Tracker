import 'package:expense_tracker/screens/chart_data_screen.dart';
import 'package:expense_tracker/utils/app_color.dart';
import 'package:flutter/material.dart';

class BuildChartButton extends StatelessWidget {
  const BuildChartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColor.balanceColor,
      radius: 16,
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ChartDataScreen()));
        },
        splashColor: Colors.white12,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.bar_chart, color: Colors.white,size: 14,),
        ),
      ),
    );
  }
}