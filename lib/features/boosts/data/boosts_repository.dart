import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matreshka/features/main/data/main_repository.dart';
import 'package:matreshka/services/firebase/firebase_collections.dart';

class BoostsRepository {
  final MainRepository mainRepository;

  BoostsRepository({required this.mainRepository});

  Future<void> rechargeEnergy() async {}

  Future<void> incrementScorePerClick() async {
    if(getCurrentMultiTapLvl() < 7) {
      final userDoc = FirebaseCollections.userCollection
          .doc(mainRepository.user.id.toString());

      await mainRepository.payForItem(getCurrentMultiTapPrice());

      await userDoc.update({'score_per_click': FieldValue.increment(1)});

      mainRepository.user.scorePerClick += 1;

    }
  }

  Future<void> extendEnergyLimit() async {
    if(getCurrentEnergyLvl() < 7) {
      final userDoc = FirebaseCollections.userCollection
          .doc(mainRepository.user.id.toString());

      await mainRepository.payForItem((getCurrentEnergyPrice()));

      await userDoc.update({'max_energy': FieldValue.increment(1000)});

      mainRepository.user.maxEnergy += 1000;
    }
  }

  int getCurrentEnergyPrice() {
    return (pow(2, (mainRepository.user.maxEnergy ~/ 1000) + 1) as int) * 1000;
  }

  int getCurrentEnergyLvl() {
    return mainRepository.user.maxEnergy ~/ 1000;
  }

  int getCurrentMultiTapPrice() {
    return (pow(2, mainRepository.user.scorePerClick + 1) as int) * 1000;
  }

  int getCurrentMultiTapLvl() {
    return mainRepository.user.scorePerClick;
  }
}
