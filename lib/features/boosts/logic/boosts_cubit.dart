import 'package:bloc/bloc.dart';
import 'package:matreshka/features/boosts/data/boosts_repository.dart';
import 'package:meta/meta.dart';

part 'boosts_state.dart';

class BoostsCubit extends Cubit<BoostsState> {
  final BoostsRepository boostsRepository;

  BoostsCubit({required this.boostsRepository}) : super(BoostsInitial());

  Future<void> extendEnergyLimit() async {
    emit(BoostsLoading());
    try {
      await boostsRepository.extendEnergyLimit();
      emit(BoostsSuccess());
    } catch (e) {
      emit(BoostsFail());
    }
  }

  Future<void> incrementScorePerClick() async {
    emit(BoostsLoading());
    try {
      await boostsRepository.incrementScorePerClick();
      emit(BoostsSuccess());
    } catch (e) {
      emit(BoostsFail());
    }
  }

  Future<void> getFullEnergy() async {
    emit(BoostsLoading());
    try {
      await boostsRepository.getFullEnergy();
      emit(BoostsSuccess());
    } catch (e) {
      emit(BoostsFail());
    }
  }

  Future<void> incrementRechargingSpeed() async {
    emit(BoostsLoading());
    try {
      await boostsRepository.incrementRechargingSpeed();
      emit(BoostsSuccess());
    } catch (e) {
      emit(BoostsFail());
    }
  }
}
