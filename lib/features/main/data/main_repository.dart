import 'package:matreshka/models/user_model.dart';
import 'package:matreshka/services/firebase/firebase_collections.dart';
import 'package:tele_web_app/tele_web_app.dart';

class MainRepository {
  late final UserModel _user;
  final TeleWebApp tg = TeleWebApp();
  late final _userDoc;

  UserModel get user => _user;

  MainRepository() {
    initTelegramActions();
  }

  Future<void> initData() async {
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

  initTelegramActions() {
    tg.expand();
    tg.onEvent(WebAppEventType.invoiceClosed, updateData);
    tg.backButton.onClick(updateData);
  }

  updateData() async {
    await _userDoc.update({"score": user.score});
  }
}
