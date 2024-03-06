import 'dart:async';
import 'dart:developer';

import 'package:matreshka/models/market_model.dart';
import 'package:matreshka/services/firebase/firebase_collections.dart';

class MarketRepository {
  List<MarketPromoModel> promoItems = [];
  List<MarketSkinModel> skinsList = [];

  void buyItem() {}

  Future<void> loadMarketPromocodes() async {
    promoItems.clear();
    final data = await FirebaseCollections.marketPromoCollection.get();

    for (var doc in data.docs) {
      try {
        final itemData = doc.data();

        final promoDoc =
            FirebaseCollections.promoCollection.doc(itemData['promo_id']);
        final promoData = await promoDoc.get();

        itemData.addEntries(promoData.data()!.entries);

        promoItems.add(MarketPromoModel.fromJson(itemData));
      } catch (e) {
        log("fail to parse skin");
      }
    }
  }

  Future<void> loadMarketSkins() async {
    skinsList.clear();
    final data = await FirebaseCollections.marketSkinsCollection.get();

    for (var doc in data.docs) {
      try {
        final itemData = doc.data();

        final dollDoc =
            FirebaseCollections.skinsCollection.doc(itemData['doll_id']);
        final dollData = await dollDoc.get();

        itemData.addEntries(dollData.data()!.entries);

        skinsList.add(MarketSkinModel.fromJson(itemData));
      } catch (e) {
        log("fail to parse skin");
      }
    }
  }
}
