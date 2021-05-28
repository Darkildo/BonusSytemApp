import 'package:flutter/cupertino.dart';

class userModel {
  late String login;
  String? password;
  late String firstName;
  late String lastName;
  late String thirdName;
  late String mobileNumber;

  userModel(this.firstName, this.lastName, this.login, this.mobileNumber,
      this.thirdName, this.password) {
    if (password == null || password == '') password = 'none';
  }
  userModel.withoutdata() {
    firstName = '';
    lastName = '';
    thirdName = '';
    mobileNumber = '';
    login = '';
  }
}
