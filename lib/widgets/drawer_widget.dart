import 'package:flutter/material.dart';
import 'package:moviedb/theme/app_theme.dart';

class DrawerWidget extends StatelessWidget implements PreferredSizeWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: primaryColor.withOpacity(0.99),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: [
                  _createDrawerItem(
                      text: 'Movies',
                      onTap: () => _onItemTapped(context, 'Movies')),
                  _createDrawerItem(
                      text: 'TV Shows',
                      onTap: () => _onItemTapped(context, 'TV Shows')),
                  _createDrawerItem(
                      text: 'People',
                      onTap: () => _onItemTapped(context, 'People')),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _createDrawerItem(
      {required String text, required VoidCallback onTap}) {
    return ListTile(
      title: Text(text, style: const TextStyle(color: whiteColor)),
      onTap: onTap,
    );
  }

  void _onItemTapped(BuildContext context, String destination) {}

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
