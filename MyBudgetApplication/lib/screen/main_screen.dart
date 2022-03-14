import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../service/notification_service.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/home';

  final Function()? _logoutFunction;

  const MainScreen(this._logoutFunction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationService.init();

    return Container();
  }
}
