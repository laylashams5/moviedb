import 'package:flutter/material.dart';
import 'package:moviedb/theme/app_theme.dart';

class CustomPopupMenuWidget extends StatefulWidget {
  final List<String> options;
  final Function(String) onSelected;
  final String initialValue;

  const CustomPopupMenuWidget({
    Key? key,
    required this.options,
    required this.onSelected,
    required this.initialValue,
  }) : super(key: key);

  @override
  _CustomPopupMenuWidgetState createState() => _CustomPopupMenuWidgetState();
}

class _CustomPopupMenuWidgetState extends State<CustomPopupMenuWidget> {
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        popupMenuTheme: const PopupMenuThemeData(
          color: accentColor,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            side: BorderSide(color: darkPrimaryColor, width: 1),
          ),
        ),
      ),
      child: PopupMenuButton<String>(
        onSelected: (String value) {
          setState(() {
            selectedOption = value;
            widget.onSelected(value);
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 18.0),
          decoration: BoxDecoration(
            color: darkPrimaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [accentColor, secondaryColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(bounds),
                child: Text(
                  selectedOption,
                  style: const TextStyle(
                      color: whiteColor, fontWeight: FontWeight.bold),
                ),
              ),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [accentColor, secondaryColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(bounds),
                child: const Icon(Icons.keyboard_arrow_down_sharp,
                    color: whiteColor),
              )
            ],
          ),
        ),
        itemBuilder: (BuildContext context) =>
            widget.options.map((String option) {
          return PopupMenuItem<String>(
            value: option,
            child: Text(
              option,
              style: const TextStyle(
                  color: darkPrimaryColor,
                  fontWeight:
                      FontWeight.bold), // Replace with your dark primary color
            ),
          );
        }).toList(),
      ),
    );
  }
}
