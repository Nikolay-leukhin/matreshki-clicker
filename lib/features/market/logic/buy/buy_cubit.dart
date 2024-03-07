import 'package:bloc/bloc.dart';
import 'package:matreshka/features/main/data/main_repository.dart';
import 'package:meta/meta.dart';

part 'buy_state.dart';

enum ProductTypes { promo, skin }

class BuyCubit extends Cubit<BuyState> {
  final MainRepository mainRepository;

  BuyCubit(this.mainRepository) : super(BuyInitial());

  void buyItem(ProductTypes type, dynamic item) async {
    emit(BuyLoading());
    try {
      switch (type) {
        case ProductTypes.promo:
          await mainRepository.buyPromo(item);
          break;
        case ProductTypes.skin:
          await mainRepository.buySkin(item);
          break;
        default:
          throw Exception();
      }
      emit(BuySuccess());
    } catch (e) {
      emit(BuyFailure());
    }
  }
}
