import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/pie_data.dart';

List<PieChartSectionData> getSections(List<Data> data) {
  return data
      .asMap()
      .map<int, PieChartSectionData>((index, data) {
        final value = PieChartSectionData(
          color: data.color,
          value: data.percent,
          title: '${data.percent.toStringAsFixed(2)}% ',
          radius: 100,
          titleStyle: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
        return MapEntry(index, value);
      })
      .values
      .toList();
}