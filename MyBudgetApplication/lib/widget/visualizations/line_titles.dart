import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    String text = "";
    switch (value.toInt()) {
      case 3:
        text = 'Mar';
        break;

      case 6:
        text = 'Jun';
        break;

      case 9:
        text = 'Sep';
        break;
    }

    return Padding(
      child: Text(text, style: style),
      padding: const EdgeInsets.only(top: 4),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text = "";

    var decimalValue = value.toString().split(".")[1];
    if (decimalValue != "0") {
      return Padding(
        child: Text(text, style: style),
        padding: const EdgeInsets.only(top: 4),
      );
    }

    switch (value.toInt()) {
      case 0:
        text = '0k';
        break;
      case 1:
        text = '1k';
        break;
      case 2:
        text = '2k';
        break;
      case 3:
        text = '3k';
        break;
      case 4:
        text = '4k';
        break;
      case 5:
        text = '5k';
        break;
      case 6:
        text = '6k+';
        break;
    }
    return Padding(
      child: Text(text, style: style),
      padding: const EdgeInsets.only(top: 4),
    );
  }

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
