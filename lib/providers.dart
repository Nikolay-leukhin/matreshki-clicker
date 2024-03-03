import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matreshka/app.dart';
import 'package:matreshka/features/app/cubit/app_cubit.dart';
import 'package:matreshka/features/main/data/main_repository.dart';
import 'package:matreshka/features/main/logic/main/main_cubit.dart';

class AppRepositoryProviders extends StatelessWidget {
  const AppRepositoryProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(
        create: (context) => MainRepository(),
        lazy: false,
      )
    ], child: AppBlocProviders());
  }
}

class AppBlocProviders extends StatelessWidget {
  const AppBlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    final marketRepository = RepositoryProvider.of<MainRepository>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit(marketRepository),
        ),
        BlocProvider(create: (context) => AppCubit(marketRepository))
      ],
      child: MyApp(),
    );
  }
}
