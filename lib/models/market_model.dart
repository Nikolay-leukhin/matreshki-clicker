abstract class MarketItemModel {
  final String name;
  final int price;
  final String description;
  final String id;

  MarketItemModel(
      {required this.name,
      required this.price,
      required this.description,
      required this.id});
}

class MarketSkinModel extends MarketItemModel {
  final String iconPath;
  final String coinIconPath;

  MarketSkinModel(
      {required super.name,
      required super.price,
      required super.description,
      required this.iconPath,
      required this.coinIconPath,
      required super.id});

  factory MarketSkinModel.fromJson(Map<String, dynamic> json) {
    return MarketSkinModel(
        name: json['name'],
        price: json['price'],
        description: json['description'],
        iconPath: json['iconPath'],
        coinIconPath: json['coinIconPath'],
        id: json['id']);
  }
}

class MarketPromoModel extends MarketItemModel {
  final String promocode;

  MarketPromoModel(
      {required super.name,
      required super.price,
      required super.description,
      required this.promocode,
      required super.id});

  factory MarketPromoModel.fromJson(Map<String, dynamic> json) {
    return MarketPromoModel(
        name: json['name'],
        price: json['price'],
        description: json['description'],
        promocode: json['promocode'],
        id: json['id']);
  }
}
