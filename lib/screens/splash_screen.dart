import 'package:finance/screens/home_screen.dart';
import 'package:finance/screens/on_boarding_screen.dart';
import 'package:finance/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/adapters.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ValueListenableBuilder(
                valueListenable: Hive.box('showOnBoardingBox').listenable(),
                builder: (context, value, child) {
                  var isShowOnBoarding =
                  value.get('isShowOnBoarding', defaultValue: false);
                  return isShowOnBoarding ? HomeScreen() : OnBoardingScreen();
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/logo.svg'),
            SizedBox(
              height: 20,
            ),
            Text(
              'Finance',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: kPrimaryGreen),
            )
          ],
        ),
      ),
    );
  }
}
