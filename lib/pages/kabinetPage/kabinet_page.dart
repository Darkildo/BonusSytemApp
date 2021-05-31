import 'package:flutter/material.dart';
import 'package:loyal_app/models/buy_model.dart';
import 'package:loyal_app/models/user_model.dart';
import 'package:loyal_app/service/Mainbloc/bloc/mainbloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyal_app/widgets/button_bar.dart';

class KabinetPage extends StatefulWidget {
  @override
  _KabinetPageState createState() => _KabinetPageState();
}

class _KabinetPageState extends State<KabinetPage> {
  userModel? user;
  List<BuyModel> shopList = [
    BuyModel.withoutData(),
    BuyModel.withoutData(),
    BuyModel.withoutData(),
    BuyModel.withoutData(),
    BuyModel.withoutData(),
    BuyModel.withoutData(),
    BuyModel.withoutData(),
    BuyModel.withoutData(),
    BuyModel.withoutData(),
    BuyModel.withoutData(),
    BuyModel.withoutData(),
  ];

  @override
  Widget build(BuildContext context) {
    if (context.read<MainblocBloc>().state is AppLoadedState) {
      user = (context.read<MainblocBloc>().state as AppLoadedState).userInfo;
    } else {
      context.read<MainblocBloc>().add(ErrorCatchEvent());
    }
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.04),
      child: Flex(
        direction: Axis.vertical,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          Flexible(
              child: Text(
            'Профиль',
            style: const TextStyle(fontSize: 28),
          )),
          Flexible(
              child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.041),
                  child: Text(
                    user != null ? user!.firstName : 'invalid name',
                    style: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic),
                  ))),

          const Flexible(
              child: Text(
            'Epal',
            style: TextStyle(fontSize: 26),
          )),

          Flexible(
              fit: FlexFit.tight,
              flex: 6,
              child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.07,
                      left: MediaQuery.of(context).size.width * 0.04),
                  child: shopList.isEmpty
                      ? const Text('Здесь скоро появятся ваши покупки')
                      : NotificationListener<OverscrollIndicatorNotification>(
                          onNotification:
                              (OverscrollIndicatorNotification overscroll) {
                            overscroll.disallowGlow();
                            return false;
                          },
                          child: ListView.builder(
                            itemCount: shopList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ButtonBarExample(
                                    shopList[index].buyTime.toIso8601String(),
                                    () {},
                                    null),
                              );
                            },
                          ))))
        ],
      ),
    );
  }
}
