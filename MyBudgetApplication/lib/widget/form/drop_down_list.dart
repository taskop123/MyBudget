import 'package:flutter/material.dart';
import 'package:my_budget_application/util/constants.dart';

/// Defines the custom drop down list for selecting the category of a given expense,
/// when new expense is added.
class CustomDropDownList extends StatefulWidget {
  /// Creates new custom drop down list widget.
  const CustomDropDownList({Key? key}) : super(key: key);

  /// Creates the state object for the dropdown menu.
  @override
  State<StatefulWidget> createState() => _CustomDropDownListState();
}

/// Defines the state of the custom drop down list widget.
class _CustomDropDownListState extends State<CustomDropDownList> {
  /// Defines the current category that is selected.
  late String expensesCategory;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: expensesCategory,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          expensesCategory = newValue!;
        });
      },
      items: Constants.categories.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );
  }
}
