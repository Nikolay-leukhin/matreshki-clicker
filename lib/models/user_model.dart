class UserModel {
  final int id;
  final int maxEnergy;
  final int scorePerClick;
  int currentEnergy;
  int score;
  DateTime time;

  UserModel({
    required this.id,
    required this.maxEnergy,
    required this.scorePerClick,
    required this.currentEnergy,
    required this.score,
    required this.time,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    var dur = DateTime.now()
        .difference(DateTime.parse(getFromCDate(json['create_at'].toString())));

    var increm = dur.inSeconds;

    return UserModel(
      id: json['user_id'] as int,
      maxEnergy: (json['max_energy'] ?? 1000) as int,
      scorePerClick: (json['score_per_click'] ?? 1) as int,
      currentEnergy: ((json['energy'] ?? 1000) as int) + increm >= 1000
          ? 1000
          : ((json['energy'] as int) + increm),
      score: (json['score'] as int),
      time: DateTime.parse(getFromCDate(json['create_at'].toString())),
    );
  }

  String getToCDate() {
    var date = DateTime.now().toString();

    var data = date.replaceAll('.', '-').split(' ')[0].split('-');
    data = data.reversed.toList();

    var list = (data.join('-') + ' ' + date.replaceAll('.', '-').split(' ')[1])
        .split('-');

    list.removeAt(3);
    return list.join('-');
  }

  static String getFromCDate(String data) {
    var date = data.toString().replaceAll('.', '-').split(' ')[0].split('-');
    date = date.reversed.toList();

    return (date.join('-') + ' ' + data.replaceAll('.', '-').split(' ')[1])
        .replaceAll('-000', '');
  }
}
