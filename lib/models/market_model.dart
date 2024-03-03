abstract class MarketItemModel {
  final String name;
  final int price;
  final String description;

  MarketItemModel(
      {required this.name, required this.price, required this.description});
}

class MarketSkinModel extends MarketItemModel {
  final String iconPath;

  MarketSkinModel(
      {required super.name,
      required super.price,
      required super.description,
      required this.iconPath});

  factory MarketSkinModel.fromJson(Map<String, dynamic> json) {
    return MarketSkinModel(
      name: json['name'],
      price: json['price'],
      description: json['description'],
      iconPath: json['iconPath'],
    );
  }
}

class MarketPromoModel extends MarketItemModel {
  final String promocode;

  MarketPromoModel(
      {required super.name,
      required super.price,
      required super.description,
      required this.promocode});

  factory MarketPromoModel.fromJson(Map<String, dynamic> json) {
    return MarketPromoModel(
      name: json['name'],
      price: json['price'],
      description: json['description'],
      promocode: json['promocode'],
    );
  }
}
