part of 'choose_doll_cubit.dart';

@immutable
sealed class ChooseDollState {}

final class ChooseDollInitial extends ChooseDollState {}

final class ChooseDollLoading extends ChooseDollState {}

final class ChooseDollSuccess extends ChooseDollState {}

final class ChooseDollFailure extends ChooseDollState {}
