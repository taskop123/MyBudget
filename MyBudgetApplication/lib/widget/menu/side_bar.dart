import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/screen/auth/profile_screen.dart';
import 'package:my_budget_application/screen/info/help_screen.dart';
import 'package:my_budget_application/screen/info/settings_screen.dart';
import 'package:my_budget_application/widget/menu/list_menu_tile.dart';
import 'package:provider/provider.dart';

import '../../screen/info/contact_screen.dart';
import '../../service/document_generator_service.dart';
import '../../util/constants.dart';

/// Defines the side bar widget used to help the user quickly
/// access key actions in our application.
class SideBar extends StatefulWidget {
  /// Defines the logout function.
  final Function()? _logout;

  /// Defines the current user.
  final CustomUser? _customUser;

  /// The list of expenses for the currently logged in user.
  final List<Expense> _expenses;

  /// Creates the side bar widget with the given [_logout] function,
  /// the [_customUser] and his [_expenses].
  const SideBar(this._customUser, this._logout, this._expenses, {Key? key})
      : super(key: key);

  /// Creates a state object for the side bar.
  @override
  State<SideBar> createState() => _SideBarState();
}

/// Defines the state of the side bar widget.
class _SideBarState extends State<SideBar> {
  /// Defines the current build context.
  late BuildContext _buildContext;

  /// Defines the additional information about the current user.
  late User? _user;

  /// Navigates to the help screen in our application.
  ///
  void _navigateToHelpScreen() {
    Navigator.of(_buildContext).pushNamed(HelpScreen.routeName);
  }

  /// Navigates to the contact screen in our application.
  ///
  void _navigateToContactScreen() {
    Navigator.of(_buildContext).pushNamed(ContactScreen.routeName);
  }

  /// Navigates to the profile screen in our application.
  ///
  void _navigateToProfileScreen() {
    Navigator.of(_buildContext).pushNamed(ProfileScreen.routeName,
        arguments: [widget._customUser, widget._expenses]);
  }

  /// Navigates to the settings screen in our application.
  ///
  void _navigateToSettingsScreen() {
    Navigator.of(_buildContext).pushNamed(SettingsScreen.routeName,
        arguments: [widget._customUser, widget._logout]);
  }

  /// Navigates to the settings screen in our application.
  ///
  void _exportPDFInvoice() async {
    if (widget._customUser != null &&
        _user != null &&
        widget._expenses.isNotEmpty) {
      final pdfFile = await DocumentGenerator.generatePDF(
          widget._expenses, widget._customUser!, _user!);
      await DocumentGenerator.openFile(pdfFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    _user = context.watch<User?>();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(widget._customUser!.username!),
            accountEmail: Text(_user!.email!),
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
          ),
          ListMenuTile(
            Icons.people,
            Constants.contactTitle,
            _navigateToContactScreen,
            null,
          ),
          ListMenuTile(
            Icons.help,
            Constants.helpTitle,
            _navigateToHelpScreen,
            null,
          ),
          ListMenuTile(
            Icons.settings,
            Constants.settingsTitle,
            _navigateToSettingsScreen,
            null,
          ),
          const Divider(),
          ListMenuTile(
            Icons.picture_as_pdf,
            Constants.exportPdfPlaceholder,
            _exportPDFInvoice,
            null,
          ),
          const Divider(),
          ListMenuTile(
            Icons.account_circle,
            Constants.profileTitle,
            _navigateToProfileScreen,
            null,
          ),
          ListMenuTile(
            Icons.logout,
            Constants.logoutTitle,
            widget._logout,
            null,
          ),
        ],
      ),
    );
  }
}
