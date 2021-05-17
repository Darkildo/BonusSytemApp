import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String? errorInfo;
  const ErrorPage(this.errorInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text("This is error page"),
            Text("Error info:  " + (errorInfo != null ? errorInfo! : "no info"))
          ],
        ));
  }
}
