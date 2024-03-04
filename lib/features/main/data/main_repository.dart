import 'package:easy_debounce/easy_debounce.dart';
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
    _userDoc = userDoc;
    _user = UserModel.fromJson((await userDoc.get()).data()!);
  }

  onTap() async {
    user.score += user.scorePerClick;
    user.currentEnergy -= user.scorePerClick;
    EasyDebounce.debounce("increment", const Duration(seconds: 1), updateData);
  }

  initTelegramActions() {
    tg.expand();
  }

  updateData() async {
    await _userDoc.update({"score": user.score, "energy": user.currentEnergy});
  }
}
