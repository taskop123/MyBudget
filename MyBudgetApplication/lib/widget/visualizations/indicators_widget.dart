import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_budget_application/model/pie_data.dart';

/// Defines the indicator widget for describing the data
/// displayed on the pie chart screen.
class IndicatorsWidget extends StatelessWidget {
  /// Defines the pie chart data.
  final List<Data> _data;

  /// Creates new indicators widget with the given data.
  const IndicatorsWidget(this._data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _data
          .map(
            (e) => Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: buildIndicator(
                color: e.color,
                text: e.name,
              ),
            ),
          )
          .toList(),
    );
  }

  /// Creates indicator widget for displaying the data in the pie chart.
  Widget buildIndicator(
      {required Color color,
      required String text,
      bool isSquare = false,
      double size = 16}) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
