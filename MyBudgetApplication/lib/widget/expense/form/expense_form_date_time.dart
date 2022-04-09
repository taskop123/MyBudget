import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../util/constants.dart';

class ExpenseFormDateTime extends StatelessWidget {
  final Function(DateTime?) _setDateTimeFunction;
  final DateFormat _format;

  const ExpenseFormDateTime(this._format, this._setDateTimeFunction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateTimeField(
          decoration: const InputDecoration(labelText: Constants.dateTimePlaceholder),
          format: _format,
          onShowPicker: (context, currentValue) async {
            final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime:
                TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              return DateTimeField.combine(date, time);
            } else {
              return currentValue;
            }
          },
          onChanged: (val) => _setDateTimeFunction(val),
          validator: (val) {
            if (val == DateTime.now()) {
              return ;
            }
            return null;
          },
          onSaved: (val) => _setDateTimeFunction(val),
        ),
      ],
    );
  }
}