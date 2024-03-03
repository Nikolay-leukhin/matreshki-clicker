import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matreshka/models/user_model.dart';
import 'package:matreshka/services/firebase/firebase_collections.dart';
import 'package:tele_web_app/tele_web_app.dart';

class MainRepository {
  late final UserModel _user;
  late final TeleWebApp tg;

  UserModel get user => _user;

  MainRepository() {
    tg = TeleWebApp();
    late final int userId;
    try {
      userId = tg.initDataUnsafe.user!.id;
    } catch (e) {
      userId = 121321;
    }

    _user = UserModel(id: userId, score: 0);
  }

  incrementUserScore() async {
    // final userDoc = await FirebaseCollections.userCollection
    //     .where('user_id', isEqualTo: _user.id)
    //     .get();

    user.score += 1;
  }
}
