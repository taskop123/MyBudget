import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';
import 'package:my_budget_application/model/line_chart_data.dart';
import 'package:my_budget_application/widget/visualizations/line_titles.dart';

/// Defines the line chart widget for displaying the expenses for a given month.
class LineChartWidget extends StatefulWidget {
  /// Defines the expenses for the current user.
  final List<Expense> expenses;
  /// Defines the spots on the line chart that is going to be drawn.
  late final List<FlSpot> _spots;

  /// Creates new line chart widget for the given expenses.
  LineChartWidget(this.expenses, {Key? key}) : super(key: key) {
    _spots = CustomLineChartData(expenses: expenses).getDotData();
  }

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

/// Defines the state of the line chart widget.
class _LineChartWidgetState extends State<LineChartWidget> {
  /// Defines the gradient colors used to visualize the line chart.
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          minX: 1,
          maxX: 12,
          minY: 0,
          maxY: 6,
          titlesData: LineTitles().getTitleData(),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: widget._spots,
              isCurved: false,
              gradient: LinearGradient(colors: gradientColors),
              barWidth: 5,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                    colors: gradientColors
                        .map((color) => color.withOpacity(0.3))
                        .toList()),
              ),
            ),
          ],
        ),
      );
}
