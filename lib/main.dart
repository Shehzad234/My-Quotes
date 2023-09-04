import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/utils/routes/routes.dart';
import 'package:quotes_app/utils/routes/routes_name.dart';
import 'package:quotes_app/view_model/download_view_model.dart';
import 'package:quotes_app/view_model/favorites_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quotes_app/view_model/home_view_model.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => DownloadViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quotes',
        theme: ThemeData(
          primaryIconTheme: IconThemeData(color: Colors.white),
          useMaterial3: true,
          // appBarTheme: AppBarTheme()
        ),
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
