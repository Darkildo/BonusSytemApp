import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyal_app/models/user_model.dart';
import 'package:loyal_app/service/Mainbloc/bloc/mainbloc_bloc.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  userModel? user;

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
            style: TextStyle(fontSize: 28),
          ),
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.041),
              child: Text(
                user != null ? user!.firstName : 'invalid name',
                style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              )),
          Container(
            child: Text(
              'Epal',
              style: TextStyle(fontSize: 26),
            ),
          ),

          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(user!.login),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(user!.firstName),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(user!.lastName),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(user!.thirdName),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(user!.mobileNumber),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
