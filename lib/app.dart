import 'package:flutter/material.dart';
import 'package:matreshka/routes/routes.dart';
import 'package:matreshka/routes/routes_names.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'matreshki',
      initialRoute: AppRouteNames.main,
      onGenerateRoute: AppRoutes.generateRoute,
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!),
    );
  }
}
