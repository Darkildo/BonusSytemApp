import 'package:flutter/material.dart';
import 'package:loyal_app/enum/page_list.dart';
import 'package:loyal_app/models/user_model.dart';
import 'package:loyal_app/service/Mainbloc/bloc/mainbloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class registerPage extends StatefulWidget {
  @override
  _registerPageState createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  void buttonStateUpdate() {
    setState(() {
      activateButton = (user.password == againPassword);
    });
  }

  @override
  bool activateButton = false;
  userModel user = userModel("", "", "", "", "", "");
  String againPassword = '';
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.11),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.05),
              child: Text(
                'Loyalty.HD',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 24),
              ),
            ),
            TextFormField(
              onChanged: (val) => {user.login = val},
              initialValue: 'Логин',
            ),
            TextFormField(
              onChanged: (val) => {user.firstName = val},
              initialValue: 'имя',
            ),
            TextFormField(
              onChanged: (val) => {user.lastName = val},
              initialValue: 'Фамилия',
            ),
            TextFormField(
              onChanged: (val) => {user.thirdName = val},
              initialValue: 'отчество',
            ),
            TextFormField(
              onChanged: (val) => {user.mobileNumber = val},
              initialValue: 'номер телефона',
            ),
            TextFormField(
              onChanged: (val) => {user.password = val, buttonStateUpdate()},
              initialValue: 'password',
            ),
            TextFormField(
              onChanged: (val) => {againPassword = val, buttonStateUpdate()},
              initialValue: 'password again',
            ),
            Container(
                margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.05,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.05,
                ),
                child: ElevatedButton(
                    onPressed: !activateButton
                        ? null
                        : () {
                            context
                                .read<MainblocBloc>()
                                .add(TryRegisterEvent(user));
                          },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01,
                        horizontal: MediaQuery.of(context).size.width * 0.02,
                      ),
                      child: Text(
                        'Зарегистрироваться',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 24),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
