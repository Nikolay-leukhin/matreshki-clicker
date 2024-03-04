import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matreshka/features/app/cubit/app_cubit.dart';
import 'package:matreshka/features/main/ui/main_screen.dart';
import 'package:matreshka/routes/routes.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'matreshki',
      onGenerateRoute: AppRoutes.generateRoute,
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!),
    );
  }
}

class AppStatesWidget extends StatelessWidget {
  const AppStatesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is AppDataLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is AppDataLoaded) {
          return MainScreen();
        }
        return Container();
      },
    );
  }
}
