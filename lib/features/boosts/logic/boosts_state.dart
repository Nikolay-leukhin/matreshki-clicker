part of 'boosts_cubit.dart';

@immutable
abstract class BoostsState {}

class BoostsInitial extends BoostsState {}

class BoostsSuccess extends BoostsState {}

class BoostsFail extends BoostsState {}

class BoostsLoading extends BoostsState {}
