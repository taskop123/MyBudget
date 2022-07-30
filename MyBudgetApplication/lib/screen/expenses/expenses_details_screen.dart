import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/widget/carousel_image_item.dart';

import '../../model/expense.dart';
import '../../util/constants.dart';
import '../../widget/info_text.dart';

class ExpenseDetailsScreen extends StatefulWidget {
  static const routeName = Constants.expensesDetailsRoute;

  const ExpenseDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseDetailsScreen> createState() => _ExpenseDetailsScreenState();
}

class _ExpenseDetailsScreenState extends State<ExpenseDetailsScreen> {
  Expense? _selectedExpense;
  CustomUser? _currentUser;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as List;
    _selectedExpense = arguments[0] as Expense;
    _currentUser = arguments[1] as CustomUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.detailsTitle),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 65),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(
                    height: 230,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 500),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: const [
                    CarouselImageItem(Constants.carouselItemOneImage),
                    CarouselImageItem(Constants.carouselItemTwoImage),
                    CarouselImageItem(Constants.carouselItemThreeImage),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 35, 0, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InfoText(
                        _selectedExpense!.price.toString(),
                        TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: (_currentUser != null &&
                                    _currentUser!.themeDarkEnabled)
                                ? Colors.white
                                : Colors.black),
                      ),
                    ],
                  ),
                ),
                if (_selectedExpense!.expenseAddress != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                    child: InfoText(_selectedExpense!.expenseAddress.toString(),
                        const TextStyle(fontSize: 20)),
                  ),
                InfoText(
                    _selectedExpense!.dateAndTime.toString(),
                    TextStyle(
                        fontSize: 19,
                        color: (_currentUser != null &&
                                _currentUser!.themeDarkEnabled)
                            ? Colors.white
                            : Colors.black)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: InfoText(
                      'Category: ' +
                          _selectedExpense!.expenseCategory.toString(),
                      TextStyle(
                          fontSize: 24,
                          color: (_currentUser != null &&
                                  _currentUser!.themeDarkEnabled)
                              ? Colors.white
                              : Colors.black)),
                ),
                if (_selectedExpense!.expenseNotes != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                    child: InfoText(
                      _selectedExpense!.expenseNotes.toString(),
                      TextStyle(
                          fontSize: 15,
                          color: (_currentUser != null &&
                                  _currentUser!.themeDarkEnabled)
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
              ]),
        ),
      ),
    );
  }
}
