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
    BuyModel.randomData(),
    BuyModel.randomData(),
    BuyModel.randomData(),
    BuyModel.randomData(),
    BuyModel.randomData(),
    BuyModel.randomData(),
    BuyModel.randomData(),
    BuyModel.randomData(),
    BuyModel.randomData(),
    BuyModel.randomData(),
    BuyModel.randomData(),
  ];
  void getMoreInfo(BuyModel model) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.task_alt_outlined),
                  const Text('Shop name:'),
                  const Spacer(),
                  Text(model.shopName),
                  const Spacer(),
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.009)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.card_travel),
                  const Text('bonus Program:'),
                  const Spacer(),
                  Text(model.localProgram),
                  const Spacer(),
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.009)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.money),
                  const Text('Shop cost:'),
                  const Spacer(),
                  Text(model.shopCost.toString()),
                  const Spacer(),
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.009)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.money_off_csred),
                  const Text('Bonus pay:'),
                  const Spacer(),
                  Text(model.bonusPay.toString()),
                  const Spacer(),
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.009)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.attach_money_sharp),
                  const Text('Bonus remain:'),
                  const Spacer(),
                  Text(model.bonusRemain.toString()),
                  const Spacer(),
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.009)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.money),
                  const Text('Final cost:'),
                  const Spacer(),
                  Text(model.finalCostWithBonus.toString()),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

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
              child: const Text(
            'Профиль',
            style: TextStyle(fontSize: 28),
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
                      left: MediaQuery.of(context).size.width * 0.04,
                      right: MediaQuery.of(context).size.width * 0.04),
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
                                    shopList[index].buyTime.toString(), () {
                                  getMoreInfo(shopList[index]);
                                }, true),
                              );
                            },
                          ))))
        ],
      ),
    );
  }
}
