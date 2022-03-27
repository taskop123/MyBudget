import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/screen/auth/profile_screen.dart';
import 'package:my_budget_application/screen/info/help_screen.dart';
import 'package:my_budget_application/widget/menu/list_menu_tile.dart';
import 'package:provider/provider.dart';

import '../../screen/info/contact_screen.dart';
import '../../util/constants.dart';

class SideBar extends StatefulWidget {
  final Function()? _logout;

  const SideBar(this._logout, {Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  late BuildContext _buildContext;

  void _navigateToHelpScreen() {
    Navigator.of(_buildContext).pushNamed(HelpScreen.routeName);
  }

  void _navigateToContactScreen() {
    Navigator.of(_buildContext).pushNamed(ContactScreen.routeName);
  }

  void _navigateToProfileScreen() {
    Navigator.of(_buildContext).pushNamed(ProfileScreen.routeName);
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
            accountName: Text(CustomUser.current!.username!),
            accountEmail: Text(user!.email!),
            currentAccountPicture: GestureDetector(
              onTap: () => _navigateToProfileScreen(),
              child: CircleAvatar(
                child: ClipOval(
                  child: (CustomUser.current!.profilePicture != null)
                      ? Image.network(CustomUser.current!.profilePicture!)
                      : Image.asset(Constants.avatarUrl),
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          // ListMenuTile(
          //   Icons.picture_as_pdf,
          //   'Export a report',
          //   null,
          //   null,
          // ),
          // ListMenuTile(
          //   Icons.notifications,
          //   'Notifications',
          //   null,
          //   const ListMenuNotification(8),
          // ),
          // const Divider(),
          ListMenuTile(
            Icons.people,
            'Contact',
            _navigateToContactScreen,
            null,
          ),
          // const ListMenuTile(
          //   Icons.settings,
          //   'Settings',
          //   null,
          //   null,
          // ),
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
