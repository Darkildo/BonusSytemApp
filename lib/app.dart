import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyal_app/enum/page_list.dart';
import 'package:loyal_app/pages/ProfilePage/profile_page.dart';
import 'package:loyal_app/pages/errorPage/error_page.dart';
import 'package:loyal_app/pages/loginPage/login_page.dart';
import 'package:loyal_app/pages/registerPage/register_page.dart';
import 'package:loyal_app/service/Mainbloc/bloc/mainbloc_bloc.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

Widget getpage(MainblocState state) {
  if (state is AppLoadingState)
    return Center(
      child: Text('App is loading'),
    );

  if (state is AppLoadedState) {
    AppLoadedState currentState = (state as AppLoadedState);
    switch ((state as AppLoadedState).currentPage) {
      case pages.login:
        return loginPage();
      case pages.profile:
        return ProfilePage();
      case pages.register:
        return registerPage();

      default:
        return const ErrorPage('undefined page type in state');
    }
  }
  return const Text('unsupported state for switch');
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainblocBloc, MainblocState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            child: getpage(context.read<MainblocBloc>().state),
          ),
        );
      },
    );
  }
}
