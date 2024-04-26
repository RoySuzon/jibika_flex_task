import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:jibika_flex_task/components/dimention_extention.dart';
import 'package:jibika_flex_task/resources/color_pallet.dart';

class CustomePieChart extends StatefulWidget {
  final List<Map<String, dynamic>> dataList;

  const CustomePieChart({super.key, required this.dataList});

  @override
  State<CustomePieChart> createState() => _CustomePieChartState();
}

class _CustomePieChartState extends State<CustomePieChart> {
  // int touchedIndex = -1;
  double findMaxValue(List<Map<String, dynamic>> list) {
    double maxValue = list.isNotEmpty ? double.parse(list.first["count"].toString()) : 0.0;

    for (Map<String, dynamic> item in list) {
      double value = double.parse(item["count"].toString());
      if (value > maxValue) {
        maxValue = value;
      }
    }

    return maxValue;
  }

  double maxCount = 0;
  @override
  void initState() {
    maxCount = findMaxValue(widget.dataList);
    // print(maxCount);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: PieChart(
        PieChartData(
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 0,
          centerSpaceRadius: context.width(30),
          sections: List.generate(
              widget.dataList.length,
              (index) => PieChartSectionData(
                    color: widget.dataList[index]["color"],
                    value: double.parse(widget.dataList[index]["count"].toString()),
                    title: '',
                    radius: widget.dataList[index]["count"] == maxCount ? 30 : 20,
                    titleStyle: const TextStyle(
                      // fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainTextColor1,
                      // shadows: shadows,
                    ),
                  )),
        ),
      ),
    );
  }
}
