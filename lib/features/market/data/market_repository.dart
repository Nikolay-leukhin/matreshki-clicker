import 'package:matreshka/models/market_model.dart';
import 'package:matreshka/services/firebase/firebase_collections.dart';

class MarketRepository {
  List<dynamic> marketItems = [];

  void buyItem() {}

  void loadMarketItems() async {
    final data = await FirebaseCollections.marketCollection.get();

    data.docs.forEach((doc) {
      final map = doc.data();
      if (map.keys.contains('promocode')) {
        marketItems.add(MarketPromoModel.fromJson(map));
      } else {
        marketItems.add(MarketSkinModel.fromJson(map));
      }
    });
  }
}
