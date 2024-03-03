part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

final class AppDataLoaded extends AppState {}

final class AppDataLoading extends AppState {}

