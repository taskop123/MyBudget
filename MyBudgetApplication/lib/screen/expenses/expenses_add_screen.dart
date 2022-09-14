import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_budget_application/service/firebase/expenses_repository.dart';
import 'package:my_budget_application/util/constants.dart';
import 'package:my_budget_application/util/location_utils.dart';
import 'package:my_budget_application/widget/expense/form/expense_form_category_dropdown.dart';
import 'package:my_budget_application/widget/expense/form/expense_form_date_time.dart';
import 'package:my_budget_application/widget/expense/form/expense_form_notes.dart';
import 'package:my_budget_application/widget/form/button_form_field.dart';
import 'package:provider/provider.dart';

import '../../model/expense.dart';
import '../../widget/custom_snack_bar.dart';
import '../../widget/expense/form/expense_form_currency_formatter.dart';
import '../../widget/expense/form/expense_form_location.dart';

/// Defines the screen of adding a new expense.
class ExpenseAddScreen extends StatefulWidget {
  /// The route name of the add/edit expense screen.
  static const routeName = Constants.expensesAddRoute;

  /// Creates new add/edit expense screen.
  const ExpenseAddScreen({Key? key}) : super(key: key);

  /// Creates the state object for the [ExpenseAddScreen].
  @override
  State<StatefulWidget> createState() => _ExpenseAddScreenState();
}

/// State class used to display the adding/editing of a new/existing expense screen.
class _ExpenseAddScreenState extends State<ExpenseAddScreen> {
  /// The expense which is to be edited,
  /// if the user has entered the edit mode of the screen.
  Expense? _expenseToEdit;

  /// Handles the formatting of the price input field.
  late CurrencyTextInputFormatter _formatter;

  /// The notes assigned to the new expense.
  String _expenseNotes = Constants.blankString;

  /// The price assigned to the new expense.
  String? _price = Constants.zero;

  /// The location controller which handles the user interaction with the map.
  LatLng? _locationController;

  /// The address of the selected location by the user.
  String? _expenseAddress;

  /// The category of the new expense.
  String? _expenseCategory;

  /// The date and time when the expense happened.
  DateTime? _dateAndTime;

  /// The date and time formatter which formats the date and time in a better form.
  final _format = Constants.mainDateFormat;

  /// The build context of the widget.
  late BuildContext _buildContext;

  /// The global key used in the form to identify the form.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// The current logged in user.
  late User _currentUser;

  /// This method handles the change of the [_expenseNotes] input field.
  ///
  /// It sets the new [value] of the [_expenseNotes].
  void _setExpenseNotesFunction(value) {
    setState(() {
      _expenseNotes = value;
    });
  }

  /// This method handles the change of the [_expenseCategory] drop down list field.
  ///
  /// It sets the new [value] of the [_expenseCategory].
  void _setExpenseCategory(value) {
    setState(() {
      _expenseCategory = value;
    });
  }

  /// This method handles the change of the [_dateAndTime] input field.
  ///
  /// It sets the new [value] of the [_dateAndTime].
  void _setDateTimeFunction(value) {
    if (value != null) {
      setState(() {
        _dateAndTime = value as DateTime;
      });
    }
  }

  /// This method handles the change of the [_price] input field.
  ///
  /// It sets the new [newPrice] of the [_price].
  void _changePrice(newPrice) {
    setState(() {
      _price = newPrice;
    });
  }

  /// This method handles the change of the [_locationController] field.
  ///
  /// It sets the new [location] of the [_locationController].
  void _validateLocation(LatLng? location) {
    setState(() {
      if (location != null) {
        _locationController = location;
        _getLocationAddress();
      }
    });
  }

  /// This method handles the change of the user picked location from the location picker dialog.
  ///
  /// It sets the newly selected location of the [_expenseAddress].
  Future<void> _getLocationAddress() async {
    Address address =
        await LocationUtils.getLocationAddress(_locationController!);
    setState(() {
      _expenseAddress =
          '${address.streetAddress}, ${address.city} (${address.countryCode})';
    });
  }

  /// This method is called whenever a new expense is created.
  ///
  /// It creates new expense with the corresponding user input
  /// and navigates back to the main screen where
  /// the user can see the newly added expense.
  void _createNewExpense() {
    String userId = _currentUser.uid;

    if (_checkExpenseValidity()) {
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

  /// This method checks whether the expense is valid or not,
  /// based on the price category and date/time which was input.
  ///
  bool _checkExpenseValidity() {
    bool validity =
        _price != null && _expenseCategory != null && _dateAndTime != null;
    if (!validity) {
      ScaffoldMessenger.of(context).showSnackBar(
          const CustomSnackBar(Constants.snackBarValidityPlaceholder).build());
    }
    return validity;
  }

  /// This method updates the specific expense which is to be edited.
  ///
  /// It updates all the details and information about the expense
  /// which were edited and pushes them to the firebase database.
  /// After the successful operation,
  /// the user is being redirected to the home screen.
  void _editExpense() {
    if (_checkExpenseValidity()) {
      _expenseToEdit!.price = _price;
      _expenseToEdit!.latitude = _locationController?.latitude;
      _expenseToEdit!.longitude = _locationController?.longitude;
      _expenseToEdit!.expenseAddress = _expenseAddress;
      _expenseToEdit!.expenseCategory = _expenseCategory;
      _expenseToEdit!.dateAndTime = _dateAndTime;
      _expenseToEdit!.expenseNotes = _expenseNotes;

      ExpenseRepository.editExpense(_expenseToEdit!);
      Navigator.of(_buildContext).pop();
    }
  }

  /// This method is called on screen creation for setting the expense values.
  ///
  /// The initial values of the expense field inputs are inserted,
  /// when the user has entered the screen in edit mode.
  void _setExpenseValues() {
    Expense? expenseToEdit =
        ModalRoute.of(context)!.settings.arguments as Expense?;
    _expenseToEdit = expenseToEdit;

    if (_expenseToEdit != null) {
      _setDateTimeFunction(_expenseToEdit!.dateAndTime);
      _setExpenseCategory(_expenseToEdit!.expenseCategory);
      _setExpenseNotesFunction(_expenseToEdit!.expenseNotes);
      _changePrice(_expenseToEdit!.price);
      if (_expenseToEdit!.latitude != null &&
          _expenseToEdit!.longitude != null) {
        _validateLocation(
            LatLng(_expenseToEdit!.latitude!, _expenseToEdit!.longitude!));
      }
    }
  }

  /// Builds the UI elements for the addition of a new expense form screen,
  /// including the [appBar] and [body] with a [context],
  /// with the adequate form elements.
  ///
  @override
  Widget build(BuildContext context) {
    if (_expenseToEdit == null &&
        ModalRoute.of(context)!.settings.arguments != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _setExpenseValues());
    }

    _buildContext = context;
    _currentUser = context.watch<User?>()!;
    Locale locale = Localizations.localeOf(context);
    _formatter = CurrencyTextInputFormatter(locale: locale.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.newExpensePlaceholder),
      ),
      body: (ModalRoute.of(context)!.settings.arguments == null ||
              (_price != '0.0' && _dateAndTime != null))
          ? SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ExpenseFormCurrencyFormatter(
                          _changePrice, _formatter, _price),
                      ExpenseFormDateTime(
                          _format, _setDateTimeFunction, _dateAndTime),
                      ExpenseFormNotes(_setExpenseNotesFunction, _expenseNotes),
                      ExpenseFormCategoryDropdown(
                          _setExpenseCategory, _expenseCategory),
                      ExpenseFormLocation(_validateLocation, _expenseAddress,
                          _locationController, _buildContext),
                      ButtonFormField(
                          const EdgeInsets.all(23),
                          (_expenseToEdit != null)
                              ? _editExpense
                              : _createNewExpense,
                          Constants.submitButtonPlaceholder,
                          null,
                          null),
                    ],
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
