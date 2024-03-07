import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matreshka/features/main/data/main_repository.dart';
import 'package:matreshka/models/boost_model.dart';
import 'package:matreshka/services/firebase/firebase_collections.dart';

class BoostsRepository {
  final MainRepository mainRepository;

  BoostsRepository({required this.mainRepository});

  Future<void> rechargeEnergy() async {}

  Future<void> incrementScorePerClick(BoosterModel boost) async {
    final userDoc =  FirebaseCollections.userCollection
        .doc(mainRepository.user.id.toString());
    await userDoc.update({'score_per_click': FieldValue.increment(5)});

    await mainRepository.payForItem(boost.price);
  }

  Future<void> extendEnergyLimit(BoosterModel boost) async {
    final userDoc =  FirebaseCollections.userCollection
        .doc(mainRepository.user.id.toString());
    await userDoc.update({'max_energy': FieldValue.increment(5)});

    await mainRepository.payForItem(boost.price);
  }
}
