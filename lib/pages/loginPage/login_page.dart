import 'package:flutter/material.dart';
import 'package:loyal_app/enum/page_list.dart';
import 'package:loyal_app/service/Mainbloc/bloc/mainbloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class loginPage extends StatefulWidget {
  loginPage() : super();
  String userLogin = '';
  String userPassword = '';
  bool buttonActive = false;
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  void buttonStateUpdate() {
    setState(() {
      widget.buttonActive =
          (widget.userLogin.length > 3 && widget.userPassword.length > 3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            onChanged: (val) => {widget.userLogin = val, buttonStateUpdate()},
            initialValue: 'Login',
          ),
          TextFormField(
            onChanged: (val) =>
                {widget.userPassword = val, buttonStateUpdate()},
            initialValue: 'Password',
          ),
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.05),
              child: ElevatedButton(
                  onPressed: !widget.buttonActive
                      ? null
                      : () {
                          context.read<MainblocBloc>().add(TryloginEvent(
                              widget.userLogin, widget.userPassword));
                        },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.01,
                      horizontal: MediaQuery.of(context).size.width * 0.06,
                    ),
                    child: Text(
                      'Вход',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 22),
                    ),
                  ))),
          Container(
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05,
              ),
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<MainblocBloc>()
                        .add(ChangePageEvent(pages.register));
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
    );
  }
}
