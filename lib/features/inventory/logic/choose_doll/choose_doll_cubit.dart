import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:matreshka/features/main/data/main_repository.dart';
import 'package:meta/meta.dart';

part 'choose_doll_state.dart';

class ChooseDollCubit extends Cubit<ChooseDollState> {
  final MainRepository mainRepository;

  ChooseDollCubit(this.mainRepository) : super(ChooseDollInitial());

  Future<void> changeDoll(String newDollId) async {
    emit(ChooseDollLoading());
    try {
      await mainRepository.changeDoll(newDollId);
      emit(ChooseDollSuccess());
    } catch (e) {
      emit(ChooseDollFailure());
    }
  }
}
