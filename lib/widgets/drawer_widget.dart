import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:moviedb/helpers/common.dart';
import 'package:moviedb/theme/app_theme.dart';

class DrawerWidget extends StatelessWidget implements PreferredSizeWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.only(top: 90.0),
        child: Drawer(
            backgroundColor: primaryColor.withOpacity(0.98),
            elevation: 0.0,
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ListView(
                        children: [
                          _createDrawerItem(
                            text: 'Movies',
                            onTap: () => _onItemTapped(context, 'Movies'),
                            icon: Icons.movie,
                          ),
                          _createDrawerItem(
                            text: 'TV Shows',
                            onTap: () => _onItemTapped(context, 'TV Shows'),
                            icon: Icons.tv,
                          ),
                          _createDrawerItem(
                              text: 'People',
                              onTap: () => _onItemTapped(context, 'People'),
                              icon: Icons.people),
                          const SizedBox(height: 5),
                          GestureDetector(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 5),
                                  Icon(Icons.power_settings_new_rounded,
                                      color: whiteColor.withOpacity(0.5)),
                                  const SizedBox(width: 5),
                                  Text('Logout',
                                      style: TextStyle(
                                          color: whiteColor.withOpacity(0.5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ))));
  }

  Widget _createDrawerItem({
    required String text,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
        child: GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon, color: whiteColor),
                const SizedBox(width: 5),
                Text(text,
                    style: const TextStyle(
                        color: whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ],
            )));
  }

  void _onItemTapped(BuildContext context, String destination) {
    if (destination == 'Movies') {
      navigateHome(context);
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
