import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollectionNames {
  static const String user = 'users';
  static const String market = 'market_skins';
  static const String boosts = 'boosts';
  static const String promo = 'promocodes';
}

class FirebaseCollections {
  static final FirebaseFirestore _fb = FirebaseFirestore.instance;

  static final userCollection = _fb.collection(FirebaseCollectionNames.user);
  static final marketCollection =
      _fb.collection(FirebaseCollectionNames.market);
  static final boostsCollection =
      _fb.collection(FirebaseCollectionNames.boosts);
  static final promoCollection = _fb.collection(FirebaseCollectionNames.promo);
}
