import 'package:flutter/material.dart';
import 'package:moviedb/localization/app_localizations.dart';
import 'package:moviedb/theme/app_theme.dart';
import 'package:moviedb/widgets/custom_button_widget.dart';

class DialogHelper {
  void showErrorMessage(BuildContext context, errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          content: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 15.0),
                Text(
                  errorMessage,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomElevatedButtonWidget(
                    anotherIcon: Icons.check,
                    width: MediaQuery.of(context).size.width * 0.5,
                    label: AppLocalizations.of(context)!.ok,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: redColor),
                const SizedBox(height: 25.0),
              ],
            ),
          ),
        );
      },
    );
  }

  void showSuccessMessage(BuildContext context, successMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          content: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 15.0),
                  Text(
                    successMessage,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  CustomElevatedButtonWidget(
                      anotherIcon: Icons.check,
                      width: MediaQuery.of(context).size.width * 0.5,
                      label: AppLocalizations.of(context)!.ok,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      backgroundColor: secondaryColor),
                  const SizedBox(height: 25.0),
                ],
              )),
        );
      },
    );
  }
}
