import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollectionNames {
  static const String user = 'users';

  static const String skins = 'dolls';
  static const String skinsMarket = 'market_skins';

  static const String boosts = 'boosts';

  static const String promo = 'promocodes';
  static const String promoMarket = 'promo_market';
}

class FirebaseCollections {
  static final FirebaseFirestore _fb = FirebaseFirestore.instance;

  static final userCollection = _fb.collection(FirebaseCollectionNames.user);

  static final skinsCollection = _fb.collection(FirebaseCollectionNames.skins);
  static final marketSkinsCollection =
      _fb.collection(FirebaseCollectionNames.skinsMarket);

  static final boostsCollection =
      _fb.collection(FirebaseCollectionNames.boosts);

  static final promoCollection = _fb.collection(FirebaseCollectionNames.promo);
  static final marketPromoCollection =
      _fb.collection(FirebaseCollectionNames.promoMarket);
}
