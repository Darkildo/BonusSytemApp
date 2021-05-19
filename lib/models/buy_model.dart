class BuyModel {
  DateTime buyTime;
  String shopName;
  int shopCost;
  String localProgram;
  int bonusPay;
  int finalCostWithBonus;
  int bonusRemain;
  BuyModel(this.bonusPay, this.bonusRemain, this.shopCost, this.localProgram,
      this.shopName, this.buyTime, this.finalCostWithBonus);
}
