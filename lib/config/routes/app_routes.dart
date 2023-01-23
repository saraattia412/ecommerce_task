import 'package:flutter/material.dart';

import '../../features/home/presentation/views/home_screens.dart';
import '../../features/splash/presentation/views/splash_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case '/home':
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      
      default:
        return null;
    }
  }
}
