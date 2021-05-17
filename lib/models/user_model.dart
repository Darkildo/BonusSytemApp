import 'package:flutter/cupertino.dart';

class userModel {
  String login;
  String? password;
  String firstName;
  String lastName;
  String thirdName;
  String mobileNumber;

  userModel(this.firstName, this.lastName, this.login, this.mobileNumber,
      this.thirdName, this.password) {
    if (password == null || password == '') password = 'none';
  }
}
