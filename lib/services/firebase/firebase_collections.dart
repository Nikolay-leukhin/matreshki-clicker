import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollectionNames {
  static const String user = 'user';
  static const String market = 'market';
  static const String boosts = 'boosts';
}

class FirebaseCollections {
  static final FirebaseFirestore _fb = FirebaseFirestore.instance;

  static final userCollection = _fb.collection(FirebaseCollectionNames.user);
  static final marketCollection = _fb.collection(FirebaseCollectionNames.market);
  static final boostsCollection = _fb.collection(FirebaseCollectionNames.boosts);
}
