import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matreshka/app.dart';
import 'package:matreshka/features/app/cubit/app_cubit.dart';
import 'package:matreshka/features/inventory/logic/choose_doll/choose_doll_cubit.dart';
import 'package:matreshka/features/inventory/logic/inventory/inventory_cubit.dart';
import 'package:matreshka/features/main/data/main_repository.dart';
import 'package:matreshka/features/main/logic/main/main_cubit.dart';
import 'package:matreshka/features/market/data/market_repository.dart';
import 'package:matreshka/features/market/logic/buy/buy_cubit.dart';
import 'package:matreshka/features/market/logic/cubit/market_cubit.dart';

class AppRepositoryProviders extends StatelessWidget {
  const AppRepositoryProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(
        create: (context) => MainRepository(),
        lazy: false,
      ),
      RepositoryProvider(
        create: (context) => MarketRepository(),
        lazy: false,
      )
    ], child: AppBlocProviders());
  }
}

class AppBlocProviders extends StatelessWidget {
  const AppBlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    final mainRepository = RepositoryProvider.of<MainRepository>(context);
    final marketRepository = RepositoryProvider.of<MarketRepository>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit(mainRepository),
        ),
        BlocProvider(create: (context) => AppCubit(mainRepository)),
        BlocProvider(create: (context) => MarketCubit(marketRepository)),
        BlocProvider(create: (context) => InventoryCubit(mainRepository)),
        BlocProvider(create: (context) => ChooseDollCubit(mainRepository)),
        BlocProvider(create: (context) => BuyCubit(mainRepository))
      ],
      child: MyApp(),
    );
  }
}
