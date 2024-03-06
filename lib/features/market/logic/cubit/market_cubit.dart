import 'package:bloc/bloc.dart';
import 'package:matreshka/features/market/data/market_repository.dart';
import 'package:meta/meta.dart';

part 'market_state.dart';

class MarketCubit extends Cubit<MarketState> {
  final MarketRepository marketRepository;

  MarketCubit(this.marketRepository) : super(MarketInitial());

  Future<void> loadMarketItems() async {
    emit(MarketLoading());

    try {
      await marketRepository.loadMarketPromocodes();
      await marketRepository.loadMarketSkins();
      emit(MarketSuccess());
    } catch (e) {
      emit(MarketFail());
    }
  }
}
