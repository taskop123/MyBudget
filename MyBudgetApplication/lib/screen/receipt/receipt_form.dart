import 'dart:convert';
import 'dart:core';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:my_budget_application/service/firebase/expenses_repository.dart';
import 'package:my_budget_application/widget/receipt/form/receipt_form_currency_formatter.dart';
import 'package:my_budget_application/widget/receipt/form/receipt_form_text_field.dart';
import 'package:provider/provider.dart';

import '../../model/expense.dart';
import '../../util/constants.dart';
import '../../widget/custom_snack_bar.dart';
import '../../widget/expense/form/expense_form_category_dropdown.dart';
import '../../widget/form/button_form_field.dart';

/// Defines the screen of adding new Expense from a receipt.
class ReceiptFormScreen extends StatefulWidget {
  /// The root name of the screen.
  static const routeName = Constants.receiptAddRoute;

  /// The text that has been extracted using the [FlutterTesseractOcr] object.
  String extractedText;

  /// Creates an [ReceiptFormScreen] widget with the [extractedText] as an
  /// required parameter.
  ReceiptFormScreen({Key? key, required this.extractedText}) : super(key: key);

  /// Creates the state of the widget.
  @override
  State<StatefulWidget> createState() => _ReceiptFormScreenState();
}

/// The state class of the [ReceiptFormScreen] widget.
class _ReceiptFormScreenState extends State<ReceiptFormScreen> {

  /// The form key used to identify the form.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Currency text formatter for the MKD currency.
  late CurrencyTextInputFormatter _formatterMKD;

  /// Currency text formatter for the USD currency.
  late CurrencyTextInputFormatter _formatterUSD;

  /// The locale settings which are gathered from the user's phone
  late Locale locale;

  /// The text editing controller for editing the contents of the input field.
  late TextEditingController _controller;

  /// The current widget [BuildContext] for later use.
  late BuildContext _buildContext;

  /// The total price paid by the user which is extracted from the receipt.
  late String _totalPrice;

  /// Map object which contains the [_storeAddress] and [_companyName] values,
  /// which are extracted from the receipt
  late Map<String, String> _map;

  /// The company name extracted using the [FlutterTesseractOcr] object from
  /// the receipt image
  late String _companyName;

  /// The store address extracted using the [FlutterTesseractOcr] object from
  /// the receipt image
  late String _storeAddress;

  /// The category of the receipt expense which has 'Groceries' as default
  /// category
  String? _expenseCategory = 'Groceries';

  /// The current logged in user.
  late User _currentUser;

  /// Method which is called at the beginning of the widget which initialized
  /// some of the variables used in the form.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _totalPrice = getTotalPriceFromReceipt(widget.extractedText);
    _controller = TextEditingController(text: double.parse(_totalPrice) / 60.69 <= 0
        ? "0.0"
        : "USD" +
        (double.parse(_totalPrice) /
            60.69)
            .toStringAsFixed(2));
    _map = getAddressFromReceipt(widget.extractedText);

    _companyName = _map["CompanyName"].toString();
    _storeAddress = _map["StoreAddress"].toString();
  }

  /// Method which sets the new state of the [_expenseCategory] variable.
  void _setExpenseCategory(value) {
    setState(() {
      _expenseCategory = value;
    });
  }

  /// Method which sets the new state of the [_companyName] variable.
  void _setCompanyName(value) {
    setState(() {
      _companyName = value;
    });
  }

  /// Method which sets the new state of the [_storeAddress] variable.
  void _setStoreAddress(value) {
    setState(() {
      _storeAddress = value;
    });
  }

  /// Method which sets the new state of the [_totalPrice] and the [_controller]
  /// variable which is automatically populated with live conversion from
  /// MKD to USD.
  void _setPriceInMKD(value) {
    setState(() {
      _totalPrice = value;
    });

    String newText =
    double.parse(_totalPrice.substring(3)) / 60.69 <= 0
        ? "0.0"
        : "USD" +
        (double.parse(_totalPrice.substring(3)) /
            60.69)
            .toStringAsFixed(2);
    _controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  /// Method that checks the validity of the form fields.
  bool _checkReceiptValidity() {
    bool validity =
        _totalPrice != "null" && _expenseCategory != null && _companyName != "null" && _storeAddress != "null";
    if (!validity) {
      ScaffoldMessenger.of(context).showSnackBar(
          const CustomSnackBar(Constants.snackBarValidityPlaceholder).build());
    }
    return validity;
  }

  /// The creation of the new expense using the receipt image as input.
  void _createNewExpense() {
    String userId = _currentUser.uid;

    if (_checkReceiptValidity()) {
      _expenseCategory ??= Constants.unknownPlaceholder;
      Expense newExpense = Expense(
        Constants.getRandomString(10),
        userId,
        "USD" + (double.parse(_totalPrice.substring(3)) / 60.69).toStringAsFixed(2),
        null,
        null,
        _storeAddress,
        _expenseCategory,
        DateTime.now(),
        _companyName,
      );

      ExpenseRepository.addExpense(newExpense);
      Navigator.of(_buildContext).popUntil((route) => route.isFirst);
    }
  }

  /// Method which extracts the [_companyName] and [_storeAddress] from
  /// the detected text of the receipt.
  ///
  /// This method finds the [_companyName] and [_storeAddress] of the receipt
  /// from the extracted text using the [FlutterTesseractOcr] object
  /// in the previous screen.
  Map<String, String> getAddressFromReceipt(String _extractedText) {
    Map<String, String> mapping = <String, String>{};
    LineSplitter ls = const LineSplitter();
    List<String> lines = ls.convert(_extractedText);

    for (var i = 0; i < lines.length; i++) {
      String currentLine = lines[i];
      if (currentLine.startsWith("ул.") || currentLine.startsWith("уп.")) {
        if (i - 1 >= 0) {
          mapping["CompanyName"] = lines[i - 1].isNotEmpty ? lines[i - 1] : Constants.blankString;
        }

        if (i + 2 <= lines.length) {
          mapping["StoreAddress"] = lines[i + 2].isNotEmpty ? lines[i + 2] : Constants.blankString;
        }
        return mapping;
      }
    }
    return mapping;
  }

  /// Method which extracts the total price from the detected text of the receipt.
  ///
  /// This method finds the total price of the receipt from the extracted text
  /// using the [FlutterTesseractOcr] object in the previous screen.
  String getTotalPriceFromReceipt(String _extractedText) {
    LineSplitter ls = const LineSplitter();
    List<String> lines = ls.convert(_extractedText);

    for (var i = 0; i < lines.length; i++) {
      String currentLine = lines[i];
      if (currentLine.startsWith("ВКУПЕН ПРОМЕТ") ||
          currentLine.startsWith("ВКУЛЕН ПРОМЕТ") ||
          currentLine.startsWith("ВКУЛЕН ПРМЕТ") ||
          currentLine.startsWith("ВКУЛЕН") ||
          currentLine.startsWith("ВКУПЕН")) {
        var result = Constants.doubleRegex
            .allMatches(currentLine)
            .map((m) => m.group(0));
        String totalPrice = '0.0';

        if (result.length > 1) {
          totalPrice = result.elementAt(0)! + '.' + result.elementAt(1)!;
        } else {
          totalPrice = result.elementAt(0)!;
        }

        return totalPrice;
      }
    }
    return '0.0';
  }

  /// Builds the UI elements for the addition of a new expense form screen,
  /// using the receipt image including the [appBar] and [body],
  /// with the adequate form elements.
  ///
  @override
  Widget build(BuildContext context) {
    locale = Localizations.localeOf(context);
    _formatterMKD = CurrencyTextInputFormatter(
        locale: locale.toString(), customPattern: 'MKD');
    _formatterUSD = CurrencyTextInputFormatter(locale: locale.toString());
    _currentUser = context.watch<User?>()!;
    _buildContext = context;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.newReceiptPlaceholder),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ExpenseFormCategoryDropdown(
                    _setExpenseCategory, _expenseCategory),
                ReceiptFormTextField(
                  _setCompanyName,
                  _companyName,
                  Constants.companyNamePlaceholder
                ),
                ReceiptFormTextField(
                  _setStoreAddress,
                  _storeAddress,
                  Constants.storeAddress
                ),
                ReceiptFormCurrencyField(
                  _setPriceInMKD,
                  Constants.totalPriceInMKDPlaceholder,
                  _totalPrice,
                  null,
                  _formatterMKD
                ),
                ReceiptFormCurrencyField((p0) => null,
                    Constants.totalPriceInUSDPlaceholder,
                    null,
                    _controller,
                    _formatterUSD),
                ButtonFormField(
                    const EdgeInsets.all(23),
                    _createNewExpense,
                    Constants.submitButtonPlaceholder,
                    null,
                    null),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
