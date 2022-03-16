import 'package:flutter/material.dart';
import 'package:my_budget_application/widget/menu/list_menu_notification.dart';
import 'package:my_budget_application/widget/menu/list_menu_tile.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Example.com'),
            accountEmail: const Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://media.istockphoto.com/photos/concept-image-of-a-magnifying-glass-on-blue-background-with-a-word-picture-id1316134499?b=1&k=20&m=1316134499&s=170667a&w=0&h=DsKKZ2Sc6k7bZQpxZTcHyV7AJqyy-haTXYZlrA2Jy-c=',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://farm3.static.flickr.com/2098/2260149771_00cb406fd6_o.jpg'),),
            ),
          ),
          const ListMenuTile(
            Icons.picture_as_pdf,
            'Export a report',
            null,
            null,
          ),
          const ListMenuTile(
            Icons.notifications,
            'Request',
            null,
            ListMenuNotification(8),
          ),
          const ListMenuTile(
            Icons.share,
            'Share',
            null,
            null,
          ),

          const Divider(),
          const ListMenuTile(
            Icons.people,
            'About Us',
            null,
            null,
          ),
          const ListMenuTile(
            Icons.settings,
            'Settings',
            null,
            null,
          ),
          const ListMenuTile(
            Icons.help,
            'Help',
            null,
            null,
          ),
          const ListMenuTile(
            Icons.description,
            'Policies',
            null,
            null,
          ),
          const Divider(),
          const ListMenuTile(
            Icons.account_circle,
            'Profile',
            null,
            null,
          ),
          const ListMenuTile(
            Icons.logout,
            'Logout',
            null,
            null,
          ),
        ],
      ),
    );
  }
}
