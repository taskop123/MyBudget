import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/util/location_utils.dart';
import 'package:my_budget_application/widget/form/button_form_field.dart';
import 'package:my_budget_application/util/constants.dart';
import 'package:my_budget_application/widget/map/map_dialog.dart';
import 'package:my_budget_application/service/database_service.dart';

import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExpensesScreen extends StatefulWidget {
  static const routeName = '/expensesScreen';

  const ExpensesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter();

  String _expenseNotes = "";
  String? _price = "0.0";
  LatLng? _locationController;
  String? _expenseAddress;
  var _expenseCategory = null;
  DateTime _dateAndTime = DateTime.now();
  final _format = DateFormat("yyyy-MM-dd HH:mm");

  late BuildContext _buildContext;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late User _currentUser;

  Widget _buildNotes() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Notes'),
      onChanged: (val) {
        _expenseNotes = val;
      },
      onSaved: (val) {
        _expenseNotes = val!;
      },
    );
  }

  Widget _buildDateAndTime() {
    return Column(
      children: [
        DateTimeField(
          decoration: const InputDecoration(labelText: 'Date and Time'),
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
          onChanged: (val) => setState(() {
            _dateAndTime = DateTime.now();
          }),
          validator: (val) {
            if (val == DateTime.now()) {
              return 'Date and time field is Required';
            }
          },
          onSaved: (val) {
            _dateAndTime = val as DateTime;
          },
        ),
      ],
    );
  }

  Widget _buildDropDownList() {
    return DropdownButton<String>(
      isExpanded: true,
      value: _expenseCategory,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      onChanged: (String? newValue) {
        setState(() {
          _expenseCategory = newValue!;
        });
      },
      items: Constants.categories.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      hint: const Text("Choose category"),
    );
  }

  Widget _buildCurrencyFormatter() {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Enter price in \$',
      ),
      onChanged: (val) => _changePrice(val),
      inputFormatters: <TextInputFormatter>[
        formatter,
      ],
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildChooseLocation() {
    return ButtonFormField(
      const EdgeInsets.fromLTRB(0, 0, 0, 45),
      _chooseLocation,
      (_locationController == null || _expenseAddress == null)
          ? "Select Location"
          : _expenseAddress!,
      Theme.of(_buildContext).primaryColorDark,
      Colors.white,
    );
  }

  void _changePrice(newPrice) {
    setState(() {
      _price = newPrice;
    });
  }

  void _chooseLocation() {
    showDialog(
      context: _buildContext,
      builder: (context) {
        return MapDialog(_validateLocation);
      },
    );
  }

  void _validateLocation(LatLng? location) {
    setState(() {
      if (location != null) {
        _locationController = location;
        _getLocationAddress();
      }
    });
  }

  Future<void> _getLocationAddress() async {
    Address address =
        await LocationUtils.getLocationAddress(_locationController!);
    setState(() {
      _expenseAddress =
          '${address.streetAddress}, ${address.city} (${address.countryCode})';
    });
  }

  void changeExpensesCategory(value) {
    setState(() {
      _expenseCategory = value;
    });
  }

  void _createNewExpense() {
    Expense newExpense = Expense(
      Constants.getRandomString(10),
      _price,
      _locationController?.latitude,
      _locationController?.longitude,
      _expenseAddress,
      _expenseCategory,
      _dateAndTime,
      _expenseNotes,
    );
    RealtimeDatabaseService.addNewExpenseToUser(_currentUser.uid, newExpense);

    Navigator.of(_buildContext).pop();
  }

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    _currentUser = context.watch<User?>()!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("New expense"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(24),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildCurrencyFormatter(),
              _buildDateAndTime(),
              _buildNotes(),
              _buildDropDownList(),
              _buildChooseLocation(),
              RaisedButton(
                onPressed: _createNewExpense,
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Theme.of(context).primaryColorDark, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}