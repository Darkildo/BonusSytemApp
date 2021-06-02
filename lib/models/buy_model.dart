import 'dart:math';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

class BuyModel {
  late DateTime buyTime;
  late String shopName;
  late int shopCost;
  late String localProgram;
  late int bonusPay;
  late int finalCostWithBonus;
  late int bonusRemain;
  BuyModel(this.bonusPay, this.bonusRemain, this.shopCost, this.localProgram,
      this.shopName, this.buyTime, this.finalCostWithBonus);
  BuyModel.withoutData() {
    buyTime = DateTime(
      1976,
      1,
      1,
      1,
      1,
      1,
    );
    shopName = '';
    shopCost = 0;
    localProgram = '';
    bonusPay = 0;
    finalCostWithBonus = 0;
    bonusRemain = 0;
  }
  BuyModel.randomData() {
    buyTime = DateTime(
      _rnd.nextInt(2030),
      _rnd.nextInt(60),
      _rnd.nextInt(60),
      _rnd.nextInt(60),
      _rnd.nextInt(60),
      _rnd.nextInt(60),
    );
    shopName = getRandomString(_rnd.nextInt(19));
    shopCost = _rnd.nextInt(6000);
    localProgram = getRandomString(_rnd.nextInt(19));
    bonusPay = _rnd.nextInt((shopCost * 0.8).toInt());
    finalCostWithBonus = shopCost - bonusPay;
    bonusRemain = 0;
  }
}
