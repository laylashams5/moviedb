import 'package:flutter/material.dart';
import 'package:moviedb/helpers/app_constants.dart';
import 'package:moviedb/theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback toggleDrawer;

  const CustomAppBar({super.key, required this.toggleDrawer});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: toggleDrawer,
      ),
      toolbarHeight: preferredSize.height,
      title: Image.asset(
        AppConstants.logoImage,
        height: 60,
        width: 60,
      ),
      centerTitle: true,
      backgroundColor: primaryColor,
      actions: [
        Align(
          alignment: Alignment.center,
          child: Stack(
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: whiteColor,
                  size: 25,
                ),
                onPressed: () {},
              ),
              Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: redColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: pinkColor,
            child: Text(
              'L',
              style: TextStyle(
                fontSize: 16.0,
                color: whiteColor,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: IconButton(
            icon: const Icon(
              Icons.search,
              color: secondaryColor,
              size: 25,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
