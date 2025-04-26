import 'package:finance/screens/home_screen.dart';
import 'package:finance/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      home: SplashScreen(),
      routes: {
        '/home_screen' : (context) => const HomeScreen()
      },
    );
  }
}
