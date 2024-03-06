import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:matreshka/models/market_model.dart';
import 'package:matreshka/models/skin_model.dart';
import 'package:matreshka/models/user_model.dart';
import 'package:matreshka/services/firebase/firebase_collections.dart';
import 'package:tele_web_app/tele_web_app.dart';

class MainRepository {
  late final UserModel _user;
  final TeleWebApp tg = TeleWebApp();
  late DocumentReference _userDoc;

  UserModel get user => _user;

  MainRepository() {
    initTelegramActions();
  }

  Future<void> initData() async {
    late final int userId;
    try {
      userId = tg.initDataUnsafe.user!.id;
    } catch (e) {
      userId = 879223741;
    }
    final userDoc = FirebaseCollections.userCollection.doc(userId.toString());
    _userDoc = userDoc;

    final res = (await userDoc.get()).data();

    _user = UserModel.fromJson(res!, await loadUserSkins(res['user_skins']));
  }

  Future<List<SkinModel>> loadUserSkins(List<dynamic> dollsId) async {
    List<SkinModel> skins = [];
    print(dollsId);
    for (var id in dollsId) {
      final doc = FirebaseCollections.skinsCollection.doc(id);
      final dollData = await doc.get();
      print("hi");
      skins.add(SkinModel.fromJson(dollData.data()!, id));
    }

    return skins;
  }

  onTap() async {
    if (user.currentEnergy - user.scorePerClick >= 0) {
      user.score += user.scorePerClick;
      user.currentEnergy -= user.currentEnergy - 1 < 0 ? 0 : 1;
      EasyDebounce.debounce(
          "increment", const Duration(seconds: 1), updateData);
    }
  }

  onTimePicker() async {
    if (user.currentEnergy < user.maxEnergy) {
      user.currentEnergy += user.currentEnergy == user.maxEnergy ? 0 : 1;
      EasyDebounce.debounce(
          "increment", const Duration(microseconds: 1), updateData);
    }
  }

  initTelegramActions() {
    tg.expand();
  }

  updateData() async {
    await _userDoc.update({
      "score": user.score,
      "energy": user.currentEnergy,
      "create_at": Timestamp.now()
    });
  }

  Future<void> changeDoll(String newId) async {
    final userColl = FirebaseCollections.userCollection.doc(user.id.toString());
    await userColl.update({"active_skin_id": newId});
    user.activeSckinId = newId;
  }
}
