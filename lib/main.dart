import 'package:finance/cubit/fetch_data/fetch_data_cubit.dart';
import 'package:finance/data/models/finance_model.dart';
import 'package:finance/screens/home_screen.dart';
import 'package:finance/screens/on_boarding_screen.dart';
import 'package:finance/screens/splash_screen.dart';
import 'package:finance/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  Hive.registerAdapter(FinanceModelAdapter());
  await Hive.openBox('darkModeBox');
  await Hive.openBox('languageBox');
  await Hive.openBox('showOnBoardingBox');
  await Hive.openBox<FinanceModel>('financeBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('darkModeBox').listenable(),
      builder: (context, value, child) {
        var darkMode = value.get('darkMode', defaultValue: false);
        return BlocProvider(
          create: (context) => FetchDataCubit(),
          child: ValueListenableBuilder(
            valueListenable: Hive.box('languageBox').listenable(),
            builder: (context, box, child) {
              String language = box.get('language', defaultValue: 'en');
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                locale: Locale(language),
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  appBarTheme: AppBarTheme(
                    titleSpacing: 0,
                    titleTextStyle: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: kWhiteColor),
                    elevation: 0,
                    color: Colors.transparent,
                    surfaceTintColor: Colors.black,
                  ),
                ),
                theme: ThemeData(
                  brightness: Brightness.light,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                    titleSpacing: 0,
                    titleTextStyle: Theme.of(context).textTheme.titleLarge,
                    backgroundColor: Colors.white,
                    surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
                themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
                home: SplashScreen(),
                routes: {
                  '/home_screen': (context) => const HomeScreen(),
                  '/on_boarding_screen': (context) => const OnBoardingScreen(),
                },
              );
            },
          ),
        );
      },
    );
  }
}
