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

  Future<void> incrementRechargingSpeed() async {
    if(getCurrentRechargingLvl() < 7) {
      final userDoc = FirebaseCollections.userCollection
          .doc(mainRepository.user.id.toString());

      await mainRepository.payForItem(getCurrentMultiTapPrice());

      await userDoc.update({'recharging_speed': FieldValue.increment(1)});

      mainRepository.user.rechargingSpeed += 1;
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

  Future<void> getFullEnergy() async {
    if(mainRepository.user.activeFullEnergy > 0) {
      final userDoc = FirebaseCollections.userCollection
          .doc(mainRepository.user.id.toString());

      await userDoc.update({'active_full_energy': FieldValue.increment(-1)});
      await userDoc.update({'energy': mainRepository.user.maxEnergy});

      mainRepository.user.currentEnergy = mainRepository.user.maxEnergy;
      mainRepository.user.activeFullEnergy -= 1;
    }
    else{
      throw Exception('закончились свободные слоты');
    }
  }

  int getCurrentEnergyPrice() {
    return (pow(2, (mainRepository.user.maxEnergy ~/ 1000 - 1)) as int) * 1000;
  }

  int getCurrentEnergyLvl() {
    return mainRepository.user.maxEnergy ~/ 1000;
  }

  int getCurrentRechargingPrise() {
    return (pow(2, mainRepository.user.rechargingSpeed - 1) as int) * 1000;
  }

  int getCurrentRechargingLvl() {
    return mainRepository.user.rechargingSpeed;
  }

  int getCurrentMultiTapPrice() {
    return (pow(2, mainRepository.user.scorePerClick - 1) as int) * 1000;
  }

  int getCurrentMultiTapLvl() {
    return mainRepository.user.scorePerClick;
  }
}
