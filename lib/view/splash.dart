import 'package:flutter/material.dart';
import 'package:quotes_app/repo/downloads_repo.dart';
import 'package:quotes_app/repo/favorite_repo.dart';
import 'package:quotes_app/repo/home_repo.dart';
import 'package:quotes_app/res/constants/app_colors.dart';
import 'package:quotes_app/res/constants/app_fonts.dart';
import 'package:quotes_app/utils/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final List<String> animatedText;

  final splashDuration = const Duration(seconds: 3);
  @override
  void initState() {
    loadWidget();
    super.initState();
    HomeRepo.checkStoragePermission(context);
    FavoritesRepo.setInitialFavorite(context).then((value) => DownloadsRepo.getDownloadedFiles(context));
    var letters = "Quotes".split("");

    animatedText = [];

    Future.delayed(const Duration(milliseconds: 50)).then((_) {
      setState(() {
        animatedText.add(letters[0]);
      });
    });

    for (var i = 1; i < letters.length; i++) {
      Future.delayed(Duration(milliseconds: 200 * i)).then((_) {
        setState(() {
          animatedText.add(letters[i]);
        });
      });
    }
  }

  loadWidget() async {
    await Future.delayed(splashDuration);
    navigateToLogin();
  }

  navigateToLogin() {
    Navigator.popAndPushNamed(context, RoutesName.homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                animatedText.join(),
                style: const TextStyle(
                  fontSize: 30,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: adelia,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            child: const Text(
              'By BetaByte',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w100,
              ),
            ),
          )
        ],
      ),
    );
  }
}
