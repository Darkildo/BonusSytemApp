import 'package:flutter/material.dart';
import 'package:loyal_app/models/buy_model.dart';
import 'package:loyal_app/models/user_model.dart';
import 'package:loyal_app/service/Mainbloc/bloc/mainbloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KabinetPage extends StatefulWidget {
  @override
  _KabinetPageState createState() => _KabinetPageState();
}

class _KabinetPageState extends State<KabinetPage> {
  userModel? user;
  List<BuyModel> shopList = [];

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
              child: shopList.isEmpty
                  ? const Text('Здесь скоро появятся ваши покупки')
                  : ListView.builder(
                      itemCount: shopList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(shopList[index].buyTime.toString());
                      },
                    ))
        ],
      ),
    );
  }
}
