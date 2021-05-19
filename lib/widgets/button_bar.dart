import 'package:flutter/material.dart';

class ButtonBarExample extends StatelessWidget {
  final String text;
  final Function? action;
  final bool? buttonActive;
  // ignore: use_key_in_widget_constructors
  const ButtonBarExample(this.text, this.action, this.buttonActive) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (buttonActive == null ? true : buttonActive!)
              ? Colors.blue
              : Colors.blueGrey.shade500,
          elevation: 30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          padding: const EdgeInsets.all(10.0),
        ),
        onPressed: action != null
            ? () {
                action!();
              }
            : null,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
