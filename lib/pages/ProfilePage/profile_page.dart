import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyal_app/enum/user_info.dart';
import 'package:loyal_app/models/user_model.dart';
import 'package:loyal_app/service/Mainbloc/bloc/mainbloc_bloc.dart';
import 'package:loyal_app/widgets/button_bar.dart';
import 'package:loyal_app/widgets/profile_page_element.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  userModel? user;
  void editUserInfo(userInfoEnum changeParam) {
    String info = '';

    showDialog(
        context: context,
        builder: (_) => SimpleDialog(
              title: const Text('Редактирование данных'),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.05,
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: TextField(
                    onChanged: (val) {
                      info = val;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ButtonBarExample('отмена', () {
                      Navigator.of(context).pop();
                    }, null),
                    ButtonBarExample('Сохранить', () {
                      context
                          .read<MainblocBloc>()
                          .add(UpdateUserInfoEvent(info, changeParam));
                      Navigator.of(context).pop();
                    }, null),
                  ],
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    if (context.read<MainblocBloc>().state is AppLoadedState) {
      user = (context.read<MainblocBloc>().state as AppLoadedState).userInfo;
    } else {
      context.read<MainblocBloc>().add(ErrorCatchEvent());
    }
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.04),
      child: Column(
        mainAxisSize: MainAxisSize.max,

        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          Text(
            'Профиль',
            style: const TextStyle(fontSize: 28),
          ),
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.041),
              child: Text(
                user != null ? user!.firstName : 'invalid name',
                style:
                    const TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              )),

          const Text(
            'Epal',
            style: TextStyle(fontSize: 26),
          ),

          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.07,
                left: MediaQuery.of(context).size.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfilePageElement(
                  text: user!.login,
                  action: editUserInfo,
                  showuserinfotype: userInfoEnum.login,
                ),
                ProfilePageElement(
                  text: user!.firstName,
                  action: editUserInfo,
                  showuserinfotype: userInfoEnum.firstName,
                ),
                ProfilePageElement(
                  text: user!.lastName,
                  action: editUserInfo,
                  showuserinfotype: userInfoEnum.lastName,
                ),
                ProfilePageElement(
                  text: user!.thirdName,
                  action: editUserInfo,
                  showuserinfotype: userInfoEnum.thirdName,
                ),
                ProfilePageElement(
                  text: user!.mobileNumber,
                  action: editUserInfo,
                  showuserinfotype: userInfoEnum.mobileNumber,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
