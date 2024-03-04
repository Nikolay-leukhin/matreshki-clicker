class UserModel {
  final int id;
  final int maxEnergy;
  final int scorePerClick;
  int currentEnergy;
  int score;

  UserModel({
    required this.id,
    required this.maxEnergy,
    required this.scorePerClick,
    required this.currentEnergy,
    required this.score,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['user_id'] as int,
      maxEnergy: (json['max_energy'] ?? 1000) as int,
      scorePerClick: (json['score_per_click'] ?? 1) as int,
      currentEnergy: (json['energy']?? 1000) as int,
      score: json['score'] as int,
    );
  }
}
