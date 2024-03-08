import 'package:bloc/bloc.dart';
import 'package:matreshka/features/main/data/main_repository.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final MainRepository mainRepository;

  AppCubit(this.mainRepository) : super(AppInitial()) {
    loadData();
  }

  loadData() async {
    emit(AppDataLoading());

    await mainRepository.initData();
    emit(AppDataLoaded());
  }
}
