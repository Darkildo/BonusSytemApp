import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyal_app/enum/page_list.dart';
import 'package:loyal_app/pages/ProfilePage/profile_page.dart';
import 'package:loyal_app/pages/errorPage/error_page.dart';
import 'package:loyal_app/pages/kabinetPage/kabinet_page.dart';
import 'package:loyal_app/pages/loginPage/login_page.dart';
import 'package:loyal_app/pages/registerPage/register_page.dart';
import 'package:loyal_app/service/Mainbloc/bloc/mainbloc_bloc.dart';
import 'package:loyal_app/widgets/button_bar.dart';

// ignore: use_key_in_widget_constructors
class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

Widget getpage(MainblocState state) {
  if (state is AppLoadingState) {
    return const Center(
      child: Text('App is loading'),
    );
  }

  if (state is AppLoadedState) {
    switch ((state).currentPage) {
      case pages.login:
        return loginPage();
      case pages.profile:
        return ProfilePage();
      case pages.register:
        return registerPage();
      case pages.kabinet:
        return KabinetPage();
      default:
        return const ErrorPage('undefined page type in state');
    }
  }
  return const Text('unsupported state for switch');
}

class AppState extends State<App> {
  MainblocBloc? bloc;

  void kabinetButton() {
    bloc!.add(ChangePageEvent(pages.kabinet));
  }

  void profilebutton() {
    bloc!.add(ChangePageEvent(pages.profile));
  }

  bool isProPageActive(pages page) {
    MainblocState currentState = bloc!.state;
    if (currentState is AppLoadedState) {
      return currentState.currentPage == page;
    }
    return false;
  }

  bool actionButtonActive() {
    if (bloc!.state is AppLoadedState) {
      return (bloc!.state as AppLoadedState).floatMenuEnabled;
    }
    return false;
  }

  void showQRImage() {
    showDialog(
        context: context,
        builder: (_) => SimpleDialog(
              title: const Text('QR'),
              children: [
                Image.asset('qrcode.jpg'),
                const Text('This is my content')
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    bloc = context.read<MainblocBloc>();
    return BlocBuilder<MainblocBloc, MainblocState>(
      bloc: context.read<MainblocBloc>(),
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: actionButtonActive()
              ? FloatingActionButton(
                  child: const Icon(Icons.qr_code),
                  onPressed: () {
                    showQRImage();
                  },
                )
              : null,
          bottomNavigationBar: actionButtonActive()
              ? BottomAppBar(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonBarExample('Кабинет', kabinetButton,
                          isProPageActive(pages.kabinet)),
                      ButtonBarExample('Профиль', profilebutton,
                          isProPageActive(pages.profile)),
                    ],
                  ),
                )
              : null,
          body: Container(
            child: getpage(context.read<MainblocBloc>().state),
          ),
        );
      },
    );
  }
}
