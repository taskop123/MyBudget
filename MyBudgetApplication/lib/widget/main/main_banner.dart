import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';
import 'package:my_budget_application/widget/main/main_spent_banner.dart';

import '../../util/constants.dart';
import '../image_banner.dart';

class MainBanner extends StatelessWidget {
  final List<Expense> _expenses;

  const MainBanner(this._expenses, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      color: Theme.of(context).colorScheme.primary,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const ImageBanner(Constants.logoUrl),
          MainSpentBanner(_expenses),
        ],
      ),
    );
  }
}
