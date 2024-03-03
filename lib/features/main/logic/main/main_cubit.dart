import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:matreshka/features/main/data/main_repository.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final MainRepository mainRepository;

  MainCubit(this.mainRepository) : super(MainInitial());

  incrementScore() {
    mainRepository.incrementUserScore();
    emit(ScoreUpdated());
  }
}
