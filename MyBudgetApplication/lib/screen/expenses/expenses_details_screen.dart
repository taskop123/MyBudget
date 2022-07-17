import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    final expense = ModalRoute.of(context)?.settings.arguments as Expense;
    _selectedExpense = expense;

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
                        const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 0, 0, 1.0)),
                      ),
                    ],
                  ),
                ),
                if (_selectedExpense!.expenseAddress != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                    child: InfoText(
                        _selectedExpense!.expenseAddress.toString(),
                        const TextStyle(
                            fontSize: 20, color: Color.fromRGBO(0, 0, 0, 1.0))),
                  ),
                InfoText(
                    _selectedExpense!.dateAndTime.toString(),
                    const TextStyle(
                        fontSize: 19, color: Color.fromRGBO(0, 0, 0, 1.0))),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: InfoText(
                      'Category: ' +
                          _selectedExpense!.expenseCategory.toString(),
                      const TextStyle(
                          fontSize: 24, color: Color.fromRGBO(0, 0, 0, 1.0))),
                ),
                if (_selectedExpense!.expenseNotes != null)
                  Padding(padding: const EdgeInsets.fromLTRB(7, 0, 7, 0), child: InfoText(
                    _selectedExpense!.expenseNotes.toString(),
                    const TextStyle(
                        fontSize: 15, color: Color.fromRGBO(0, 0, 0, 1.0)),
                  ),),

              ]),
        ),
      ),
    );
  }
}
