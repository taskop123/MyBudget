import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../util/constants.dart';

/// Defines the Date and Time widget used in the form when adding a new Expense.
class ExpenseFormDateTime extends StatelessWidget {
  /// Callback function called each time the date and time is changed by the user.
  final Function(DateTime?) _setDateTimeFunction;

  /// Defines the format used to format the Date and Time input of the user.
  final DateFormat _format;

  /// The existing date and time value which will be presented in the form.
  final DateTime? _dateAndTime;

  /// Creates the dropdown list widget with the [_format], [_dateAndTime],
  /// and the specified [_setDateTimeFunction].
  const ExpenseFormDateTime(
      this._format, this._setDateTimeFunction, this._dateAndTime,
      {Key? key})
      : super(key: key);

  /// Displays the appropriate date picker,
  /// given the specific [context] and [currentValue].
  ///
  Future<DateTime?> _showDatePicker(
      DateTime? currentValue, BuildContext context) async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        initialDate: currentValue ?? DateTime.now(),
        lastDate: DateTime(2100));
    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
      );
      return DateTimeField.combine(date, time);
    } else {
      return currentValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Column(
          children: [
            DateTimeField(
              initialValue: (_dateAndTime != null) ? _dateAndTime : null,
              decoration: const InputDecoration(
                  labelText: Constants.dateTimePlaceholder),
              format: _format,
              onShowPicker: (context, currentValue) async {
                return _showDatePicker(currentValue, context);
              },
              onChanged: (val) => _setDateTimeFunction(val),
              validator: (val) {
                if (val == DateTime.now()) {
                  return;
                }
                return null;
              },
              onSaved: (val) => _setDateTimeFunction(val),
            ),
          ],
        ));
  }
}
