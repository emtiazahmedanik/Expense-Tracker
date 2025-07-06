import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget buildBarChart(Map<int, double> data, String label, Color color) {
  return BarChart(
    BarChartData(
      barTouchData: BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          tooltipPadding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              '${rod.toY.toStringAsFixed(0)}',
              const TextStyle(color: Colors.white),
            );
          },
        ),
      ),

      borderData: FlBorderData(show: true),
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              const monthNames = ["", "Jan", "Feb", "Mar", "Apr", "May", "Jun",
                "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
              return Text(monthNames[value.toInt()],style: TextStyle(fontSize: 8),);
            },
          ),
        ),
        leftTitles: AxisTitles(
          axisNameSize: 7,
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      barGroups: data.entries.map((e) {
        return BarChartGroupData(
          x: e.key,
          barRods: [
            BarChartRodData(
              toY: e.value,
              color: color,
              width: 14,
              borderRadius: BorderRadius.circular(1),
            ),

          ],
        );
      }).toList(),
    ),
  );
}
