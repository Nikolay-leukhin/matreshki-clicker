part of 'buy_cubit.dart';

@immutable
sealed class BuyState {}

final class BuyInitial extends BuyState {}

final class BuyLoading extends BuyState {}

final class BuySuccess extends BuyState {}

final class BuyFailure extends BuyState {}
