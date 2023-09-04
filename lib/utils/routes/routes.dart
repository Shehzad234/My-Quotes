import 'package:flutter/material.dart';
import 'package:quotes_app/utils/routes/routes_name.dart';
import 'package:quotes_app/view/about.dart';
import 'package:quotes_app/view/contact_us.dart';
import 'package:quotes_app/view/downloads.dart';
import 'package:quotes_app/view/favorites.dart';
import 'package:quotes_app/view/home.dart';
import 'package:quotes_app/view/login.dart';
import 'package:quotes_app/view/preview.dart';
import 'package:quotes_app/view/signup.dart';
import 'package:quotes_app/view/splash.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesName.signupScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RoutesName.favoritesScreen:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());

      case RoutesName.downloadsScreen:
        return MaterialPageRoute(builder: (_) => const DownlaodScreen());

      case RoutesName.previewScreen:
        return MaterialPageRoute(
            builder: (_) =>
                PreviewScreen(data: settings.arguments as dynamic));

      case RoutesName.contactUsScreen:
        return MaterialPageRoute(
            builder: (_) => const ContactUsScreen());
      
      case RoutesName.aboutUsScreen:
        return MaterialPageRoute(
            builder: (_) => const AboutUs());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('Invalid Route'),
            ),
          );
        });
    }
  }
}
