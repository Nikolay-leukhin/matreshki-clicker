class PromoModel {
  final String promocode;
  final String name;
  final String id;
  final String description;

  PromoModel(
      {required this.name,
      required this.description,
      required this.promocode,
      required this.id});

  factory PromoModel.fromJson(Map<String, dynamic> json) {
    return PromoModel(
        name: json['name'],
        description: json['description'],
        promocode: json['promocode'],
        id: json['id']);
  }
}
