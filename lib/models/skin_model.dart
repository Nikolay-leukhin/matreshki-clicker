class SkinModel {
  final String iconPath;
  final String coinIconPath;
  final String coinName;
  final String name;
  final String description;
  final String id;

  SkinModel(
      {required this.name,
      required this.description,
      required this.iconPath,
      required this.coinIconPath,
      required this.coinName,
      required this.id});

  factory SkinModel.fromJson(Map<String, dynamic> json, String id) {
    return SkinModel(
        name: json['name'],
        description: json['description'],
        iconPath: json['image_path'],
        coinIconPath: json['coin_icon_path'],
        coinName: json['coin_name'],
        id: id);
  }
}
