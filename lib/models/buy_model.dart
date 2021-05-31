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
}
