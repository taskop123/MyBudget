import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/screen/auth/profile_screen.dart';
import 'package:my_budget_application/screen/info/help_screen.dart';
import 'package:my_budget_application/widget/menu/list_menu_tile.dart';
import 'package:provider/provider.dart';

import '../../screen/info/contact_screen.dart';
import '../../util/constants.dart';


/// Defines the side bar widget used to help the user quickly 
/// access key actions in our application.
class SideBar extends StatefulWidget {
  /// Defines the logout function. 
  final Function()? _logout;
  /// Defines the current user.
  final CustomUser? _customUser;

  final List<Expense> _expenses;

  /// Creates the side bar widget with the given logout function
  /// and the current user.
  const SideBar(this._customUser, this._logout, this._expenses, {Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

/// Defines the state of the side bar widget.
class _SideBarState extends State<SideBar> {
  /// Defines the current build context.
  late BuildContext _buildContext;

  /// Navigates to the help screen in our application.
  void _navigateToHelpScreen() {
    Navigator.of(_buildContext).pushNamed(HelpScreen.routeName);
  }

  /// Navigates to the contact screen in our application.
  void _navigateToContactScreen() {
    Navigator.of(_buildContext).pushNamed(ContactScreen.routeName);
  }
  
  /// Navigates to the profile screen in our application.
  void _navigateToProfileScreen() {
    Navigator.of(_buildContext)
        .pushNamed(ProfileScreen.routeName, arguments: [widget._customUser, widget._expenses]);
  }

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    var user = context.watch<User?>();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(widget._customUser!.username!),
            accountEmail: Text(user!.email!),
            currentAccountPicture: GestureDetector(
              onTap: () => _navigateToProfileScreen(),
              child: CircleAvatar(
                child: ClipOval(
                  child: (widget._customUser!.profilePicture != null)
                      ? Image.network(widget._customUser!.profilePicture!)
                      : Image.asset(Constants.avatarUrl),
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListMenuTile(
            Icons.people,
            'Contact',
            _navigateToContactScreen,
            null,
          ),
          ListMenuTile(
            Icons.help,
            'Help',
            _navigateToHelpScreen,
            null,
          ),
          const Divider(),
          ListMenuTile(
            Icons.account_circle,
            'Profile',
            _navigateToProfileScreen,
            null,
          ),
          ListMenuTile(
            Icons.logout,
            'Logout',
            widget._logout,
            null,
          ),
        ],
      ),
    );
  }
}
