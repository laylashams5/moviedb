import 'package:flutter/material.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  final double? width;
  final String label;
  final IconData? icon;
  final IconData? anotherIcon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color? textColor;
  final Color? anotherIconColor;
  const CustomElevatedButtonWidget(
      {super.key,
      this.width,
      required this.label,
      this.icon,
      this.anotherIcon,
      required this.onPressed,
      this.textColor,
      this.anotherIconColor,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.0,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
          ),
        ),
        onPressed: onPressed,
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: TextStyle(fontSize: 16.0, color: textColor),
                  ),
                  Icon(
                    icon,
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(anotherIcon, color: anotherIconColor),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    label,
                    style: TextStyle(fontSize: 16.0, color: textColor),
                  ),
                ],
              ),
      ),
    );
  }
}
