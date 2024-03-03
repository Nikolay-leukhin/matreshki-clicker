import 'package:flutter/material.dart';
import 'package:matreshka/features/boosts/ui/boosts_screen.dart';
import 'package:matreshka/features/main/ui/main_screen.dart';
import 'package:matreshka/features/market/ui/market_screen.dart';
import 'package:matreshka/routes/routes_names.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.main:
        return MaterialPageRoute(builder: (ctx) => const MainScreen());
      case AppRouteNames.boosts:
        return MaterialPageRoute(builder: (ctx) => const BoostsScreen());
      case AppRouteNames.market:
        return MaterialPageRoute(builder: (ctx) => const MarketScreen());
      default:
        return MaterialPageRoute(
            builder: (ctx) => Container(
                  color: Colors.red,
                ));
    }
  }
}
