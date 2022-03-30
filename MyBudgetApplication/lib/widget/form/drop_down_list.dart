import 'package:flutter/material.dart';

class CustomDropDownList extends StatefulWidget {
  final Function()? _onClicked;

  const CustomDropDownList(this._onClicked, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  
  late String expensesCategory;
  List<String> categories = [
    'Food',
    'Clothing',
    'Fruits',
    'Shopping',
    'Transportation',
    'Home',
    'Shopping',
    'Travel',
    'Wine',
    'Bills',
    'Gift',
    'Education',
    'Vegetables',
    'Snacks',
    'Telephone',
    'Baby',
    'Sport',
    'Tax',
    'Electronics',
    'Health',
    'Entertainment',
    'Car',
    'Social',
    'Insurance',
    'Office',
    'Book',
    'Cigarette',
    'Pet',
    'Beauty'
  ];

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
      items: categories.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );
  }
}
