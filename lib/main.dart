import 'package:finance/cubit/fetch_data/fetch_data_cubit.dart';
import 'package:finance/data/models/finance_model.dart';
import 'package:finance/screens/home_screen.dart';
import 'package:finance/screens/on_boarding_screen.dart';
import 'package:finance/screens/splash_screen.dart';
import 'package:finance/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FinanceModelAdapter());
  await Hive.openBox<FinanceModel>('financeBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchDataCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Locale('ar'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: SplashScreen(),
        routes: {
          '/home_screen' : (context) => const HomeScreen(),
          '/on_boarding_screen' : (context) => const OnBoardingScreen(),
        },
      ),
    );
  }
}
