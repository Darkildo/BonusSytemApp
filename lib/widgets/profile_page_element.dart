import 'package:flutter/material.dart';
import 'package:loyal_app/enum/user_info.dart';

// ignore: must_be_immutable
class ProfilePageElement extends StatelessWidget {
  String? text;
  Function? action;
  userInfoEnum? showuserinfotype;
  // ignore: use_key_in_widget_constructors
  ProfilePageElement(
      {@required this.text, this.action, @required this.showuserinfotype})
      : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action != null && showuserinfotype != null
          ? () => action!(showuserinfotype)
          : null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text != null && text!.isNotEmpty ? text! : 'none data'),
      ),
    );
  }
}
