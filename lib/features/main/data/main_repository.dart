import 'package:matreshka/models/user_model.dart';
import 'package:matreshka/services/firebase/firebase_collections.dart';
import 'package:tele_web_app/tele_web_app.dart';

class MainRepository {
  late final UserModel _user;
  late final TeleWebApp tg;
  late final _userDoc;

  UserModel get user => _user;

  MainRepository() {}

  Future<void> initData() async {
    tg = TeleWebApp();
    late final int userId;
    try {
      userId = tg.initDataUnsafe.user!.id;
    } catch (e) {
      userId = 1181861492;
    }
    final userDoc = FirebaseCollections.userCollection.doc(userId.toString());
    final score = (await userDoc.get()).data()!['score'];

    _userDoc = userDoc;
    _user = UserModel(id: userId, score: score);
  }

  incrementLocalUserScore() async {
    user.score += 1;
  }

  updateData() async {
    await _userDoc.update({"score": user.score});
  }
}
