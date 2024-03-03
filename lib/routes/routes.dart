import 'package:flutter/material.dart';
import 'package:matreshka/features/main/ui/main_screen.dart';
import 'package:matreshka/routes/routes_names.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.root:
        return MaterialPageRoute(
            builder: (ctx) =>
                const MainScreen()); // return NoAnimationMaterialPageRoute(builder: (ctx) => const AppStateWidget());
      default:
        return MaterialPageRoute(
            builder: (ctx) => Container(
                  color: Colors.red,
                ));
    }
  }
}
