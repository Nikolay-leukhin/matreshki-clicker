import 'package:matreshka/models/user_model.dart';
import 'package:tele_web_app/tele_web_app.dart';

class MainRepository {
  late final UserModel _user;
  int userScore = 0;
  late final TeleWebApp tg;

  UserModel get user => _user;

  MainRepository() {
    tg = TeleWebApp();
    _user = UserModel(id: 123123);
  }

  incrementUserScore() {
    userScore += 1;
  }

  void closeApp() {
    tg.close();
  }
}
