import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../util/constants.dart';

/// Defines the line titles that are used on the x and the y axis
/// on the line chart screen.
class LineTitles {
  /// Defines the widgets on the bottom of the line chart
  /// given the [value] and title [meta]. These widgets
  /// are only text fields representing each month of the year.
  ///
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    String text = Constants.blankString;
    switch (value.toInt()) {
      case 3:
        text = Constants.marchGraphPlaceholder;
        break;
      case 6:
        text = Constants.juneGraphPlaceholder;
        break;
      case 9:
        text = Constants.septemberGraphPlaceholder;
        break;
    }
    return Padding(
      child: Text(text, style: style),
      padding: const EdgeInsets.only(top: 4),
    );
  }

  /// Defines the widgets on the left side of the line chart,
  /// given the [value] and title [meta]. These widgets are
  /// only text fields representing the expense cost.
  ///
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text = Constants.blankString;

    var decimalValue = value.toString().split(".")[1];
    if (decimalValue != "0") {
      return Padding(
        child: Text(text, style: style),
        padding: const EdgeInsets.only(top: 4),
      );
    }

    switch (value.toInt()) {
      case 0:
        text = Constants.zeroThousandGraphPlaceholder;
        break;
      case 1:
        text = Constants.oneThousandGraphPlaceholder;
        break;
      case 2:
        text = Constants.twoThousandGraphPlaceholder;
        break;
      case 3:
        text = Constants.threeThousandGraphPlaceholder;
        break;
      case 4:
        text = Constants.fourThousandGraphPlaceholder;
        break;
      case 5:
        text = Constants.fiveThousandGraphPlaceholder;
        break;
      case 6:
        text = Constants.sixPlusThousandGraphPlaceholder;
        break;
    }
    return Padding(
      child: Text(text, style: style),
      padding: const EdgeInsets.only(top: 4),
    );
  }

  /// Defines the widgets on the right of the line chart,
  /// given the [value] and title [meta].
  ///
  Widget rightTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    return const Padding(
      child: Text("", style: style),
      padding: EdgeInsets.only(top: 4),
    );
  }

  /// Defines the widgets on the top side of the line chart,
  /// given the [value] and title [meta].
  ///
  Widget topTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    return const Padding(
      child: Text("", style: style),
      padding: EdgeInsets.only(top: 4),
    );
  }

  /// Defines the data displayed on the bottom, the top, the left and
  /// the right side of the line chart.
  ///
  getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTitlesWidget: leftTitleWidgets,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 35,
            getTitlesWidget: rightTitleWidgets,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 35,
            getTitlesWidget: topTitleWidgets,
          ),
        ),
      );
}
