import 'dart:developer';

import 'package:matreshka/models/market_model.dart';
import 'package:matreshka/services/firebase/firebase_collections.dart';

class MarketRepository {
  List<MarketPromoModel> promoItems = [];
  List<MarketSkinModel> skinsList = [];

  void buyItem() {}

  Future<void> loadMarketPromocodes() async {
    final data = await FirebaseCollections.promoCollection.get();
    data.docs.forEach((doc) {
      try {
        promoItems.add(MarketPromoModel.fromJson(doc.data()));
      } catch (e) {
        log("fail to parse promocode");
      }
    });
  }

  Future<void> loadMarketSkins() async {
    final data = await FirebaseCollections.marketCollection.get();
    data.docs.forEach((doc) {
      try {
        skinsList.add(MarketSkinModel.fromJson(doc.data()));
      } catch (e) {
        log("fail to parse skin");
      }
    });
  }
}
