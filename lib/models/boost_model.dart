class BoosterModel {
  final String name;
  final String description;
  final int price;
  final String iconPath;
  final BoosterType type;

  BoosterModel(
      {required this.name,
      required this.description,
      required this.price,
      required this.iconPath,
      required this.type});
}

enum BoosterType {
  doubleBoost,
  incrementClick,
  incrementEnergy,
  energyRecovery,
  trippleCoinsForTime
}
