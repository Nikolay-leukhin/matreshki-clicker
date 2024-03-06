import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final int id;
  final int maxEnergy;
  final int scorePerClick;
  int currentEnergy;
  int score;
  Timestamp time;

  UserModel({
    required this.id,
    required this.maxEnergy,
    required this.scorePerClick,
    required this.currentEnergy,
    required this.score,
    required this.time,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    var times = (json['create_at'].millisecondsSinceEpoch) / 1000;

    print(((DateTime.now().millisecondsSinceEpoch / 1000 -
        times) / 2));

    return UserModel(
      id: json['user_id'] as int,
      maxEnergy: (json['max_energy'] ?? 1000) as int,
      scorePerClick: (json['score_per_click'] ?? 1) as int,
      time: json['create_at'],
      currentEnergy: ((json['energy'] as int) +
          (DateTime.now().millisecondsSinceEpoch / 1000 -
                  times) / 2) >
              1000
          ? 1000
          : (json['energy'] as int) +
          (DateTime.now().millisecondsSinceEpoch / 1000 -
              times) ~/ 2,
      score: (json['score'] as int),
    );
  }
}
