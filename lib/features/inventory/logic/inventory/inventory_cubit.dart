import 'package:bloc/bloc.dart';
import 'package:matreshka/features/main/data/main_repository.dart';
import 'package:matreshka/services/firebase/firebase_collections.dart';
import 'package:meta/meta.dart';

part 'inventory_state.dart';

class InventoryCubit extends Cubit<InventoryState> {
  final MainRepository mainRepository;

  InventoryCubit(this.mainRepository) : super(InventoryInitial());

  void loadUserItems() async {
    emit(InventoryLoading());

    try {
      final userDoc = FirebaseCollections.userCollection
          .doc(mainRepository.user.id.toString());
      final user = await userDoc.get();

      final userSkins = await mainRepository.loadUserSkins(user['user_skins']);
      final userPromo = await mainRepository.loadUserPromo(user['user_promo']);

      mainRepository.user.userSkins = userSkins;
      mainRepository.user.userPromo = userPromo;

      emit(InventorySuccess());
    } catch (e) {
      print(e);
      emit(InventoryFail());
    }
  }
}
