import 'package:flutter/material.dart';

import '../../util/constants.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white60,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 28,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_filled), label: Constants.homeTitle),
        BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart), label: Constants.statisticsTitle),
        BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart), label: Constants.visualisationsTitle),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          // TODO: Implement the navigation through screens
        });
      },
    );
  }
}
