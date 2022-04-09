import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_budget_application/screen/camera/camera_screen.dart';
import 'package:my_budget_application/service/firebase/expenses_repository.dart';
import 'package:my_budget_application/util/constants.dart';
import 'package:my_budget_application/util/location_utils.dart';
import 'package:my_budget_application/widget/expense/form/expense_form_category_dropdown.dart';
import 'package:my_budget_application/widget/expense/form/expense_form_date_time.dart';
import 'package:my_budget_application/widget/expense/form/expense_form_notes.dart';
import 'package:my_budget_application/widget/form/button_form_field.dart';
import 'package:provider/provider.dart';

import '../../model/expense.dart';
import '../../widget/expense/form/expense_form_currency_formatter.dart';
import '../../widget/expense/form/expense_form_location.dart';

class ExpenseAddScreen extends StatefulWidget {
  static const routeName = Constants.expensesAddRoute;

  const ExpenseAddScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExpenseAddScreenState();
}

class _ExpenseAddScreenState extends State<ExpenseAddScreen> {
  late CurrencyTextInputFormatter formatter;

  String _expenseNotes = Constants.blankString;
  String? _price = Constants.zero;
  LatLng? _locationController;
  String? _expenseAddress;
  String? _expenseCategory;
  DateTime _dateAndTime = DateTime.now();
  final _format = Constants.mainDateFormat;

  late BuildContext _buildContext;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late User _currentUser;

  void _setExpenseNotesFunction(value) {
    setState(() {
      _expenseNotes = value;
    });
  }

  void _setExpenseCategory(value) {
    setState(() {
      _expenseCategory = value;
    });
  }

  void _setDateTimeFunction(value) {
    setState(() {
      _dateAndTime = value as DateTime;
    });
  }

  void _changePrice(newPrice) {
    setState(() {
      _price = newPrice;
    });
  }

  void _validateLocation(LatLng? location) {
    setState(() {
      if (location != null) {
        _locationController = location;
        _getLocationAddress();
      }
    });
  }

  void changeExpensesCategory(value) {
    setState(() {
      _expenseCategory = value;
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

  void takePhoto() {
    Navigator.of(context).pushNamed(CameraScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    _currentUser = context.watch<User?>()!;
    Locale locale = Localizations.localeOf(context);
    formatter = CurrencyTextInputFormatter(locale: locale.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.newExpensePlaceholder),
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
              ExpenseFormCurrencyFormatter(_changePrice, formatter),
              ExpenseFormDateTime(_format, _setDateTimeFunction),
              ExpenseFormNotes(_setExpenseNotesFunction),
              ExpenseFormCategoryDropdown(
                  _setExpenseCategory, _expenseCategory),
              ExpenseFormLocation(_validateLocation, _expenseAddress,
                  _locationController, _buildContext),
              FloatingActionButton(
                onPressed: () {
                  takePhoto();
                },
                child: const Icon(Icons.camera_alt),
                backgroundColor: Theme.of(_buildContext).primaryColorDark,
              ),
              ButtonFormField(
                const EdgeInsets.all(24),
                _createNewExpense,
                Constants.submitButtonPlaceholder,
                Theme.of(_buildContext).primaryColorDark,
                Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createNewExpense() {
    String userId = _currentUser.uid;

    _expenseCategory ??= Constants.unknownPlaceholder;
    Expense newExpense = Expense(
      Constants.getRandomString(10),
      userId,
      _price,
      _locationController?.latitude,
      _locationController?.longitude,
      _expenseAddress,
      _expenseCategory,
      _dateAndTime,
      _expenseNotes,
    );

    ExpenseRepository.addExpense(newExpense);
    Navigator.of(_buildContext).pop();
  }
}
