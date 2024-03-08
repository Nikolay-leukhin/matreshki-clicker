import 'package:flutter/material.dart';
import 'package:matreshka/app.dart';
import 'package:matreshka/features/boosts/ui/boosts_screen.dart';
import 'package:matreshka/features/inventory/ui/inventory_screen.dart';
import 'package:matreshka/features/market/ui/market_screen.dart';
import 'package:matreshka/routes/routes_names.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.main:
        return MaterialPageRoute(builder: (ctx) => const AppStatesWidget());
      case AppRouteNames.boosts:
        return MaterialPageRoute(builder: (ctx) => const BoostsScreen());
      case AppRouteNames.market:
        return MaterialPageRoute(builder: (ctx) => const MarketScreen());
      case AppRouteNames.inventory:
        return MaterialPageRoute(builder: (ctx) => const InventoryScreen());
      default:
        return MaterialPageRoute(builder: (ctx) => const AppStatesWidget());
    }
  }
}
