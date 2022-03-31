import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_budget_application/model/pie_data.dart';

class IndicatorsWidget extends StatelessWidget {
  final List<Data> _data;

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

  Widget buildIndicator({
    required Color color,
    required String text,
    bool isSquare = false,
    double size = 16,
    Color textColor = const Color(0xff505050),
  }) {
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
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        )
      ],
    );
  }
}
