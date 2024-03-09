import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matreshka/models/promo_model.dart';
import 'package:matreshka/models/skin_model.dart';

class UserModel {
  final int id;
  int maxEnergy;
  int scorePerClick;
  List<PromoModel> userPromo;
  String activeSckinId;
  List<SkinModel> userSkins;
  int currentEnergy;
  int score;
  Timestamp time;
  int rechargingSpeed;
  int activeFullEnergy;

  UserModel(
      {required this.id,
      required this.maxEnergy,
      required this.scorePerClick,
      required this.currentEnergy,
      required this.score,
      required this.time,
      required this.activeSckinId,
      required this.userPromo,
      required this.userSkins,
      required this.rechargingSpeed,
      required this.activeFullEnergy});

  factory UserModel.fromJson(Map<String, dynamic> json, List<SkinModel> skins,
      List<PromoModel> promos) {
    var maxEnergy = (json['max_energy']) as int;

    var times = (json['create_at'].millisecondsSinceEpoch) / 1000;

    return UserModel(
        id: json['user_id'] as int,
        maxEnergy: maxEnergy,
        scorePerClick: (json['score_per_click'] ?? 1) as int,
        time: json['create_at'],
        currentEnergy: ((json['energy'] as int) +
                    (DateTime.now().millisecondsSinceEpoch / 1000 - times) /
                        2) >
                maxEnergy
            ? maxEnergy
            : (json['energy'] as int) +
                (DateTime.now().millisecondsSinceEpoch / 1000 - times) ~/ 2,
        score: (json['score'] as int),
        activeSckinId: json['active_skin_id'],
        userSkins: skins,
        userPromo: promos,
        rechargingSpeed: json['recharging_speed'] as int,
        activeFullEnergy: json["active_full_energy"] as int);
  }
}
